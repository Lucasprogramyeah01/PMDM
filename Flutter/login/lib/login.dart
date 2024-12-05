import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFE62F16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const Image(
              image: AssetImage('assets/path_logo.png')
            ),

            ElevatedButton(
              onPressed: () {},
              child: const Text('Sign up'),
            ),

          ]
        ),
      )
    );
  }
}