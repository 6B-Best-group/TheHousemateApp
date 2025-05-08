import 'package:flutter/material.dart';
import 'package:housemate_app/class/action_log_notification.dart';

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

  ActionLogNotification test1 = ActionLogNotification('Name', 'Detail');
  ActionLogNotification test2 = ActionLogNotification('Steven added to the shopping list', '1x Dish Soap was added');
  ActionLogNotification test3 = ActionLogNotification('Mern added a chore/event to the calendar', 'Vacuum kitchen');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 200, 0, 0),
              child: Text(test1.notificationName[0])
              ),
            title: Text(test1.notificationName),
            subtitle: Text(test1.notificationDetail),
            trailing: Text(test1.dateAdded.toString()),
          ),
          const Divider(height: 0),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 0, 200, 0),
              child: Text(test2.notificationName[0])
              ),
            title: Text(test2.notificationName),
            subtitle: Text(test2.notificationDetail),
            trailing: Text(test2.dateAdded.toString()),
          ),
          const Divider(height: 0),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 0, 0, 200),
              child: Text(test3.notificationName[0])
              ),
            title: Text(test3.notificationName),
            subtitle: Text(test3.notificationDetail),
            trailing: Text(test3.dateAdded.toString()),
          ),
          const Divider(height: 0),
        ],
      ),
    );
  }
}