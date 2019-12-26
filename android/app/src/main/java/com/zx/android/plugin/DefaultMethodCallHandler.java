package com.zx.android.plugin;

import android.content.Context;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * DefaultMethodCallHandler
 * plugin基类，传入context和name，实现onMethodCall即可
 * Created by zxx on 2019-05-14 17:53
 */
public class DefaultMethodCallHandler implements MethodChannel.MethodCallHandler {
    protected Context mContext;
    protected String mName;

    public DefaultMethodCallHandler(Context context, String name) {
        mContext = context;
        mName = name;
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
    }

    public String getName() {
        return mName;
    }
}
