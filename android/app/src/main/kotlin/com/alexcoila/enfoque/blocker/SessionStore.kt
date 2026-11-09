package com.alexcoila.enfoque.blocker

import android.content.Context
import org.json.JSONArray
import org.json.JSONObject

/**
 * Estado de la sesión guardado en almacenamiento nativo, para sobrevivir a la
 * muerte del proceso y a reinicios. La lista de apps nunca sale del celular.
 */
class SessionStore(context: Context) {
    private val prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)

    val isActive: Boolean get() = prefs.getBoolean(KEY_ACTIVE, false)
    val sessionId: Long get() = prefs.getLong(KEY_SESSION_ID, -1)
    val startedAt: Long get() = prefs.getLong(KEY_STARTED_AT, 0)
    val endsAt: Long get() = prefs.getLong(KEY_ENDS_AT, 0)
    val allowedPackages: Set<String>
        get() = prefs.getStringSet(KEY_ALLOWED, emptySet()) ?: emptySet()
    val label: String? get() = prefs.getString(KEY_LABEL, null)
    val strictness: StrictnessDto
        get() = StrictnessDto.ofRaw(prefs.getInt(KEY_STRICTNESS, 0)) ?: StrictnessDto.STANDARD
    val plan: PomodoroPlan
        get() = PomodoroPlan(
            focusMinutes = prefs.getInt(KEY_FOCUS, 25),
            breakMinutes = prefs.getInt(KEY_BREAK, 5),
            cycles = prefs.getInt(KEY_CYCLES, 1),
            longBreakMinutes = prefs.getInt(KEY_LONG_BREAK, 0),
        )

    fun start(config: SessionConfigDto) {
        prefs.edit()
            .clear()
            .putBoolean(KEY_ACTIVE, true)
            .putLong(KEY_SESSION_ID, config.sessionId)
            .putLong(KEY_STARTED_AT, config.startedAtMillis)
            .putLong(KEY_ENDS_AT, config.endsAtMillis)
            .putInt(KEY_FOCUS, config.focusMinutes.toInt())
            .putInt(KEY_BREAK, config.breakMinutes.toInt())
            .putInt(KEY_CYCLES, config.cycles.toInt())
            .putInt(KEY_LONG_BREAK, config.longBreakMinutes.toInt())
            .putStringSet(KEY_ALLOWED, config.allowedPackages.toSet())
            .putInt(KEY_STRICTNESS, config.strictness.raw)
            .putString(KEY_LABEL, config.label)
            .putString(KEY_DISTRACTIONS, "[]")
            .apply()
    }

    /** Marca la sesión como inactiva pero conserva las distracciones hasta que Flutter las lea. */
    fun deactivate() {
        prefs.edit().putBoolean(KEY_ACTIVE, false).apply()
    }

    fun clear() {
        prefs.edit().clear().apply()
    }

    fun addDistraction(packageName: String, atMillis: Long) {
        val list = JSONArray(prefs.getString(KEY_DISTRACTIONS, "[]"))
        list.put(JSONObject().put("p", packageName).put("t", atMillis))
        prefs.edit().putString(KEY_DISTRACTIONS, list.toString()).apply()
    }

    fun distractions(): List<DistractionDto> {
        val list = JSONArray(prefs.getString(KEY_DISTRACTIONS, "[]"))
        return (0 until list.length()).map {
            val item = list.getJSONObject(it)
            DistractionDto(packageName = item.getString("p"), atMillis = item.getLong("t"))
        }
    }

    fun requestExit() {
        prefs.edit().putBoolean(KEY_EXIT_REQUESTED, true).apply()
    }

    fun consumeExitRequest(): Boolean {
        val requested = prefs.getBoolean(KEY_EXIT_REQUESTED, false)
        if (requested) prefs.edit().putBoolean(KEY_EXIT_REQUESTED, false).apply()
        return requested
    }

    fun status(): BlockerStatusDto = BlockerStatusDto(
        active = isActive,
        sessionId = if (sessionId >= 0) sessionId else null,
        endsAtMillis = if (endsAt > 0) endsAt else null,
        distractions = distractions(),
    )

    companion object {
        private const val PREFS = "enfoque_blocker"
        private const val KEY_ACTIVE = "active"
        private const val KEY_SESSION_ID = "session_id"
        private const val KEY_STARTED_AT = "started_at"
        private const val KEY_ENDS_AT = "ends_at"
        private const val KEY_FOCUS = "focus_min"
        private const val KEY_BREAK = "break_min"
        private const val KEY_CYCLES = "cycles"
        private const val KEY_LONG_BREAK = "long_break_min"
        private const val KEY_ALLOWED = "allowed"
        private const val KEY_STRICTNESS = "strictness"
        private const val KEY_LABEL = "label"
        private const val KEY_DISTRACTIONS = "distractions"
        private const val KEY_EXIT_REQUESTED = "exit_requested"
    }
}
