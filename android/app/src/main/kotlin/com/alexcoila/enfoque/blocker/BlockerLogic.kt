package com.alexcoila.enfoque.blocker

/**
 * Lógica pura del motor de bloqueo (sin dependencias de Android) para poder
 * probarla con JUnit.
 */

/**
 * Plan Pomodoro: [cycles] bloques de [focusMinutes]. Entre bloques hay un
 * descanso de [breakMinutes], salvo cada [LONG_BREAK_EVERY] bloques, que es de
 * [longBreakMinutes]. Debe coincidir con `PomodoroPlan` en Dart.
 */
data class PomodoroPlan(
    val focusMinutes: Int,
    val breakMinutes: Int,
    val cycles: Int,
    val longBreakMinutes: Int = 0,
) {
    fun isLongBreakAfter(cycle: Int): Boolean =
        longBreakMinutes > 0 && cycle % LONG_BREAK_EVERY == 0

    fun breakAfter(cycle: Int): Int =
        if (isLongBreakAfter(cycle)) longBreakMinutes else breakMinutes

    /** Tramos de la sesión en orden (los descansos de 0 min no aparecen). */
    val segments: List<Segment>
        get() {
            val result = mutableListOf<Segment>()
            var t = 0L
            for (c in 1..cycles) {
                val focus = focusMinutes * MINUTE
                result += Segment(PhaseKind.FOCUS, c, t, focus)
                t += focus
                if (c == cycles) break
                val rest = breakAfter(c) * MINUTE
                if (rest > 0) {
                    val kind = if (isLongBreakAfter(c)) PhaseKind.LONG_BREAK else PhaseKind.SHORT_BREAK
                    result += Segment(kind, c, t, rest)
                    t += rest
                }
            }
            return result
        }

    val totalMillis: Long
        get() = segments.lastOrNull()?.end ?: 0L

    companion object {
        const val MINUTE = 60_000L
        const val LONG_BREAK_EVERY = 4
    }
}

enum class PhaseKind { FOCUS, SHORT_BREAK, LONG_BREAK, DONE }

data class Segment(val kind: PhaseKind, val cycle: Int, val startMillis: Long, val lengthMillis: Long) {
    val end: Long get() = startMillis + lengthMillis
}

/** Fase en un instante: tipo, bloque (desde 1) y minutos que dura. */
data class Phase(val kind: PhaseKind, val cycle: Int, val lengthMinutes: Int) {
    val isBreak: Boolean get() = kind == PhaseKind.SHORT_BREAK || kind == PhaseKind.LONG_BREAK
}

object PomodoroClock {
    fun phaseAt(plan: PomodoroPlan, startedAtMillis: Long, nowMillis: Long): Phase {
        val elapsed = (nowMillis - startedAtMillis).coerceAtLeast(0)
        val segment = plan.segments.firstOrNull { elapsed < it.end }
            ?: return Phase(PhaseKind.DONE, plan.cycles, 0)
        return Phase(segment.kind, segment.cycle, (segment.lengthMillis / PomodoroPlan.MINUTE).toInt())
    }

    /** `true` si en [nowMillis] la sesión está en un descanso. */
    fun isBreak(plan: PomodoroPlan, startedAtMillis: Long, nowMillis: Long): Boolean =
        phaseAt(plan, startedAtMillis, nowMillis).isBreak
}

/** Aviso que corresponde a un cambio de fase. */
sealed class PhaseAlert {
    data class BreakStarted(val minutes: Int, val long: Boolean) : PhaseAlert()
    data class FocusStarted(val cycle: Int, val totalCycles: Int) : PhaseAlert()
}

/**
 * Detecta cambios de fase entre sondeos. El primer sondeo (o tras reiniciar
 * el servicio) solo memoriza la fase, sin avisar. El fin de la sesión lo
 * avisa el servicio aparte.
 */
class PhaseTracker(private val totalCycles: Int) {
    private var last: Phase? = null

    fun onPoll(phase: Phase): PhaseAlert? {
        val previous = last
        last = phase
        if (previous == null || previous.kind == phase.kind && previous.cycle == phase.cycle) return null
        return when {
            phase.isBreak -> PhaseAlert.BreakStarted(phase.lengthMinutes, phase.kind == PhaseKind.LONG_BREAK)
            phase.kind == PhaseKind.FOCUS -> PhaseAlert.FocusStarted(phase.cycle, totalCycles)
            else -> null
        }
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
