package com.alexcoila.enfoque.blocker

import java.time.Duration
import java.time.LocalDate
import java.time.LocalTime
import java.time.ZoneId
import java.time.ZonedDateTime

/** Regla semanal guardada en el celular (copia de [ReminderRuleDto]). */
data class ReminderRule(
    val blockId: Long,
    /** 1 = lunes ... 7 = domingo (igual que `DayOfWeek.value` y Dart). */
    val weekdays: Set<Int>,
    val startMinute: Int,
    val title: String,
    val detail: String,
)

enum class ReminderKind { BEFORE, START }

data class ReminderEvent(val rule: ReminderRule, val kind: ReminderKind, val at: ZonedDateTime) {
    companion object {
        /** Igual que `ScheduleCalculator.reminderLead` en Dart. */
        val LEAD: Duration = Duration.ofMinutes(10)
    }
}

/** Lógica pura: cuál es el próximo aviso a programar. */
object ReminderPlanner {
    fun next(rules: List<ReminderRule>, now: ZonedDateTime): ReminderEvent? {
        val zone: ZoneId = now.zone
        val today: LocalDate = now.toLocalDate()
        var best: ReminderEvent? = null
        for (offset in 0L..7L) {
            val day = today.plusDays(offset)
            for (rule in rules) {
                if (day.dayOfWeek.value !in rule.weekdays) continue
                val time = LocalTime.of(rule.startMinute / 60, rule.startMinute % 60)
                val start = day.atTime(time).atZone(zone)
                for (event in listOf(
                    ReminderEvent(rule, ReminderKind.BEFORE, start.minus(ReminderEvent.LEAD)),
                    ReminderEvent(rule, ReminderKind.START, start),
                )) {
                    if (!event.at.isAfter(now)) continue
                    val current = best
                    if (current == null || event.at.isBefore(current.at)) best = event
                }
            }
        }
        return best
    }
}
