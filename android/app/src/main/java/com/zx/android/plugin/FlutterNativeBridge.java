package com.zx.android.plugin;

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
    }
}
