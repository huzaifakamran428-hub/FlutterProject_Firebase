import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutternewone/main.dart';

class Otpscreen extends StatefulWidget {
  String verificationid;
  Otpscreen({super.key,required this.verificationid});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  TextEditingController otpController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otp Screen"),
        centerTitle: true,

      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: otpController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "Enter the Otp",
              suffixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25)
              )
            ),
          ),
        ),
        SizedBox(height: 30), /////////////////
        ElevatedButton(onPressed: ()async{
    try{
    PhoneAuthCredential credential=await PhoneAuthProvider.credential(verificationId: widget.verificationid, smsCode: otpController.text.toString());
    FirebaseAuth.instance.signInWithCredential(credential).then((value){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "My Home Page")));
    });
    }
catch (ex) {
  print(ex.toString());

}
    },
            child: Text("OTP"))
      ],),
    );
  }
}
