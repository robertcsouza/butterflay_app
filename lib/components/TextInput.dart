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
      height: 35,
      decoration: BoxDecoration(
          color: gray, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
        keyboardType: type == null ? TextInputType.text : type,
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: lable,
            contentPadding: EdgeInsets.only(left: 20, bottom: 15),
            hintStyle: TextStyle(fontSize: 12)),
      ),
    ),
  );
}

Widget inputField(
    {TextEditingController? controller,
    String? lable,
    required bool obscure,
    TextInputType? type,
    int? maxline,
    context}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
          color: gray, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        minLines: 1,
        maxLines: 5,
        keyboardType: TextInputType.multiline,
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: lable,
            contentPadding: EdgeInsets.only(left: 20, bottom: 7),
            hintStyle: TextStyle()),
      ),
    ),
  );
}

Widget inputSearch(
    {TextEditingController? controller,
    String? lable,
    required bool obscure,
    TextInputType? type,
    call,
    context}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
    child: Container(
        width: MediaQuery.of(context).size.width,
        height: 35,
        decoration: BoxDecoration(
            color: gray, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.70,
              height: 35,
              child: TextField(
                keyboardType: type == null ? TextInputType.text : type,
                obscureText: obscure,
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: lable,
                    contentPadding: EdgeInsets.only(left: 30, bottom: 10),
                    hintStyle: TextStyle()),
              ),
            ),
            IconButton(onPressed: call, icon: Icon(Icons.search))
          ],
        )),
  );
}
