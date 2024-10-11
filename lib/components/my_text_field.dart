import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController myController;
  final String myHintText;
  final bool isObscureText;
  const MyTextField(
      {super.key,
      required this.myController,
      required this.myHintText,
      required this.isObscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: myController,
        decoration: InputDecoration(
          hintText: myHintText,

        ),
        obscureText: isObscureText,
      ),
    );
  }
}
