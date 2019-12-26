import 'package:flutter/material.dart';
import 'package:flutter_module/page/home.dart';
import 'package:flutter_module/page/product_list.dart';
import 'package:flutter_module/page/user_list.dart';

void main() {
  runApp(MyFlutterView(HomePage()));
}
void product() => runApp(MyFlutterView(ProductList()));
void user() => runApp(MyFlutterView(UserList()));

// useless
Widget chooseWidget(String routeName) {
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
}

class MyFlutterView extends StatelessWidget {
  Widget homePage;

  MyFlutterView(this.homePage);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),

        home: homePage
    );
  }
}


