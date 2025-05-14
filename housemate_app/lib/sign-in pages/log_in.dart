import 'package:flutter/material.dart';
import 'package:housemate_app/dataInfo.dart';
import 'package:housemate_app/sign-in%20pages/forgot_pass.dart';
import 'package:housemate_app/sign-in%20pages/sign_up.dart';

class log_In extends StatefulWidget {
  const log_In({super.key});

  @override
  State<log_In> createState() => _log_inState();
}

class _log_inState extends State<log_In> {
  final username = TextEditingController();
  final password = TextEditingController();

  void submit() async {
    //password check
    //send to next screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: Form(
        child: ListView(
          children: [
            TextField(
                controller: username,
                maxLength: inputLen["userName"],
                decoration: InputDecoration(labelText: "Email")),
            TextField(
                controller: password,
                maxLength: inputLen["password"],
                decoration: const InputDecoration(labelText: "password")),
            TextButton.icon(
              onPressed: () {
                submit();
              },
              icon: const Icon(Icons.check_rounded),
              label: const Text("Log in!"),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const forgot_Pass()),
                );
              },
              icon: const Icon(Icons.question_mark),
              label: const Text("Forgot Password"),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const sign_up()),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text("Make an account"),
            )
          ],
        ),
      ),
    );
  }
}
