package com.zx.android.demo

import io.flutter.Log
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.JSONMethodCodec
import io.flutter.plugin.common.MethodChannel

/**
 * FlutterModuleChannel
 * Native调用Flutter Method示例
 * Created by zxx on 2020-01-10 14:52
 *
 */
class FlutterModuleChannel {
    val TAG = "FlutterModuleChannel"
    private var navigationChannel: MethodChannel? = null

    constructor(dartExecutor: DartExecutor) {
        navigationChannel = MethodChannel(dartExecutor,"module/navigator", JSONMethodCodec.INSTANCE)
    }

    fun popAll() {
        Log.v(TAG, "Sending message to popAll.")
        navigationChannel?.invokeMethod("popAll", null)
    }
}