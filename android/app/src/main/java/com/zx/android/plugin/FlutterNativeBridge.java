package com.zx.android.plugin;

import java.util.HashMap;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class FlutterNativeBridge {
    private BinaryMessenger mMessenger;

    public FlutterNativeBridge(BinaryMessenger messenger) {
        mMessenger = messenger;
    }

    public void registerPlugin(DefaultMethodCallHandler methodHandler) {
        new MethodChannel(mMessenger, methodHandler.getName()).setMethodCallHandler(
                methodHandler);

        new MethodChannel(mMessenger, methodHandler.getName()).invokeMethod("method", new HashMap(), new MethodChannel.Result() {

            @Override
            public void success(Object result) {

            }

            @Override
            public void error(String errorCode, String errorMessage, Object errorDetails) {

            }

            @Override
            public void notImplemented() {

            }
        });
    }
}
