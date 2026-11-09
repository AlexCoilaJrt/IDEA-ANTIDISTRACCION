package com.alexcoila.enfoque.blocker

/**
 * Lógica pura del motor de bloqueo (sin dependencias de Android) para poder
 * probarla con JUnit.
 */

/** Plan Pomodoro: [cycles] bloques de [focusMinutes] separados por [breakMinutes]. */
data class PomodoroPlan(
    val focusMinutes: Int,
    val breakMinutes: Int,
    val cycles: Int,
) {
    val totalMillis: Long
        get() = (cycles.toLong() * focusMinutes + (cycles - 1).coerceAtLeast(0).toLong() * breakMinutes) * MINUTE

    companion object {
        const val MINUTE = 60_000L
    }
}

object PomodoroClock {
    /** `true` si en [nowMillis] la sesión está en un descanso. */
    fun isBreak(plan: PomodoroPlan, startedAtMillis: Long, nowMillis: Long): Boolean {
        val elapsed = nowMillis - startedAtMillis
        if (elapsed < 0 || plan.breakMinutes <= 0) return false
        if (elapsed >= plan.totalMillis) return false
        val cycleLength = (plan.focusMinutes + plan.breakMinutes) * PomodoroPlan.MINUTE
        val withinCycle = elapsed % cycleLength
        return withinCycle >= plan.focusMinutes * PomodoroPlan.MINUTE
    }
}

/** Decide si una app en primer plano debe bloquearse. */
class BlockPolicy(
    private val ownPackage: String,
    private val allowedPackages: Set<String>,
    private val systemAllowed: Set<String>,
) {
    fun isAllowed(packageName: String?): Boolean {
        if (packageName == null) return true
        if (packageName == ownPackage) return true
        if (packageName in allowedPackages) return true
        return packageName in systemAllowed || ALWAYS_ALLOWED.any { packageName == it }
    }

    fun shouldBlock(
        packageName: String?,
        strictness: StrictnessDto,
        inBreak: Boolean,
    ): Boolean {
        if (inBreak && strictness == StrictnessDto.STANDARD) return false
        return !isAllowed(packageName)
    }

    companion object {
        /** Partes del sistema que nunca se bloquean (llamadas, emergencias, permisos). */
        val ALWAYS_ALLOWED = setOf(
            "com.android.systemui",
            "com.android.phone",
            "com.android.server.telecom",
            "com.android.emergency",
            "com.google.android.dialer",
            "com.android.dialer",
            "com.android.permissioncontroller",
            "com.google.android.permissioncontroller",
        )
    }
}

/** Evento simplificado de UsageStats. */
data class ForegroundEvent(val packageName: String, val type: Int, val timeMillis: Long)

/**
 * Recuerda qué app está en primer plano a partir de los eventos de
 * `UsageStatsManager.queryEvents()`.
 */
class ForegroundTracker {
    var current: String? = null
        private set

    /** Procesa eventos (en cualquier orden) y devuelve la app en primer plano. */
    fun consume(events: List<ForegroundEvent>): String? {
        events
            .filter { it.type == ACTIVITY_RESUMED }
            .maxByOrNull { it.timeMillis }
            ?.let { current = it.packageName }
        return current
    }

    companion object {
        /** Igual a `UsageEvents.Event.ACTIVITY_RESUMED` (antes MOVE_TO_FOREGROUND). */
        const val ACTIVITY_RESUMED = 1
    }
}

/**
 * Cuenta un intento de distracción solo cuando el usuario entra a una app
 * bloqueada distinta de la anterior, para no contar cada sondeo.
 */
class DistractionCounter {
    private var lastBlocked: String? = null

    /** Devuelve `true` si este sondeo es un intento nuevo. */
    fun onPoll(packageName: String?, blocked: Boolean): Boolean {
        if (!blocked) {
            lastBlocked = null
            return false
        }
        if (packageName == lastBlocked) return false
        lastBlocked = packageName
        return true
    }
}
