// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_social_media_app/components/my_button.dart';
import 'package:my_social_media_app/components/my_loading_circle.dart';
import 'package:my_social_media_app/components/my_text_field.dart';
import 'package:my_social_media_app/services/auth/auth_service.dart';

class SigninPage extends StatefulWidget {
  final void Function() onPressed;
  SigninPage({super.key, required this.onPressed});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  //access auth service
  final _auth = AuthService();
  //sigin funcn
  void signin() async {
    //check if passwords match
    if (pwdController.text == confirmPwdController.text) {
      //show loading circle
      showLoadingCircle(context);
      //attempt to sigin
      try {
        await _auth.signinEmailPwd(emailController.text, pwdController.text);
        //finish loading
        if (mounted) hideLoadingCircle(context);
      } catch (e) {
        if (mounted) hideLoadingCircle(context);
        if (mounted) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(e.toString()),
                  ));
        }
      }
    }
    //passwords dont match then show error
    else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Password don't match"),
              ));
    }
  }

  //text Controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();
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
              Text("Create an account"),
              //name controller
              MyTextField(
                  myController: nameController,
                  myHintText: "Your name",
                  isObscureText: false),
              MyTextField(
                  myController: emailController,
                  myHintText: "Email",
                  isObscureText: false),
              MyTextField(
                  myController: pwdController,
                  myHintText: "Password",
                  isObscureText: true),
              MyTextField(
                  myController: confirmPwdController,
                  myHintText: "Confirm password",
                  isObscureText: true),
              Text("Forgot Password"),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              MyButton(
                buttonText: "Signin",
                onPressed: signin,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              MyButton(
                  onPressed: widget.onPressed,
                  buttonText: "Already Have an Account? Login!")
            ],
          ),
        ),
      ),
    );
  }
}
