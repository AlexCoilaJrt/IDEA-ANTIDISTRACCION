package com.alexcoila.enfoque

import com.alexcoila.enfoque.blocker.BlockerEvents
import com.alexcoila.enfoque.blocker.BlockerFlutterApi
import com.alexcoila.enfoque.blocker.BlockerHostApi
import com.alexcoila.enfoque.blocker.BlockerHostApiImpl
import com.alexcoila.enfoque.blocker.Reminders
import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        handleStartRequest(intent)
        super.onCreate(savedInstanceState)
    }

    override fun onNewIntent(intent: Intent) {
        handleStartRequest(intent)
        super.onNewIntent(intent)
    }

    /** "Empezar ahora" en un recordatorio: Flutter lo lee al volver. */
    private fun handleStartRequest(intent: Intent?) {
        val blockId = intent?.getLongExtra(Reminders.EXTRA_START_BLOCK, -1) ?: -1
        if (blockId >= 0) {
            Reminders.requestStart(this, blockId)
            intent?.removeExtra(Reminders.EXTRA_START_BLOCK)
            // Si Flutter ya está corriendo, que lo lea ahora.
            BlockerEvents.startRequested()
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        BlockerHostApi.setUp(
            messenger,
            BlockerHostApiImpl(applicationContext) {
                if (!isFinishing && !isDestroyed) this else null
            },
        )
        BlockerEvents.flutterApi = BlockerFlutterApi(messenger)
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        BlockerHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, null)
        BlockerEvents.flutterApi = null
        super.cleanUpFlutterEngine(flutterEngine)
    }
}
