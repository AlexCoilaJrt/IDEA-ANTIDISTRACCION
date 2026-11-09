package com.alexcoila.enfoque.blocker

import android.Manifest
import android.app.AlarmManager
import android.app.AppOpsManager
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.usage.UsageStatsManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.PowerManager
import android.os.Process
import android.provider.Settings
import android.telecom.TelecomManager

/** Consultas al sistema que el motor necesita. */
object AndroidPlatform {

    fun hasUsageAccess(context: Context): Boolean {
        val appOps = context.getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
        val mode = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            @Suppress("DEPRECATION")
            appOps.unsafeCheckOpNoThrow(
                AppOpsManager.OPSTR_GET_USAGE_STATS,
                Process.myUid(),
                context.packageName,
            )
        } else {
            @Suppress("DEPRECATION")
            appOps.checkOpNoThrow(
                AppOpsManager.OPSTR_GET_USAGE_STATS,
                Process.myUid(),
                context.packageName,
            )
        }
        return mode == AppOpsManager.MODE_ALLOWED
    }

    fun canDrawOverlays(context: Context): Boolean = Settings.canDrawOverlays(context)

    fun notificationsEnabled(context: Context): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            return context.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) ==
                PackageManager.PERMISSION_GRANTED
        }
        val manager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        return manager.areNotificationsEnabled()
    }

    fun ignoresBatteryOptimizations(context: Context): Boolean {
        val power = context.getSystemService(Context.POWER_SERVICE) as PowerManager
        return power.isIgnoringBatteryOptimizations(context.packageName)
    }

    /** Lanzadores (pantalla de inicio) y marcador por defecto: nunca se bloquean. */
    fun systemAllowedPackages(context: Context): Set<String> {
        val pm = context.packageManager
        val home = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME)
        @Suppress("DEPRECATION")
        val launchers = pm.queryIntentActivities(home, 0).map { it.activityInfo.packageName }
        val telecom = context.getSystemService(Context.TELECOM_SERVICE) as? TelecomManager
        val dialer = telecom?.defaultDialerPackage
        return (launchers + listOfNotNull(dialer)).toSet()
    }

    /** Lee los eventos de UsageStats entre [fromMillis] y [toMillis]. */
    fun queryForegroundEvents(
        context: Context,
        fromMillis: Long,
        toMillis: Long,
    ): List<ForegroundEvent> {
        val usm = context.getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val events = usm.queryEvents(fromMillis, toMillis) ?: return emptyList()
        val result = mutableListOf<ForegroundEvent>()
        val event = android.app.usage.UsageEvents.Event()
        while (events.hasNextEvent()) {
            events.getNextEvent(event)
            if (event.eventType == ForegroundTracker.ACTIVITY_RESUMED) {
                result += ForegroundEvent(event.packageName, event.eventType, event.timeStamp)
            }
        }
        return result
    }

    // --- Vigilante: si el sistema mata el servicio, una alarma lo revive. ---

    private const val WATCHDOG_INTERVAL = 15 * 60_000L
    const val ACTION_WATCHDOG = "com.alexcoila.enfoque.action.WATCHDOG"

    private fun watchdogIntent(context: Context): PendingIntent {
        val intent = Intent(context, RestartReceiver::class.java).setAction(ACTION_WATCHDOG)
        return PendingIntent.getBroadcast(
            context,
            0,
            intent,
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
        )
    }

    /**
     * Alarma inexacta (no requiere SCHEDULE_EXACT_ALARM). Con la optimización de
     * batería desactivada, la app puede volver a iniciar el servicio en primer plano.
     */
    fun scheduleWatchdog(context: Context) {
        val alarms = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        alarms.setAndAllowWhileIdle(
            AlarmManager.RTC_WAKEUP,
            System.currentTimeMillis() + WATCHDOG_INTERVAL,
            watchdogIntent(context),
        )
    }

    fun cancelWatchdog(context: Context) {
        val alarms = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        alarms.cancel(watchdogIntent(context))
    }
}
