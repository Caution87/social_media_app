// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//show loading circle
void showLoadingCircle(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            content: Center(
              child: CircularProgressIndicator(),
            ),
          ));
}

//hide loading circle
void hideLoadingCircle(BuildContext context) {
  Navigator.pop(context);
}
