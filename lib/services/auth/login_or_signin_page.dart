import 'package:flutter/material.dart';
import 'package:my_social_media_app/pages/login_page.dart';
import 'package:my_social_media_app/pages/signin_page.dart';

class LoginOrSigninPage extends StatefulWidget {
  LoginOrSigninPage({super.key});

  @override
  State<LoginOrSigninPage> createState() => _LoginOrSigninPageState();
}

class _LoginOrSigninPageState extends State<LoginOrSigninPage> {
  //initially shows login page
  bool showLoginPage = true;
  //toggle between login and sigin
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onPressed: togglePage);
    } else {
      return SigninPage(onPressed: togglePage);
    }
  }
}
