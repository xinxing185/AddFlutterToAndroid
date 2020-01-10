package com.zx.android.flutter

import android.content.Context
import android.os.Bundle
import com.zx.android.demo.FlutterModuleChannel
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
        const val EXTRA_ROUTE = "route"     // 路由页面名，使用同一个FLutterEngine,同一个ENTRY_POINT,该参数用于初始页面跳转
        const val CHANNEL_TOAST = "me.action.plugins/toast"
        const val CHANNEL_ROUTE = "me.action.plugins/route"
    }

    private var mNativeBridge : FlutterNativeBridge? = null

    private var moduleChannel : FlutterModuleChannel? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // 设置透明状态栏
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
        // 路由到指定页面
        if (!getPageName().isNullOrEmpty()) {
            flutterEngine?.navigationChannel?.pushRoute(getPageName()!!)
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
        if (moduleChannel == null) {
            moduleChannel = FlutterModuleChannel(flutterEngine.dartExecutor)
        }
    }

    private fun getPageName(): String? {
        return if (intent.hasExtra(EXTRA_ROUTE)) {
            intent.getStringExtra(EXTRA_ROUTE)
        } else {
            null
        }
    }

    override fun getDartEntrypointFunctionName(): String {
        return "main"
    }
}