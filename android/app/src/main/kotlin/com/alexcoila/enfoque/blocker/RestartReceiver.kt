package com.alexcoila.enfoque.blocker

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

/**
 * Retoma la sesión tras reiniciar el celular, actualizar la app o cuando salta
 * la alarma vigilante.
 */
class RestartReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        // Las alarmas se borran al reiniciar o actualizar: reprogramar avisos.
        if (intent.action != AndroidPlatform.ACTION_WATCHDOG) Reminders.scheduleNext(context)
        val store = SessionStore(context)
        if (!store.isActive) return
        runCatching { FocusService.start(context) }
            .onFailure {
                // Si Android no deja iniciar el servicio ahora, se reintenta luego.
                AndroidPlatform.scheduleWatchdog(context)
            }
    }
}
