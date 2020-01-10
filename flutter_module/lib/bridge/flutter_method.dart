
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterMethod {
  static const MethodChannel methodChannel = MethodChannel("module/navigator", JSONMethodCodec());

  BuildContext context;

  FlutterMethod(BuildContext context) {
    this.context = context;
    methodChannel.setMethodCallHandler(_handleNavigationInvocation);
  }

  Future<dynamic> _handleNavigationInvocation(MethodCall methodCall) {
    switch (methodCall.method) {
      case 'popAll':
        return _popPage();
//      case 'pushRoute':
//        return handlePushRoute(methodCall.arguments);
    }
    return Future<dynamic>.value();
  }

  _popPage() {
//    Navigator.of(context).
    Navigator.of(context).popUntil(ModalRoute.withName('/'));
  }
}