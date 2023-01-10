import 'package:flutter/material.dart';

showSnackbar({required context, required String menssage}) {
  var snackBar = SnackBar(content: Text(menssage));
  // Step 3
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
