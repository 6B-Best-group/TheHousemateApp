import 'package:flutter/material.dart';

class ActionLog extends StatefulWidget {
  const ActionLog({super.key});

  @override
  State<ActionLog> createState() => _ActionLogState();
}

class _ActionLogState extends State<ActionLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Action Log"),
      ),
      body: const MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  void submitButtonHandler() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 200, 0, 0),
              child: Text('A')
              ),
            title: Text('<user> completed a chore'),
            subtitle: Text('Cleaning the Bathroom'),
            trailing: Text('01/01/2025 14:35'),
          ),
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 0, 200, 0),
              child: Text('B')
              ),
            title: Text('<user> added to the shopping list'),
            subtitle: Text(
              '1x Dish Soap was added',
            ),
            trailing: Text('25/12/2024 06:15'),
          ),
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 0, 0, 200),
              child: Text('C')
              ),
            title: Text('<user> added a chore/event to the calendar'),
            subtitle: Text(
              'Vacuum kitchen',
            ),
            trailing: Text('31/08/2024 21:47'),
          ),
          Divider(height: 0),
        ],
      ),
    );
  }
}