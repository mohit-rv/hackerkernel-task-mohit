import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void show(String message,
      {ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(10),
          flushbarPosition: FlushbarPosition.BOTTOM,
          positionOffset: 20,
          icon: Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
          title: 'Error',
          messageColor: Colors.white,
        )..show(context));
  }
}
