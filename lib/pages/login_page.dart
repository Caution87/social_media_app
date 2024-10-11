import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_social_media_app/components/my_button.dart';
import 'package:my_social_media_app/components/my_text_field.dart';
import 'package:my_social_media_app/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function() onPressed;
  LoginPage({super.key, required this.onPressed});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  // Access AuthService instance
  final _auth = AuthService();

  // Login method
  void login() async {
    try {
      // Use .text to get the input from the text fields
      await _auth.loginEmailPwd(emailController.text, pwdController.text);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.3,
              ),
              Icon(
                Icons.camera,
                size: 48,
              ),
              Text("Welcome Back"),
              // Email Controller
              MyTextField(
                myController: emailController,
                myHintText: "Email",
                isObscureText: false,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              // Password Controller
              MyTextField(
                myController: pwdController,
                myHintText: "Password",
                isObscureText: true,
              ),
              Text("Forgot Password"),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              MyButton(
                buttonText: "Login",
                onPressed: login, // Calls the login method
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              MyButton(
                onPressed: widget.onPressed,
                buttonText: "No account? Sign in now!",
              )
            ],
          ),
        ),
      ),
    );
  }
}
