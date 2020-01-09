import 'package:flutter/services.dart';

class NativeMethod {
  static jump(String name) {
    var _platform = const MethodChannel('me.action.plugins/route');
//    _platform.setMethodCallHandler(handler)
    _platform.invokeMethod("navigatorTo", { 'page': name});
  }

  static finishActivity() {
    var _platform = const MethodChannel('me.action.plugins/route');
    _platform.invokeMethod("finish");
  }

  static showMyToast(String msg) {
    var _platform = const MethodChannel('me.action.plugins/toast');
    _platform.invokeMethod('showToast', { 'msg': msg});

  }
}