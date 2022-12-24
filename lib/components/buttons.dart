import 'package:flutter/material.dart';

import '../settings/colors.dart';

Widget btPrimary(
    {required context, required String lable, call, TextStyle? textStyle}) {
  return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ElevatedButton(
        onPressed: call,
        child: Text(
          lable,
          style: textStyle != null ? textStyle : TextStyle(),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(dark)),
      ));
}

Widget btText({context, required String lable, call, TextStyle? textStyle}) {
  return TextButton(
      onPressed: call,
      child: Text(
        lable,
        style: textStyle != null ? textStyle : TextStyle(),
      ));
}
