// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_social_media_app/components/my_drawer.dart';
import 'package:my_social_media_app/components/my_input_alert_box.dart';
import 'package:my_social_media_app/services/database/database_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //provider
  late final dbProvider = Provider.of<DatabaseProvider>(context, listen: false);

  //controller
  final TextEditingController postController = TextEditingController();
  void _openPostMessageBox() {
    showDialog(
        context: context,
        builder: (context) => MyInputAlertBox(
            hintText: "What's on your mind?",
            controller: postController,
            onPressed: () async {
              //post in db
              await postMessage(postController.text);
            },
            onPressedText: "Post"));
  }

//user post message
  Future<void> postMessage(String message) async {
    await dbProvider.postMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: _openPostMessageBox,
        child: Icon(Icons.add),
      ),
    );
  }
}
