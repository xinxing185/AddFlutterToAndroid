package com.zx.android.flutter

import android.content.Context
import android.os.Bundle
import android.os.Handler
import com.zx.android.demo.RouteMethodCallHandler
import com.zx.android.demo.ToastMethodCallHandler
import com.zx.android.plugin.FlutterNativeBridge
import com.zx.android.util.StatusBarUtil
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.view.FlutterMain

/**
 * me.action.appexplore.flutter.BaseFlutterActivity
 * Created by zxx on 2019-12-20 18:32
 *
 */

class BaseFlutterActivity : FlutterActivity() {
    companion object {
        const val EXTRA_ENTRY_POINT = "entry_point"
        const val CHANNEL_TOAST = "me.action.plugins/toast"
        const val CHANNEL_ROUTE = "me.action.plugins/route"
    }

    private var mNativeBridge : FlutterNativeBridge? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        StatusBarUtil.setTransparentForWindow(this)
//        StatusBarUtil.setDarkMode(this)
        StatusBarUtil.setLightMode(this)
    }

    override fun provideFlutterEngine(context: Context): FlutterEngine? {
        return if (FlutterEngineCache.getInstance().contains("engine_${dartEntrypointFunctionName}")) {
            FlutterEngineCache.getInstance().get("engine_${dartEntrypointFunctionName}")
        } else {
            null
        }
    }

    override fun onResume() {
        super.onResume()
        if (!getPageName().isNullOrEmpty()) {
            flutterEngine?.navigationChannel?.pushRoute(getPageName()!!)
        }
    }

    override fun onPause() {
        super.onPause()
        flutterEngine?.navigationChannel?.popRoute()
//        Handler().postDelayed({ flutterEngine?.navigationChannel?.popRoute() }, 100)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        if (mNativeBridge == null) {
            mNativeBridge =
                FlutterNativeBridge(flutterEngine.dartExecutor)
            mNativeBridge!!.registerPlugin(
                ToastMethodCallHandler(
                    this,
                    CHANNEL_TOAST
                )
            )
            mNativeBridge!!.registerPlugin(
                RouteMethodCallHandler(
                    this,
                    CHANNEL_ROUTE
                )
            )
        }
    }

    private fun getPageName(): String? {
        return if (intent.hasExtra(EXTRA_ENTRY_POINT)) {
            intent.getStringExtra(EXTRA_ENTRY_POINT)
        } else {
            null
        }
    }

    override fun getDartEntrypointFunctionName(): String {
//        return if (intent.hasExtra(EXTRA_ENTRY_POINT)) {
//            intent.getStringExtra(EXTRA_ENTRY_POINT)
//        } else {
//            super.getDartEntrypointFunctionName()
//        }
        return "main"
    }
}