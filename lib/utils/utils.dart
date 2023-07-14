import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_mvvm/utils/values/values.dart';
import 'package:another_flushbar/flushbar_route.dart';

class Utils {
  //Focus Node
  static fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // Toast Msg
  static toastMsg(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  // FlushBar Msg
  static void flushBar(String msg, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          messageText: Text(msg, style: AppTextStyles.msgText),
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.BOTTOM,
          icon: const Icon(
            Icons.error,
            size: 20,
            color: Colors.white,
          ),
          positionOffset: 20,
          backgroundColor: Colors.black,
          forwardAnimationCurve: Curves.decelerate,
        )..show(context));
  }

  // SnackBar Msg
  static snackBar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      msg,
      style: AppTextStyles.normalText,
    )));
  }
}
