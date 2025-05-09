import 'package:flutter/material.dart';
// import 'package:housemate_app/class/action_log_notification.dart';
import 'package:housemate_app/main.dart';

class Rota extends StatefulWidget {
  const Rota({super.key});

  @override
  State<Rota> createState() => _RotaState();
}

class _RotaState extends State<Rota> {
  @override
  Widget build(BuildContext context) {
    final reversedActionsList = actionsList.reversed.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rota"),
      ),
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