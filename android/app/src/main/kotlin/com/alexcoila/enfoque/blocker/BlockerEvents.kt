package com.alexcoila.enfoque.blocker

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch

/**
 * Puente entre el servicio y Flutter. Si la app no está abierta, los eventos se
 * pierden aquí, pero el estado queda en [SessionStore] y Flutter lo concilia al
 * volver.
 */
object BlockerEvents {
    @Volatile
    var flutterApi: BlockerFlutterApi? = null

    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    private fun send(block: suspend (BlockerFlutterApi) -> Unit) {
        val api = flutterApi ?: return
        scope.launch { runCatching { block(api) } }
    }

    fun distraction(event: DistractionDto) = send { it.onDistractionAttempt(event) }

    fun finished(sessionId: Long) = send { it.onSessionFinished(sessionId) }

    fun interrupted(sessionId: Long) = send { it.onSessionInterrupted(sessionId) }

    fun exitRequested() = send { it.onEarlyExitRequested() }

    fun startRequested() = send { it.onStartRequested() }
}
