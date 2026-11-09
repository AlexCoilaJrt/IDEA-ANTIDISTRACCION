package com.alexcoila.enfoque.blocker

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import com.alexcoila.enfoque.R

/**
 * Servicio en primer plano (`specialUse`) que vigila la app en primer plano y
 * muestra la pantalla de bloqueo si no está permitida.
 */
class FocusService : Service() {

    private val handler = Handler(Looper.getMainLooper())
    private lateinit var store: SessionStore
    private lateinit var policy: BlockPolicy
    private lateinit var overlay: BlockOverlay
    private val tracker = ForegroundTracker()
    private val counter = DistractionCounter()
    private var allowedLabels: List<Pair<String, String>> = emptyList()
    private var lastQueryAt = 0L
    private var running = false

    private val tick = object : Runnable {
        override fun run() {
            if (!running) return
            poll()
            handler.postDelayed(this, POLL_INTERVAL_MS)
        }
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onCreate() {
        super.onCreate()
        store = SessionStore(this)
        overlay = BlockOverlay(
            context = this,
            onBackToApp = { openOwnApp(requestExit = false) },
            onOpenAllowed = { pkg -> openPackage(pkg) },
            onExitEarly = { openOwnApp(requestExit = true) },
        )
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        startInForeground()
        if (!store.isActive) {
            stopEverything()
            return START_NOT_STICKY
        }
        if (!running) {
            policy = BlockPolicy(
                ownPackage = packageName,
                allowedPackages = store.allowedPackages,
                systemAllowed = AndroidPlatform.systemAllowedPackages(this),
            )
            allowedLabels = store.allowedPackages.mapNotNull { pkg -> labelFor(pkg)?.let { pkg to it } }
                .sortedBy { it.second.lowercase() }
            // Ventana inicial amplia para saber qué app está al frente ahora mismo.
            lastQueryAt = System.currentTimeMillis() - INITIAL_LOOKBACK_MS
            running = true
            handler.post(tick)
        }
        AndroidPlatform.scheduleWatchdog(this)
        return START_STICKY
    }

    override fun onDestroy() {
        running = false
        handler.removeCallbacksAndMessages(null)
        overlay.hide()
        super.onDestroy()
    }

    private fun poll() {
        val now = System.currentTimeMillis()
        if (now >= store.endsAt) {
            finishSession()
            return
        }
        if (!AndroidPlatform.hasUsageAccess(this)) {
            // Sin acceso de uso no podemos bloquear: la sesión queda interrumpida.
            val id = store.sessionId
            store.deactivate()
            BlockerEvents.interrupted(id)
            stopEverything()
            return
        }

        val events = AndroidPlatform.queryForegroundEvents(this, lastQueryAt, now)
        lastQueryAt = now - QUERY_OVERLAP_MS
        val foreground = tracker.consume(events)

        val inBreak = PomodoroClock.isBreak(store.plan, store.startedAt, now)
        val block = policy.shouldBlock(foreground, store.strictness, inBreak)

        if (counter.onPoll(foreground, block) && foreground != null) {
            store.addDistraction(foreground, now)
            BlockerEvents.distraction(DistractionDto(packageName = foreground, atMillis = now))
        }

        if (block) {
            overlay.show(allowedLabels)
            overlay.update(store.endsAt - now, inBreak)
        } else {
            overlay.hide()
        }
    }

    private fun finishSession() {
        val id = store.sessionId
        store.deactivate()
        BlockerEvents.finished(id)
        stopEverything()
    }

    private fun stopEverything() {
        running = false
        handler.removeCallbacksAndMessages(null)
        overlay.hide()
        AndroidPlatform.cancelWatchdog(this)
        stopForeground(STOP_FOREGROUND_REMOVE)
        stopSelf()
    }

    private fun openOwnApp(requestExit: Boolean) {
        if (requestExit) {
            store.requestExit()
            BlockerEvents.exitRequested()
        }
        val intent = packageManager.getLaunchIntentForPackage(packageName) ?: return
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_REORDER_TO_FRONT)
        startActivity(intent)
        overlay.hide()
    }

    private fun openPackage(pkg: String) {
        val intent = packageManager.getLaunchIntentForPackage(pkg) ?: return
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        startActivity(intent)
        overlay.hide()
    }

    private fun labelFor(pkg: String): String? = runCatching {
        val info = packageManager.getApplicationInfo(pkg, 0)
        packageManager.getApplicationLabel(info).toString()
    }.getOrNull()

    private fun startInForeground() {
        val manager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        val channel = NotificationChannel(
            CHANNEL_ID,
            getString(R.string.channel_name),
            NotificationManager.IMPORTANCE_LOW,
        ).apply { description = getString(R.string.channel_description) }
        manager.createNotificationChannel(channel)

        val launch = packageManager.getLaunchIntentForPackage(packageName)
        val contentIntent = launch?.let {
            PendingIntent.getActivity(this, 0, it, PendingIntent.FLAG_IMMUTABLE)
        }
        val endsAt = SessionStore(this).endsAt
        val notification = Notification.Builder(this, CHANNEL_ID)
            .setSmallIcon(android.R.drawable.ic_lock_idle_lock)
            .setContentTitle(getString(R.string.notification_title))
            .setContentText(getString(R.string.notification_text))
            .setOngoing(true)
            .setContentIntent(contentIntent)
            .apply {
                if (endsAt > 0) {
                    setWhen(endsAt)
                    setUsesChronometer(true)
                    setChronometerCountDown(true)
                }
            }
            .build()

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            startForeground(NOTIFICATION_ID, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE)
        } else {
            startForeground(NOTIFICATION_ID, notification)
        }
    }

    companion object {
        private const val CHANNEL_ID = "focus_session"
        private const val NOTIFICATION_ID = 42
        private const val POLL_INTERVAL_MS = 700L
        private const val INITIAL_LOOKBACK_MS = 10 * 60_000L
        private const val QUERY_OVERLAP_MS = 1_000L

        fun start(context: Context) {
            context.startForegroundService(Intent(context, FocusService::class.java))
        }

        fun stop(context: Context) {
            context.stopService(Intent(context, FocusService::class.java))
        }
    }
}
