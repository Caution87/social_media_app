import 'package:flutter/material.dart';
import 'package:my_social_media_app/components/my_button.dart';
import 'package:my_social_media_app/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function() onPressed;
  LoginPage({super.key, required this.onPressed});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
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
              //email Controlelr
              MyTextField(
                  myController: emailController,
                  myHintText: "Email",
                  isObscureText: false),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              MyTextField(
                  myController: pwdController,
                  myHintText: "Password",
                  isObscureText: true),
              Text("Forgot Password"),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              MyButton(
                buttonText: "Login",
                onPressed: () {},
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              MyButton(onPressed: widget.onPressed, buttonText: "No account? Signin now!")
            ],
          ),
        ),
      ),
    );
  }
}
