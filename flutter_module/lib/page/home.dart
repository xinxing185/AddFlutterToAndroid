
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_module/bridge/native_method.dart';
import 'package:flutter_module/bridge/plugin_method.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';
import 'dialog_util.dart';

class HomePage extends StatelessWidget {
  final Color titleColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
//        statusBarColor: Colors.deepOrange
    ));

    Widget titleBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: titleColor),
        tooltip: "back",
        onPressed: () => NativeMethod.finishActivity(),
      ),
      elevation: 0.5,
      toolbarOpacity: 1,
      titleSpacing: 0.0,
      centerTitle: true,
      backgroundColor: Colors.lightBlue,
      textTheme: TextTheme(title: TextStyle(color: titleColor)),
      title: Text(
        "Flutter Demo",
        style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal),
      ),
    );
    return Scaffold(
        appBar: titleBar,
        body: Column(
          children: <Widget>[
            Container(height: 35, color: Colors.white),
            MyAppBar(title: "自定义AppBar", centerTitle: true),
            SingleChildScrollView(
                child: new Center(
                    child: new Column(
                        children: <Widget>[
                          new RaisedButton(
                              child: Text("Show Native Toast"),
                              onPressed: () =>
                                  NativeMethod.showMyToast("使用原生toast")),
                          new RaisedButton(
                              child: Text("Use Flutter Plugin"),
                              onPressed: () => _getSysInfo(context)),
                          new RaisedButton(
                              child: Text("跳转到原生页"),
                              onPressed: () => NativeMethod.jump("simplePage")),
                          new RaisedButton(
                              child: Text("关闭"),
                              onPressed: () => NativeMethod.finishActivity()),
                        ]
                    )
                )
            )
          ],
        )
    );
  }

  _getSysInfo(BuildContext context) {
    Future<String> platformVersion = PluginMethod.getSysInfo();
    platformVersion.then(
            (onValue) => DialogUtil.showMyDialog(context, "来自plugin", '版本号 $onValue'));
  }

}