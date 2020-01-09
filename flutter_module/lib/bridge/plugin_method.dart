
import 'dart:async';
import 'package:sys_info/sys_info.dart';
import 'package:flutter/services.dart';

class PluginMethod {
  static Future<String> getSysInfo() async {
    String platformVersion;
    try {
      platformVersion = await SysInfo.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    return platformVersion;
  }

  static Future<String> compute(String amount) async {
    String result;
    try {
      result = await SysInfo.compute(amount);
    } on PlatformException {
      result = 'Failed to compute.';
    }
    return result;
  }

}