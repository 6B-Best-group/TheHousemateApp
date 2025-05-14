import 'package:flutter/material.dart';
import 'package:housemate_app/class/action_log_notification.dart';
import 'package:housemate_app/class/general_chore_rota.dart';
import 'package:housemate_app/class/weekly_chore_rota.dart';
// import 'package:housemate_app/class/action_log_notification.dart';
import 'package:housemate_app/main.dart';
import 'package:housemate_app/utils/database/data-models.dart';
import 'package:housemate_app/utils/database/database.dart';
import 'package:housemate_app/utils/helpers.dart';

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

  late List<User> users; // users and the current user
  late User selectedUser ;


  List<User> selectedUsers = [];

  void addChore() {
    GeneralChoreRota rota = GeneralChoreRota(generalChoreName.text, nextAssigned(3, selectedUser, users)); // look at this
    Database().generalChoreRotaList.add(rota);
    ActionLogNotification action = ActionLogNotification('${currentUser.getFirstName()} ${currentUser.getLastName()} added a new general chore rota', 'Rota: ${selectedUsers.join(' → ')}');
    actionsList.add(action);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    users = Database().users;
    selectedUser = Database().users[Database().currentUser];

    super.initState();
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
                    DropdownButton<User>(
                      hint: const Text("Choose the rota"),
                      value: selectedUser,
                      onChanged: (User? newValue) {
                        setState(() {
                          selectedUser = newValue!;
                        });
                      },
                      items: users.map<DropdownMenuItem<User>>((User user) {
                        return DropdownMenuItem<User>(
                          value: user,
                          child: Text(user.firstName),
                        );
                      }).toList(),
                    ),
                    TextButton( // add to rota
                      onPressed: () {
                        if (!selectedUsers.contains(selectedUser)) {
                          setState(() {
                            selectedUsers.add(selectedUser);
                          });
                          print(selectedUser.firstName);
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
        itemCount: Database().generalChoreRotaList.length,
        itemBuilder: (context, i) {
          return CustomListItem( // general chore rota
            onPressed: () {
              ActionLogNotification action = ActionLogNotification('${Database().generalChoreRotaList[i].getAssignee()} completed a task of the general chore rota', Database().generalChoreRotaList[i].choreName);
              actionsList.add(action);
              Database().generalChoreRotaList[i].incrementRota();
              Database().generalChoreRotaList[i].setLastCompleted();
              setState(() {});
            },
            choreName: Database().generalChoreRotaList[i].choreName,
            assignee: Database().generalChoreRotaList[i].getAssignee(),
            nextAssignee: Database().generalChoreRotaList[i].getNextAssignee(),
            thumbnail: Container(decoration: const BoxDecoration(color: Color.fromARGB(255, 165, 237, 255)), 
              child: Center(child: Text('Last Completed: ${Database().generalChoreRotaList[i].getLastCompleted()}\nBy: ${Database().generalChoreRotaList[i].getLastAssignee()}'))),
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