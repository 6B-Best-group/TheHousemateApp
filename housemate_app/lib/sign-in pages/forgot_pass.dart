import 'package:flutter/material.dart';

class forgot_Pass extends StatefulWidget {
  const forgot_Pass({super.key});

  @override
  State<forgot_Pass> createState() => _log_inState();
}

class _log_inState extends State<forgot_Pass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: Form(
        child: ListView(
          children: [
            const Text(
                "Enter your email and we will send you an email to reset your password"),
            const TextField(decoration: InputDecoration(labelText: "Email")),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.check_rounded),
              label: const Text("Send reset code"),
            ),
          ],
        ),
      ),
    );
  }
}
