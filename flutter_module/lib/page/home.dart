
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/bridge/native_method.dart';
import 'package:flutter_module/bridge/plugin_method.dart';
import 'package:flutter_module/model/product.dart';
import 'package:flutter_module/page/product_list.dart';
import 'package:flutter_module/page/user_list.dart';

import 'navigator_util.dart';
import 'appbar.dart';
import 'dialog_util.dart';

class HomePage extends StatelessWidget {
  final Color titleColor = Colors.white;

  @override
  Widget build(BuildContext context) {
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
//            Container(height: 35, color: Colors.white),
//            MyAppBar(title: "自定义AppBar", centerTitle: true),
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
                              child: Text("Use Flutter Plugin with params"),
                              onPressed: () => _testCompute(context, "20000")),
                          new RaisedButton(
                              child: Text("跳转到原生页"),
                              onPressed: () => NativeMethod.jump("simplePage")
                          ),
                          new RaisedButton(
                              child: Text("跳转到Flutter Page1"),
                              onPressed: () => _jumpInner(context, UserList(false))
                          ),
                          new RaisedButton(
                              child: Text("跳转到Flutter Page2"),
                              onPressed: () => _jumpInner(context, ProductList(false))
                          ),
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

  _jumpInner(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => page));
  }

  _testCompute(BuildContext context, String amount) {
    Future<String> result = PluginMethod.compute(amount);
    result.then(
            (onValue) => DialogUtil.showMyDialog(context, "来自plugin", '计算结果: $onValue'));
  }

  _getSysInfo(BuildContext context) {
    Future<String> platformVersion = PluginMethod.getSysInfo();
    platformVersion.then(
            (onValue) => DialogUtil.showMyDialog(context, "来自plugin", '版本号 $onValue'));
  }
}