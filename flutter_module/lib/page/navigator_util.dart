import 'package:flutter/material.dart';
import 'package:flutter_module/bridge/native_method.dart';

class NavigatorUtil {
  static pop(BuildContext context, bool isFinishActivity) {
    if (isFinishActivity) {
      NativeMethod.finishActivity();
    } else {
//      Navigator.of(context).popUntil(ModalRoute.withName('/'));
      Navigator.of(context).pop();
    }
  }

  static push(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }
}