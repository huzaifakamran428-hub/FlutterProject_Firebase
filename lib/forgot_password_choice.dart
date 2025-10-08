import 'package:flutter/material.dart';
import 'package:flutternewone/Forgot Password.dart'; // email reset screen
import 'package:flutternewone/Phoneauth.dart'; // phone reset screen

class ForgotPasswordChoice extends StatelessWidget {
  const ForgotPasswordChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select how you want to reset your password:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 32),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassowrd()),
                  );
                },
                icon: const Icon(Icons.email_outlined),
                label: const Text('Reset via Email', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              ),
              const SizedBox(height: 16),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhoneAuth()),
                  );
                },
                icon: const Icon(Icons.phone_android),
                label: const Text('Reset via Phone', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
