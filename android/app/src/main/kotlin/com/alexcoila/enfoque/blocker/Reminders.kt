package com.alexcoila.enfoque.blocker

import android.app.AlarmManager
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import com.alexcoila.enfoque.R
import org.json.JSONArray
import org.json.JSONObject
import java.time.ZonedDateTime
import java.time.format.DateTimeFormatter

/**
 * Recordatorios del horario: guarda las reglas, programa una alarma para el
 * próximo aviso y, al sonar, muestra la notificación y programa el siguiente.
 */
object Reminders {
    private const val PREFS = "enfoque_schedule"
    private const val KEY_RULES = "rules"
    private const val KEY_PENDING_START = "pending_start"
    private const val CHANNEL_ID = "study_reminders"
    const val ACTION_REMINDER = "com.alexcoila.enfoque.action.REMINDER"
    const val EXTRA_START_BLOCK = "start_block_id"
    private const val EXTRA_BLOCK = "block_id"
    private const val EXTRA_KIND = "kind"
    private const val EXTRA_AT = "at"

    fun setRules(context: Context, rules: List<ReminderRuleDto>) {
        val json = JSONArray()
        rules.forEach { r ->
            json.put(
                JSONObject()
                    .put("id", r.blockId)
                    .put("days", JSONArray(r.weekdays))
                    .put("start", r.startMinute)
                    .put("title", r.title)
                    .put("detail", r.detail),
            )
        }
        prefs(context).edit().putString(KEY_RULES, json.toString()).apply()
        scheduleNext(context)
    }

    fun rules(context: Context): List<ReminderRule> {
        val json = JSONArray(prefs(context).getString(KEY_RULES, "[]"))
        return (0 until json.length()).map { i ->
            val o = json.getJSONObject(i)
            val days = o.getJSONArray("days")
            ReminderRule(
                blockId = o.getLong("id"),
                weekdays = (0 until days.length()).map { days.getInt(it) }.toSet(),
                startMinute = o.getInt("start"),
                title = o.getString("title"),
                detail = o.getString("detail"),
            )
        }
    }

    /** Programa (o cancela) la alarma del próximo aviso. */
    fun scheduleNext(context: Context) {
        val alarms = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val event = ReminderPlanner.next(rules(context), ZonedDateTime.now())
        val pending = alarmIntent(context, event)
        if (event == null) {
            alarms.cancel(pending)
            return
        }
        val at = event.at.toInstant().toEpochMilli()
        if (canScheduleExact(context)) {
            alarms.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, at, pending)
        } else {
            // Sin permiso de alarmas puntuales: puede llegar unos minutos tarde.
            alarms.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, at, pending)
        }
    }

    fun canScheduleExact(context: Context): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return true
        val alarms = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        return alarms.canScheduleExactAlarms()
    }

    fun requestStart(context: Context, blockId: Long) {
        prefs(context).edit().putLong(KEY_PENDING_START, blockId).apply()
        notificationManager(context).cancel(notificationId(blockId))
    }

    fun consumeStartRequest(context: Context): Long? {
        val p = prefs(context)
        if (!p.contains(KEY_PENDING_START)) return null
        val id = p.getLong(KEY_PENDING_START, -1)
        p.edit().remove(KEY_PENDING_START).apply()
        return id.takeIf { it >= 0 }
    }

    /** Llamado por [ReminderReceiver] cuando suena la alarma. */
    fun onAlarm(context: Context, intent: Intent) {
        val blockId = intent.getLongExtra(EXTRA_BLOCK, -1)
        val kind = ReminderKind.entries.getOrNull(intent.getIntExtra(EXTRA_KIND, -1))
        val rule = rules(context).firstOrNull { it.blockId == blockId }
        // Si ya hay una sesión en curso no tiene sentido avisar.
        if (rule != null && kind != null && !SessionStore(context).isActive) {
            val at = intent.getLongExtra(EXTRA_AT, 0)
            show(context, rule, kind, at)
        }
        scheduleNext(context)
    }

    private fun show(context: Context, rule: ReminderRule, kind: ReminderKind, atMillis: Long) {
        if (!AndroidPlatform.notificationsEnabled(context)) return
        val manager = notificationManager(context)
        manager.createNotificationChannel(
            NotificationChannel(
                CHANNEL_ID,
                context.getString(R.string.reminder_channel_name),
                NotificationManager.IMPORTANCE_HIGH,
            ).apply { description = context.getString(R.string.reminder_channel_description) },
        )
        val start = java.time.Instant.ofEpochMilli(atMillis)
            .plus(if (kind == ReminderKind.BEFORE) ReminderEvent.LEAD else java.time.Duration.ZERO)
            .atZone(java.time.ZoneId.systemDefault())
        val time = start.format(DateTimeFormatter.ofPattern("HH:mm"))
        val title = when (kind) {
            ReminderKind.BEFORE -> context.getString(R.string.reminder_before_title, rule.title, time)
            ReminderKind.START -> context.getString(R.string.reminder_start_title, rule.title)
        }
        val launch = context.packageManager.getLaunchIntentForPackage(context.packageName)
            ?: return
        val open = PendingIntent.getActivity(
            context,
            notificationId(rule.blockId),
            launch,
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
        )
        val startNow = PendingIntent.getActivity(
            context,
            -notificationId(rule.blockId),
            Intent(launch).putExtra(EXTRA_START_BLOCK, rule.blockId)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP),
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
        )
        val notification = Notification.Builder(context, CHANNEL_ID)
            .setSmallIcon(android.R.drawable.ic_popup_reminder)
            .setContentTitle(title)
            .setContentText(rule.detail)
            .setStyle(Notification.BigTextStyle().bigText(rule.detail))
            .setCategory(Notification.CATEGORY_REMINDER)
            .setAutoCancel(true)
            .setContentIntent(open)
            .addAction(
                Notification.Action.Builder(
                    null,
                    context.getString(R.string.reminder_start_now),
                    startNow,
                ).build(),
            )
            .build()
        runCatching { manager.notify(notificationId(rule.blockId), notification) }
    }

    private fun alarmIntent(context: Context, event: ReminderEvent?): PendingIntent {
        val intent = Intent(context, ReminderReceiver::class.java).setAction(ACTION_REMINDER)
        if (event != null) {
            intent.putExtra(EXTRA_BLOCK, event.rule.blockId)
                .putExtra(EXTRA_KIND, event.kind.ordinal)
                .putExtra(EXTRA_AT, event.at.toInstant().toEpochMilli())
        }
        return PendingIntent.getBroadcast(
            context,
            0,
            intent,
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
        )
    }

    private fun notificationId(blockId: Long): Int = 1000 + (blockId % 100_000).toInt()

    private fun notificationManager(context: Context) =
        context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

    private fun prefs(context: Context) = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
}

/** Recibe la alarma del recordatorio y el cambio del permiso de alarmas. */
class ReminderReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        when (intent.action) {
            Reminders.ACTION_REMINDER -> Reminders.onAlarm(context, intent)
            else -> Reminders.scheduleNext(context)
        }
    }
}
