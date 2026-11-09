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
