package com.zx.android

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.view.FlutterMain

/**
 * MyApp
 * Created by zxx on 2019-12-20 18:26
 *
 */

class MyApp : Application() {
    override fun onCreate() {
        super.onCreate()
        initFlutterEngine()
    }

    private fun initFlutterEngine() {
        var modules = FlutterModules.values()
        for (flutterModule in modules) {
            // Instantiate a FlutterEngine.
            var flutterEngine = FlutterEngine(this)

            // Start executing Dart code to pre-warm the FlutterEngine.
            flutterEngine.dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint(FlutterMain.findAppBundlePath(), flutterModule.name)
            )
            // Cache the FlutterEngine to be used by FlutterActivity.
            FlutterEngineCache.getInstance().put("engine_${flutterModule.name}", flutterEngine)
        }
    }

    override fun onTerminate() {
        println("onTerminate")
        super.onTerminate()
        var modules = FlutterModules.values()
        for (flutterModule in modules) {
            FlutterEngineCache.getInstance().remove(flutterModule.name)
        }
    }

    enum class FlutterModules {
        main,
//        user,
//        product
    }
}