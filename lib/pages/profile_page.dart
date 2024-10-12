// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_social_media_app/components/my_bio_box.dart';
import 'package:my_social_media_app/components/my_input_alert_box.dart';
import 'package:my_social_media_app/models/user.dart';
import 'package:my_social_media_app/services/auth/auth_service.dart';
import 'package:my_social_media_app/services/database/database_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //providers
  late final databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);
  //user info
  UserProfile? user;
  String currentUserId = AuthService().getCurrentUid();
  //loading
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    loadUser();
  }

  //text controller for bio
  final bioController = TextEditingController();

  Future<void> loadUser() async {
    //get user profile info
    user = await databaseProvider.userProfile(widget.uid);
    //finish loading
    setState(() {
      _isLoading = false;
    });
  }

  void _showEditBioDialog() {
    showDialog(
        context: context,
        builder: (context) => MyInputAlertBox(
              hintText: "Edit Your Bio",
              controller: bioController,
              onPressedText: "Save",
              onPressed: () {
                saveBio();
              },
            ));
  }

//save update bio
  Future<void> saveBio() async {
    setState(() {
      _isLoading = true;
    });
    //update bio
    await databaseProvider.updateBio(bioController.text);
    //reload user
    await loadUser();
    //finish loading
    setState(() {
      _isLoading = false;
    });
    print("Saving");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_isLoading ? "" : user!.name),
        ),
        body: ListView(
          children: [
            //username handle
            Center(
              child: Text(
                _isLoading ? "" : '@${user!.username}',
              ),
            ),
            //profile pic
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  Icons.person,
                  size: 72,
                ),
              ),
            ),

            //profile stats

            //follow and unfollow
            //edit bio
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Edit Bio"),
                  IconButton(
                      onPressed: _showEditBioDialog, icon: Icon(Icons.edit)),
                ],
              ),
            ),
            //bio
            MyBioBox(
              text: _isLoading ? '...' : user!.bio,
            ),
            //list of posts from user
          ],
        ));
  }
}
