import 'package:flutter/material.dart';
import 'package:housemate_app/class/general_chore_rota.dart';
import 'package:housemate_app/class/weekly_chore_rota.dart';
// import 'package:housemate_app/class/action_log_notification.dart';
import 'package:housemate_app/main.dart';

class Rota extends StatefulWidget {
  const Rota({super.key});

  @override
  State<Rota> createState() => _RotaState();
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.thumbnail,
    required this.choreName,
    required this.assignee,
    required this.nextAssignee,
    required this.onPressed,
  });

  final Widget thumbnail;
  final String choreName;
  final String assignee;
  final String nextAssignee;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 1, child: thumbnail),
          Expanded(
            flex: 1,
            child: Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: Text(choreName, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0))),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text('Assigned to: $assignee', style: const TextStyle(fontSize: 15.0)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text('Next: $nextAssignee', style: const TextStyle(fontSize: 10.0)),
        ],
      ),
    )
          ),
          IconButton(onPressed: onPressed, icon: const Icon(Icons.check, size: 16.0),)
        ],
      ),
    );
  }
}

class _RotaState extends State<Rota> {
  final generalChoreName = TextEditingController();

  final List<String> users = ["Alice", "Bob", "Charlie", "David"];
  String selectedUser = "Alice";
  List<String> selectedUsers = [];

  void addChore() {
    GeneralChoreRota rota = GeneralChoreRota(generalChoreName.text, selectedUsers);
    generalChoreRotaList.add(rota);
    setState(() {});
  }

  void addChoreDialog(context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                icon: const Icon(Icons.local_laundry_service_sharp),
                title: const Text("New General Chore Rota"),
                content: Wrap(
                  children: [
                    TextField(
                      controller: generalChoreName,
                        maxLength: 30,
                        decoration: const InputDecoration(
                          label: Text("Chore name:"),
                        )),
                    DropdownButton<String>(
                      hint: const Text("Choose the rota"),
                      value: selectedUser,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedUser = newValue!;
                        });
                      },
                      items: users.map<DropdownMenuItem<String>>((String user) {
                        return DropdownMenuItem<String>(
                          value: user,
                          child: Text(user),
                        );
                      }).toList(),
                    ),
                    TextButton(
                      onPressed: () {
                        if (!selectedUsers.contains(selectedUser)) {
                          setState(() {
                            selectedUsers.add(selectedUser);
                          });
                        }
                      },
                      child: const Text("Add to rota"),
                    ),
                  ],
                ),
                actions: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text("discard")),
                    TextButton.icon(
                        onPressed: () {
                          addChore();
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.save),
                        label: const Text("Add to list"))
                  ]),
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(initialIndex: 0, length: 2,
    child: Scaffold(
      appBar: AppBar(
        title: const Text("Rotas"),
        bottom: const TabBar(
          tabs: <Widget>[
            Tab(text: 'General Rota'),
            Tab(text: 'Weekly Rota'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addChoreDialog(context);
        },
        label: const Text("Create New Rota"),
        icon: const Icon(Icons.add),
        ),
      body: TabBarView(children: <Widget>[
        ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 106.0,
        itemCount: generalChoreRotaList.length,
        itemBuilder: (context, i) {
          return CustomListItem(
            onPressed: () {
              generalChoreRotaList[i].incrementRota();
              generalChoreRotaList[i].setLastCompleted();
              setState(() {});
            },
            choreName: generalChoreRotaList[i].choreName,
            assignee: generalChoreRotaList[i].getAssignee(),
            nextAssignee: generalChoreRotaList[i].getNextAssignee(),
            thumbnail: Container(decoration: const BoxDecoration(color: Color.fromARGB(255, 165, 237, 255)), 
              child: Center(child: Text('Last Completed: ${generalChoreRotaList[i].getLastCompleted()}\nBy: ${generalChoreRotaList[i].getLastAssignee()}'))),
          );
        },
      ),
        ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 106.0,
        itemCount: weeklyChoreRotaList.length,
        itemBuilder: (context, i) {
          return CustomListItem(
            onPressed: () {
              weeklyChoreRotaList[i].setCompleted();
              setState(() {});
            },
            choreName: weeklyChoreRotaList[i].choreName,
            assignee: weeklyChoreRotaList[i].getAssignee(),
            nextAssignee: weeklyChoreRotaList[i].getNextAssignee(),
            thumbnail: Container(decoration: BoxDecoration(color: weeklyChoreRotaList[i].getColor()), 
              child: Center(child: weeklyChoreRotaList[i].getIcon())),
          );
        },
      ),
      ]
    ),
    ),
    );
  }
}