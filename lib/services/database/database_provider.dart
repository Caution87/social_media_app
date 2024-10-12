// ignore_for_file: unused_field

/*
This provider is to separate the firestore data handling and the UI of our app
The db service class handles data to and from firebase

this provider processes that data to display in our app
we need to separate ui and logic this is the logic
*/

import 'package:flutter/material.dart';
import 'package:my_social_media_app/models/post.dart';
import 'package:my_social_media_app/models/user.dart';
import 'package:my_social_media_app/services/auth/auth_service.dart';
import 'package:my_social_media_app/services/database/database_service.dart';

class DatabaseProvider extends ChangeNotifier {
  /*
    SERIVCES

  */
  //gwet db & auth service
  final _db = DatabaseService();
  final _auth = AuthService();
  /*
  USER PROFILE
  */

  //get user profile and given uid
  Future<UserProfile?> userProfile(String uid) => _db.getUser(uid);

  //update user bio
  Future<void> updateBio(String bio) => _db.updateUserBio(bio);
  //posts
  //local list of posts
  List<Post> _allPosts = [];

  //get posts
  List<Post> get allPosts => _allPosts;

  //post message
  Future<void> postMessage(String message) async {
    //post message in firebase
    await _db.postMessageInFirebase(message);
  }

  //fetch all posts
}
