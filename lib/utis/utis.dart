import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  // change the focuss Node
  static void changeFocussNode(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          flushbarPosition: FlushbarPosition.TOP,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.grey,
          icon: Icon(Icons.connect_without_contact),
          message: message,
          title: 'Internet',
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static SnackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(message, context));
  }
}
