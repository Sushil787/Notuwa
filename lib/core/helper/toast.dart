import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// [ToastType] enum
enum ToastType {
  /// Success
  success,

  /// Error
  error,

  /// Message
  message
}

/// Showtoast Method
void showToast({required String message, required ToastType toastType}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16,
    backgroundColor: toastType == ToastType.message
        ? Colors.black
        : toastType == ToastType.success
            ? Colors.green
            : Colors.red,
  );
}
