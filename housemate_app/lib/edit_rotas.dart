import 'package:flutter/material.dart';
import 'package:housemate_app/main.dart';

class EditRotas extends StatefulWidget {
  const EditRotas({super.key});

  @override
  State<EditRotas> createState() => _EditRotasState();
}

class _EditRotasState extends State<EditRotas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Your Rotas"),
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
    final reversedActionsList = actionsList.reversed.toList();

     return Scaffold(
      body: ListView.builder(
        itemCount: reversedActionsList.length,
        itemBuilder: (context, i) {

          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Text(reversedActionsList[i].notificationName[0]),
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