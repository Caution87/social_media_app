import 'package:flutter/material.dart';
import 'package:my_social_media_app/components/my_button.dart';
import 'package:my_social_media_app/components/my_text_field.dart';

class SigninPage extends StatefulWidget {
  final void Function() onPressed;
  SigninPage({super.key, required this.onPressed});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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
                onPressed: () {},
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
