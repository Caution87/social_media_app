// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

/*
We use this for postting message, editing bio etc.
-text controller
-hint text
-funcn
-text for button
*/

class MyInputAlertBox extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function()? onPressed;
  final String onPressedText;
  const MyInputAlertBox(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.onPressed,
      required this.onPressedText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: TextField(
        controller: controller,
        //lets limit max character
        maxLength: 140,
        maxLines: 3,
        decoration: InputDecoration(
          //border when textfield is unselected
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          //when border is selected
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(12)),
          hintText: hintText,
        ),
      ),
      actions: [
        //cancel
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              controller.clear();
            },
            child: Text("Cancel")),
        //yes button
        TextButton(
            onPressed: () {
              //close box
              Navigator.pop(context);
              //execute
              onPressed!();
              //clear controller
              controller.clear();
            },
            child: Text(onPressedText))
      ],
    );
  }
}
