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
            TextField(decoration: InputDecoration()),
            TextField(decoration: InputDecoration()),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.check_rounded),
              label: Text("Log in!"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.question_mark),
              label: Text("Forgot Password"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Make an account"),
            )
          ],
        ),
      ),
    );
  }
}
