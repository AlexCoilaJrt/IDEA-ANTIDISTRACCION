package com.alexcoila.enfoque

import com.alexcoila.enfoque.blocker.BlockerEvents
import com.alexcoila.enfoque.blocker.BlockerFlutterApi
import com.alexcoila.enfoque.blocker.BlockerHostApi
import com.alexcoila.enfoque.blocker.BlockerHostApiImpl
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

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
