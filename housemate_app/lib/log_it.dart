import 'package:flutter/material.dart';

class log_In extends StatefulWidget {
  const log_In({super.key});

  @override
  State<log_In> createState() => _log_inState();
}

class _log_inState extends State<log_In> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: Form(
        child: ListView(
          children: [
            const TextField(decoration: InputDecoration()),
            const TextField(decoration: InputDecoration()),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.check_rounded),
              label: const Text("Log in!"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.question_mark),
              label: const Text("Forgot Password"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Make an account"),
            )
          ],
        ),
      ),
    );
  }
}
