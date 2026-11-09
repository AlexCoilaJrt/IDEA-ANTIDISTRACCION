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
    )

    override fun requestPermission(kind: PermissionKindDto) {
        val packageUri = Uri.parse("package:${context.packageName}")
        val intent = when (kind) {
            PermissionKindDto.USAGE_ACCESS -> Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS)
            PermissionKindDto.OVERLAY ->
                Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, packageUri)
            PermissionKindDto.BATTERY_OPTIMIZATION ->
                Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS, packageUri)
            PermissionKindDto.NOTIFICATIONS -> {
                val current = activity()
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && current != null) {
                    current.requestPermissions(arrayOf(Manifest.permission.POST_NOTIFICATIONS), 1)
                    return
                }
                Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                    .putExtra(Settings.EXTRA_APP_PACKAGE, context.packageName)
            }
        }
        start(intent)
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
    }
}
