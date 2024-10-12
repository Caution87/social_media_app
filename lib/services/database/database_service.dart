/*

-user profile
-post message
-likes
-comments
-account stuff
-follow/unfollow
-search users
*/

//create class
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_social_media_app/models/user.dart';
import 'package:my_social_media_app/services/auth/auth_service.dart';

class DatabaseService {
  //get instance of firestore database and auth
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  //user profile
  //whena  new user signsin we create acct for them and store their details to display on pfp

  //save user info
  Future<void> saveUserInfo(
      {required String name, required String email}) async {
    //get current uid
    String uid = _auth.currentUser!.uid;
    //extract username from email
    String username = email.split('@')[0];
    //create userprofile
    UserProfile user = UserProfile(
        uid: uid, name: name, email: email, username: username, bio: '');
    //convert user into a map to store
    final userMap = user.toMap();
    //save user into firebase
    await _db.collection("Users").doc(uid).set(userMap);
  }

  //get user info
  Future<UserProfile?> getUser(String uid) async {
    try {
      DocumentSnapshot userDoc = await _db.collection("Users").doc(uid).get();
      //convert doc to user profile
      return UserProfile.fromDocument(userDoc);
    } catch (e) {
      print(e);
      return null;
    }
  }

  //Update user bio
  Future<void> updateUserBio(String bio) async {
    //get current uid
    String uid = AuthService().getCurrentUid();
    //attempt to update
    try {
      await _db.collection("Users").doc(uid).update({'bio': bio});
    } catch (e) {
      print(e);
    }
  }
}
