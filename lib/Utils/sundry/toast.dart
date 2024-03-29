import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_tool/Utils/sundry/constants.dart';

void showtoast(String message) async {
  Fluttertoast.showToast(
    msg: message,
    timeInSecForIosWeb: 2,
    textColor: kTextColor,
    backgroundColor: kBoxColor,
    fontSize: 14,

    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,



  );
}

showAlertDialog(BuildContext context, String title, String content) {
  // set up the AlertDialog
  Widget okButton = TextButton(
    child: Text("확인"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}