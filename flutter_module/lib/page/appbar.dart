import 'package:flutter_module/bridge/native_method.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title, this.centerTitle});

  final String title;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "back",
          onPressed: () => NativeMethod.finishActivity(),
        ),
        Expanded(
            child: centerTitle ?
            Center(child: _titleText(title)) : _titleText(title)
        ),
        IconButton(
          icon: Icon(Icons.add, color: Colors.black,),
          tooltip: "add menu",
          onPressed: null,
        )
      ],
      )
    );
  }

  _titleText(String titleTxt) {
    return Text(titleTxt,
        style: TextStyle(
          fontSize: 15,
        ));
  }

  closeSelf(BuildContext context) {
    Navigator.pop(context);
  }
}