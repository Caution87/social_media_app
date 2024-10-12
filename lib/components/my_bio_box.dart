import 'package:flutter/material.dart';

class MyBioBox extends StatelessWidget {
  final String text;
  const MyBioBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text.isNotEmpty ? text : "Empty Bio",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
