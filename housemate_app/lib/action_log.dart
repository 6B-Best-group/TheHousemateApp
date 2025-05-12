// Imports.
import 'package:flutter/material.dart'; // To use flutter widgets implementing Material Design.
import 'package:housemate_app/main.dart'; // To access the actionsList.

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
    // Reversing the actionsList so the most recent actions appear at the top of the list.
    final reversedActionsList = actionsList.reversed.toList();

     return Scaffold(
      // Builds a list of a size dependent on the length of actions in the list.
      body: ListView.builder(
        itemCount: reversedActionsList.length,
        itemBuilder: (context, i) {

          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Text(reversedActionsList[i].notificationName[0]), // Sets the avatar to the firts letter of the user's name.
                ),
                title: Text(reversedActionsList[i].notificationName), 
                subtitle: Text(reversedActionsList[i].notificationDetail),
                trailing: Text(reversedActionsList[i].dateAdded.toString().substring(0, 16)),
              ),
              const Divider(height: 0),
            ],
          );
      },
    ),
     );
  }
}