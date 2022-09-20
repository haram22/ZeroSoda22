import 'package:flutter/material.dart';

ButtonStyle usuallyButton({Color? color}) {
  return ButtonStyle(
      backgroundColor:
      MaterialStateProperty.all<Color>(Color(0xff007AB5)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          //side: BorderSide(color: Colors.red)
          ))
      );
}
