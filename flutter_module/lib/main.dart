import 'package:flutter/material.dart';
import 'package:flutter_module/page/home.dart';
import 'package:flutter_module/page/product_list.dart';
import 'package:flutter_module/page/user_list.dart';
import 'dart:ui';

import 'package:flutter/services.dart';

void main() {
  runApp(MyFlutterView());
}
//void product() => runApp(MyFlutterView(ProductList()));
//void user() => runApp(MyFlutterView(UserList()));

// useless
/*Widget chooseWidget(String routeName) {
  print(routeName);
  switch (routeName) {
    case 'demo':
      var view = MyFlutterView(HomePage());
      return view;
    case 'product_list':
      var view = MyFlutterView(ProductList());
      return view;
    case 'user_list':
      var view = MyFlutterView(UserList());
      return view;
    default:
      return
        new Center(
          child: Text('Unkown Route'),
        );
  }
}*/

class MyFlutterView extends StatelessWidget {
  MyFlutterView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),

        home: Container(
          width: window.physicalSize.width,
          height: window.physicalSize.height,
          color: Colors.white,
        ),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => _navigator(context, HomePage()),
        '/user_list': (BuildContext context) => _navigator(context, UserList(true)),
        '/product_list': (BuildContext context) => _navigator(context, ProductList(true)),
      },
    );
  }

  Widget _navigator(BuildContext context, Widget page) {
//    Navigator.of(context).popUntil(ModalRoute.withName('/'));
    return page;
  }
}


