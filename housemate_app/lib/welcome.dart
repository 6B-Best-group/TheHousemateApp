import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Dweller"),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signUp');
              },
              child: const Text("Sign Up")),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Login in"))
        ],
      ),
    );
  }
}
