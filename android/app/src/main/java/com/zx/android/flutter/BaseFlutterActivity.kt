package com.zx.android.flutter

import android.content.Context
import android.os.Bundle
import com.zx.android.demo.RouteMethodCallHandler
import com.zx.android.demo.ToastMethodCallHandler
import com.zx.android.plugin.FlutterNativeBridge
import com.zx.android.util.StatusBarUtil
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache

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
    }

    override fun provideFlutterEngine(context: Context): FlutterEngine? {
        return if (FlutterEngineCache.getInstance().contains("engine_${dartEntrypointFunctionName}")) {
            FlutterEngineCache.getInstance().get("engine_${intent.getStringExtra(EXTRA_ENTRY_POINT)}")
        } else {
            null
        }
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

    override fun getDartEntrypointFunctionName(): String {
        return if (intent.hasExtra(EXTRA_ENTRY_POINT)) {
            intent.getStringExtra(EXTRA_ENTRY_POINT)
        } else {
            super.getDartEntrypointFunctionName()
        }
    }
}