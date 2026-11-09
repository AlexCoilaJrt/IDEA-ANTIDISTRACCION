package com.alexcoila.enfoque.blocker

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.os.VibrationEffect
import android.os.Vibrator
import android.os.VibratorManager
import android.os.Build
import com.alexcoila.enfoque.R

/**
 * Avisos con sonido y vibración al cambiar de fase y al terminar la sesión.
 * Si el usuario no dio permiso de notificaciones, al menos vibra.
 */
class PhaseNotifier(private val context: Context) {

    private val manager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

    init {
        val channel = NotificationChannel(
            CHANNEL_ID,
            context.getString(R.string.phase_channel_name),
            NotificationManager.IMPORTANCE_HIGH,
        ).apply {
            description = context.getString(R.string.phase_channel_description)
            enableVibration(true)
            vibrationPattern = PATTERN
        }
        manager.createNotificationChannel(channel)
    }

    fun show(alert: PhaseAlert, strict: Boolean) {
        val (title, text) = when (alert) {
            is PhaseAlert.BreakStarted -> {
                val title = context.getString(
                    if (alert.long) R.string.phase_long_break_title else R.string.phase_break_title,
                    alert.minutes,
                )
                title to context.getString(
                    if (strict) R.string.phase_break_text_strict else R.string.phase_break_text,
                )
            }
            is PhaseAlert.FocusStarted -> context.getString(R.string.phase_focus_title) to
                context.getString(R.string.phase_focus_text, alert.cycle, alert.totalCycles)
        }
        post(title, text)
    }

    fun sessionFinished() {
        post(
            context.getString(R.string.phase_done_title),
            context.getString(R.string.phase_done_text),
        )
    }

    private fun post(title: String, text: String) {
        if (!AndroidPlatform.notificationsEnabled(context)) {
            vibrate()
            return
        }
        val launch = context.packageManager.getLaunchIntentForPackage(context.packageName)
        val contentIntent = launch?.let {
            PendingIntent.getActivity(context, 1, it, PendingIntent.FLAG_IMMUTABLE)
        }
        val notification = Notification.Builder(context, CHANNEL_ID)
            .setSmallIcon(android.R.drawable.ic_popup_reminder)
            .setContentTitle(title)
            .setContentText(text)
            .setStyle(Notification.BigTextStyle().bigText(text))
            .setCategory(Notification.CATEGORY_ALARM)
            .setAutoCancel(true)
            .setContentIntent(contentIntent)
            .build()
        runCatching { manager.notify(NOTIFICATION_ID, notification) }
    }

    private fun vibrate() {
        val vibrator = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            (context.getSystemService(Context.VIBRATOR_MANAGER_SERVICE) as VibratorManager).defaultVibrator
        } else {
            @Suppress("DEPRECATION")
            context.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        }
        runCatching { vibrator.vibrate(VibrationEffect.createWaveform(PATTERN, -1)) }
    }

    private companion object {
        const val CHANNEL_ID = "phase_alerts"
        const val NOTIFICATION_ID = 43
        val PATTERN = longArrayOf(0, 300, 200, 300)
    }
}
