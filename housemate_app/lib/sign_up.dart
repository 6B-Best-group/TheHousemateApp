import 'package:flutter/material.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _log_inState();
}

class _log_inState extends State<sign_up> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: Form(
        child: ListView(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Email")),
            const TextField(decoration: InputDecoration(labelText: "Username")),
            const TextField(decoration: InputDecoration(labelText: "Password")),
            const TextField(
                decoration: InputDecoration(labelText: "Confirm password")),
            TextButton.icon(
              onPressed: () {
                createAccount(context);
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

void createAccount(context){
  
}