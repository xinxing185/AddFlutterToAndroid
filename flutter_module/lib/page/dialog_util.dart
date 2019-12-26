
import 'package:flutter/material.dart';

class DialogUtil {
  static showMyDialog(BuildContext context, String title, String msg) {
    var alertDialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
    );
    print(alertDialog);
    showDialog(
        context : context,
        builder : (BuildContext context) => alertDialog);
  }

  static showProgressDialog(BuildContext context, String msg) {
//    var progressDialog = Progr
  }
}