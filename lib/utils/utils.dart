
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils{
  static toastMessage({required String message}){
    Fluttertoast.showToast(
        backgroundColor: Colors.black87,
        fontSize: 15,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        msg: message
    );
  }




  static snackBar({
    required String message,
    required BuildContext context,
    required Color snackBarColor,
    required Color textColor,
  }){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: snackBarColor,
          content: Text(message.toString(),style: TextStyle(color: textColor)
          )
      )
    );
  }
}

