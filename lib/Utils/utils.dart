import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {
  toastMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.grey,
    );
  }

  flushbarErrorMessage(String msg, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: msg,
          forwardAnimationCurve: Curves.bounceIn,
          backgroundColor: Colors.deepPurple,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.all(8.0),
          duration: const Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          reverseAnimationCurve: Curves.bounceOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
        )..show(context));
  }

  snakebar(String msg, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.deepPurple,
        content: Text(msg),
      ),
    );
  }

  verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  horizontalSpace(double width) {
    return SizedBox(
      width: width,
    );
  }

  focusOnSubmit(BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}
