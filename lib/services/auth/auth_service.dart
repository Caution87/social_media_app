/*
-login
-signin
-logout
-delete account
*/
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //create instance
  final _auth = FirebaseAuth.instance;
  //get current user and uid
  User? getCurrentUser() => _auth.currentUser;
  String getCurrentUid() => _auth.currentUser!.uid;
  //login
  Future<UserCredential> loginEmailPwd(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sigin
  Future<UserCredential> signinEmailPwd(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //logout
  Future<void> logout() async {
    await _auth.signOut();
  }
  //delete
}
