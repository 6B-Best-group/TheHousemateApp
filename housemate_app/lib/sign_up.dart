import 'package:flutter/material.dart';
import 'package:housemate_app/dataInfo.dart';
import 'package:housemate_app/main.dart';
import 'package:housemate_app/class/profile.dart';
import 'inputCheck.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _log_inState();
}

class _log_inState extends State<sign_up> {
  final password = TextEditingController();
  final fname = TextEditingController();
  final lname = TextEditingController();
  final username = TextEditingController();
  final userEmail = TextEditingController();
  final date = TextEditingController();

  void submit() async {
    DataChecks check = DataChecks();
    bool userValid = check.createUserChecks(
        fname.text, lname.text, username.text, userEmail.text, DateTime.now());
    if (userValid) {
      currentUser.createUser(fname.text, lname.text, username.text,
          userEmail.text, DateTime.now());
    }
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
                controller: userEmail,
                maxLength: 15,
                decoration: const InputDecoration(labelText: "Email")),
            TextField(
                controller: username,
                maxLength: inputLen["userName"],
                decoration: InputDecoration(labelText: "Username")),
            TextField(
                controller: fname,
                maxLength: inputLen["firstName"],
                decoration: const InputDecoration(labelText: "First name")),
            TextField(
                controller: lname,
                maxLength: inputLen["lastName"],
                decoration: const InputDecoration(labelText: "Last name")),
            //ADD DATE OF BIRTH
            InputDatePickerFormField(
                firstDate: DateTime.parse("1925-01-01"),
                lastDate: DateTime.now()),
            TextField(
                controller: password,
                maxLength: inputLen["password"],
                decoration: const InputDecoration(labelText: "Password")),
            TextField(
                maxLength: inputLen["password"],
                decoration:
                    const InputDecoration(labelText: "Confirm password")),
            TextButton.icon(
              onPressed: () {
                submit();
              },
              icon: Icon(Icons.add),
              label: Text("Create"),
            )
          ],
        ),
      ),
    );
  }
}
