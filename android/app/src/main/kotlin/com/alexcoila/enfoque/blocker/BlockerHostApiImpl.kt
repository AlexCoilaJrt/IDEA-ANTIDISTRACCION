package com.alexcoila.enfoque.blocker

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.Canvas
import android.net.Uri
import android.os.Build
import android.provider.Settings
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.ByteArrayOutputStream

/** Implementación nativa de [BlockerHostApi]. */
class BlockerHostApiImpl(
    private val context: Context,
    private val activity: () -> Activity?,
) : BlockerHostApi {

    private val store = SessionStore(context)

    override fun startSession(config: SessionConfigDto) {
        store.start(config)
        FocusService.start(context)
    }

    override fun stopSession() {
        store.clear()
        AndroidPlatform.cancelWatchdog(context)
        FocusService.stop(context)
    }

    override fun getStatus(): BlockerStatusDto = store.status()

    override fun consumeExitRequest(): Boolean = store.consumeExitRequest()

    override fun getPermissions(): PermissionsDto = PermissionsDto(
        usageAccess = AndroidPlatform.hasUsageAccess(context),
        overlay = AndroidPlatform.canDrawOverlays(context),
        notifications = AndroidPlatform.notificationsEnabled(context),
        batteryOptimization = AndroidPlatform.ignoresBatteryOptimizations(context),
        exactAlarms = Reminders.canScheduleExact(context),
    )

    override fun requestPermission(kind: PermissionKindDto) {
        val packageUri = Uri.parse("package:${context.packageName}")
        when (kind) {
            // Con el paquete, muchos celulares abren directo la página de la app
            // en vez de toda la lista. Si no lo soportan, se abre la lista.
            PermissionKindDto.USAGE_ACCESS -> startFirstAvailable(
                Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS, packageUri),
                Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS),
            )
            PermissionKindDto.OVERLAY -> startFirstAvailable(
                Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, packageUri),
                Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION),
            )
            PermissionKindDto.BATTERY_OPTIMIZATION -> startFirstAvailable(
                Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS, packageUri),
                Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS),
            )
            PermissionKindDto.NOTIFICATIONS -> requestNotifications()
            PermissionKindDto.EXACT_ALARMS -> {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    startFirstAvailable(
                        Intent(Settings.ACTION_REQUEST_SCHEDULE_EXACT_ALARM, packageUri),
                        Intent(Settings.ACTION_REQUEST_SCHEDULE_EXACT_ALARM),
                    )
                }
            }
        }
    }

    override fun setReminderRules(rules: List<ReminderRuleDto>) {
        Reminders.setRules(context, rules)
    }

    override fun consumeStartRequest(): Long? = Reminders.consumeStartRequest(context)

    override fun openAppDetails() {
        startFirstAvailable(
            Intent(
                Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                Uri.parse("package:${context.packageName}"),
            ),
        )
    }

    /**
     * La primera vez muestra la pregunta de Android. Si el usuario ya la
     * rechazó, Android no la vuelve a mostrar: entonces se abren los ajustes
     * de notificaciones de la app.
     */
    private fun requestNotifications() {
        val current = activity()
        val prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
        val askedBefore = prefs.getBoolean(KEY_NOTIF_ASKED, false)
        val canAsk = Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && current != null &&
            (!askedBefore ||
                current.shouldShowRequestPermissionRationale(Manifest.permission.POST_NOTIFICATIONS))
        if (canAsk) {
            prefs.edit().putBoolean(KEY_NOTIF_ASKED, true).apply()
            current!!.requestPermissions(arrayOf(Manifest.permission.POST_NOTIFICATIONS), 1)
            return
        }
        startFirstAvailable(
            Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                .putExtra(Settings.EXTRA_APP_PACKAGE, context.packageName),
            Intent(
                Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                Uri.parse("package:${context.packageName}"),
            ),
        )
    }

    /** Abre la primera pantalla que el celular sepa manejar. */
    private fun startFirstAvailable(vararg intents: Intent) {
        for (intent in intents) {
            val opened = runCatching { start(intent) }.isSuccess
            if (opened) return
        }
    }

    override suspend fun getLaunchableApps(): List<InstalledAppDto> = withContext(Dispatchers.IO) {
        val pm = context.packageManager
        val launcher = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
        @Suppress("DEPRECATION")
        pm.queryIntentActivities(launcher, 0)
            .asSequence()
            .map { it.activityInfo }
            .filter { it.packageName != context.packageName }
            .distinctBy { it.packageName }
            .map { info ->
                InstalledAppDto(
                    packageName = info.packageName,
                    label = info.loadLabel(pm).toString(),
                    iconPng = runCatching { iconToPng(info.loadIcon(pm)) }.getOrNull(),
                )
            }
            .sortedBy { it.label.lowercase() }
            .toList()
    }

    override fun launchApp(packageName: String) {
        val intent = context.packageManager.getLaunchIntentForPackage(packageName) ?: return
        start(intent)
    }

    private fun start(intent: Intent) {
        val current = activity()
        if (current != null) {
            current.startActivity(intent)
        } else {
            context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
        }
    }

    private fun iconToPng(drawable: android.graphics.drawable.Drawable): ByteArray {
        val bitmap = Bitmap.createBitmap(ICON_PX, ICON_PX, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)
        drawable.setBounds(0, 0, ICON_PX, ICON_PX)
        drawable.draw(canvas)
        return ByteArrayOutputStream().use { out ->
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, out)
            bitmap.recycle()
            out.toByteArray()
        }
    }

    private companion object {
        const val ICON_PX = 96
        const val PREFS = "enfoque_permissions"
        const val KEY_NOTIF_ASKED = "notifications_asked"
    }
}
