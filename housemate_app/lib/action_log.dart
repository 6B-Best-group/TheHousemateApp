import 'package:flutter/material.dart';
import 'package:housemate_app/class/action_log_notification.dart';
import 'package:housemate_app/main.dart';

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

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: ListView.builder(
        itemCount: actionsList.length,
        itemBuilder: (context, i) {

          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Text(actionsList[i].notificationName[0]),
                ),
                title: Text(actionsList[i].notificationName),
                subtitle: Text(actionsList[i].notificationDetail),
                trailing: Text(actionsList[i].dateAdded.toString()),
              ),
              const Divider(height: 0),
            ],
          );
      },
    ),
     );
  }
}