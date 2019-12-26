
import 'dart:async';
//import 'package:sys_info/sys_info.dart';
import 'package:flutter/services.dart';

class PluginMethod {
  static Future<String> getSysInfo() async {
    String platformVersion = "xx.xx";
//    try {
//      platformVersion = await SysInfo.platformVersion;
//    } on PlatformException {
//      platformVersion = 'Failed to get platform version.';
//    }
    return platformVersion;
  }

}