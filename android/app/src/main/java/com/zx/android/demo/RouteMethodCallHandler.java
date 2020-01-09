package com.zx.android.demo;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

import com.zx.android.MyActivity;
import com.zx.android.plugin.DefaultMethodCallHandler;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * RouteMethodCallHandler
 * Created by zxx on 2019-05-14 18:28
 */
public class RouteMethodCallHandler extends DefaultMethodCallHandler {
    public RouteMethodCallHandler(Context context, String name) {
        super(context, name);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        super.onMethodCall(call, result);
        if (call.method.equals("navigatorTo")) {
            Intent intent = new Intent(mContext, MyActivity.class);
            mContext.startActivity(intent);
        } else if (call.method.equals("finish")) {
            ((Activity) mContext).finish();
        }
    }
}
