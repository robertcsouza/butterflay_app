import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../settings/colors.dart';

Widget input(
    {TextEditingController? controller,
    String? lable,
    required bool obscure,
    TextInputType? type,
    context}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          color: gray, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
        keyboardType: type == null ? TextInputType.text : type,
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: lable,
            contentPadding: EdgeInsets.only(left: 20),
            hintStyle: TextStyle()),
      ),
    ),
  );
}
