package com.alexcoila.enfoque.blocker

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class PomodoroClockTest {
    private val plan = PomodoroPlan(focusMinutes = 25, breakMinutes = 5, cycles = 2)
    private val start = 1_000_000L
    private fun at(minutes: Double) = start + (minutes * 60_000).toLong()

    @Test
    fun `duración total sin descanso después del último bloque`() {
        assertEquals(55 * 60_000L, plan.totalMillis)
    }

    @Test
    fun `enfoque, descanso y segundo enfoque`() {
        assertFalse(PomodoroClock.isBreak(plan, start, at(0.0)))
        assertFalse(PomodoroClock.isBreak(plan, start, at(24.9)))
        assertTrue(PomodoroClock.isBreak(plan, start, at(25.0)))
        assertTrue(PomodoroClock.isBreak(plan, start, at(29.9)))
        assertFalse(PomodoroClock.isBreak(plan, start, at(30.0)))
        assertFalse(PomodoroClock.isBreak(plan, start, at(54.0)))
    }

    @Test
    fun `modo libre nunca tiene descanso`() {
        val free = PomodoroPlan(focusMinutes = 90, breakMinutes = 0, cycles = 1)
        assertFalse(PomodoroClock.isBreak(free, start, at(45.0)))
    }

    @Test
    fun `antes del inicio o después del final no es descanso`() {
        assertFalse(PomodoroClock.isBreak(plan, start, start - 1))
        assertFalse(PomodoroClock.isBreak(plan, start, at(60.0)))
    }
}

class BlockPolicyTest {
    private val policy = BlockPolicy(
        ownPackage = "com.alexcoila.enfoque.local",
        allowedPackages = setOf("com.calc"),
        systemAllowed = setOf("com.launcher"),
    )

    @Test
    fun `permite la propia app, las elegidas, el lanzador y el sistema`() {
        assertTrue(policy.isAllowed("com.alexcoila.enfoque.local"))
        assertTrue(policy.isAllowed("com.calc"))
        assertTrue(policy.isAllowed("com.launcher"))
        assertTrue(policy.isAllowed("com.android.systemui"))
        assertTrue(policy.isAllowed(null))
    }

    @Test
    fun `bloquea apps no permitidas`() {
        assertFalse(policy.isAllowed("com.instagram.android"))
        assertTrue(policy.shouldBlock("com.instagram.android", StrictnessDto.STANDARD, inBreak = false))
    }

    @Test
    fun `en descanso solo bloquea el modo estricto`() {
        assertFalse(policy.shouldBlock("com.instagram.android", StrictnessDto.STANDARD, inBreak = true))
        assertTrue(policy.shouldBlock("com.instagram.android", StrictnessDto.STRICT, inBreak = true))
    }
}

class ForegroundTrackerTest {
    @Test
    fun `toma el último evento ACTIVITY_RESUMED y lo recuerda`() {
        val tracker = ForegroundTracker()
        assertNull(tracker.consume(emptyList()))
        val result = tracker.consume(
            listOf(
                ForegroundEvent("b", ForegroundTracker.ACTIVITY_RESUMED, 20),
                ForegroundEvent("a", ForegroundTracker.ACTIVITY_RESUMED, 10),
                ForegroundEvent("c", 2, 30),
            ),
        )
        assertEquals("b", result)
        assertEquals("b", tracker.consume(emptyList()))
    }
}

class DistractionCounterTest {
    @Test
    fun `cuenta una vez por cada entrada a una app bloqueada`() {
        val counter = DistractionCounter()
        assertTrue(counter.onPoll("x", blocked = true))
        assertFalse(counter.onPoll("x", blocked = true))
        assertFalse(counter.onPoll("launcher", blocked = false))
        assertTrue(counter.onPoll("x", blocked = true))
        assertTrue(counter.onPoll("y", blocked = true))
    }
}

class LongBreakTest {
    private val plan = PomodoroPlan(focusMinutes = 25, breakMinutes = 5, cycles = 6, longBreakMinutes = 15)
    private val start = 0L
    private fun at(minutes: Int) = minutes * 60_000L

    @Test
    fun `duración igual que en Dart (185 min)`() {
        assertEquals(185 * 60_000L, plan.totalMillis)
    }

    @Test
    fun `el descanso tras el bloque 4 es largo`() {
        assertEquals(PhaseKind.SHORT_BREAK, PomodoroClock.phaseAt(plan, start, at(27)).kind)
        val long = PomodoroClock.phaseAt(plan, start, at(120))
        assertEquals(PhaseKind.LONG_BREAK, long.kind)
        assertEquals(15, long.lengthMinutes)
        assertEquals(4, long.cycle)
        assertEquals(PhaseKind.FOCUS, PomodoroClock.phaseAt(plan, start, at(130)).kind)
        assertEquals(PhaseKind.DONE, PomodoroClock.phaseAt(plan, start, at(185)).kind)
    }
}

class PhaseTrackerTest {
    private val plan = PomodoroPlan(focusMinutes = 25, breakMinutes = 5, cycles = 5, longBreakMinutes = 15)
    private fun phase(minutes: Int) = PomodoroClock.phaseAt(plan, 0, minutes * 60_000L)

    @Test
    fun `el primer sondeo no avisa`() {
        assertNull(PhaseTracker(5).onPoll(phase(26)))
    }

    @Test
    fun `avisa descanso, vuelta al enfoque y descanso largo una sola vez`() {
        val tracker = PhaseTracker(5)
        assertNull(tracker.onPoll(phase(1)))
        assertNull(tracker.onPoll(phase(24)))
        assertEquals(PhaseAlert.BreakStarted(5, long = false), tracker.onPoll(phase(25)))
        assertNull(tracker.onPoll(phase(26)))
        assertEquals(PhaseAlert.FocusStarted(2, 5), tracker.onPoll(phase(30)))
        // Fin del bloque 4: 4 x 25 + 3 x 5 = 115 min.
        tracker.onPoll(phase(114))
        assertEquals(PhaseAlert.BreakStarted(15, long = true), tracker.onPoll(phase(116)))
        assertEquals(PhaseAlert.FocusStarted(5, 5), tracker.onPoll(phase(131)))
    }

    @Test
    fun `al terminar la sesión no avisa (lo hace el servicio)`() {
        val tracker = PhaseTracker(5)
        tracker.onPoll(phase(150))
        assertNull(tracker.onPoll(phase(200)))
    }
}
