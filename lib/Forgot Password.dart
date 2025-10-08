import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutternewone/UiHelper.dart';

class ForgotPassowrd extends StatefulWidget {
  const ForgotPassowrd({super.key});

  @override
  State<ForgotPassowrd> createState() => _ForgotPassowrdState();
}

class _ForgotPassowrdState extends State<ForgotPassowrd> {
  TextEditingController emailController=TextEditingController();
  forgotpassword(String email)async{
  if(email==""){
  return UiHelper.CustomAlertBox(context, "Enter an Email To Reset Password");
  }
  else{
  FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
        UiHelper.customTextField(emailController, "Email", Icons.mail, false),
        SizedBox(height: 20),
        UiHelper.CustomButton(() {
          forgotpassword(emailController.text.toString());
        }, "Reset Password")
      ],),
    );
  }
}
