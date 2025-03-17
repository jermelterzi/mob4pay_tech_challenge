import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class ToastService {
  Future<void> showErrorToast({String message});
}

class ToastServiceImpl implements ToastService {
  @override
  Future<void> showErrorToast({String message = ''}) async {
    await Fluttertoast.showToast(
      msg: message.isNotEmpty ? message : '',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );

    return;
  }
}
