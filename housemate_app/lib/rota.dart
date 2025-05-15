import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:housemate_app/class/action_log_notification.dart';
import 'package:housemate_app/class/general_chore_rota.dart';
import 'package:housemate_app/class/weekly_chore_rota.dart';
import 'package:housemate_app/main.dart';
import 'package:housemate_app/utils/database/data-models.dart';
import 'package:housemate_app/utils/database/database.dart';

class Rota extends StatefulWidget {
  const Rota({super.key});

  @override
  State<Rota> createState() => _RotaState();
}

class RotaItem extends StatelessWidget {
  const RotaItem({
    super.key,
    required this.thumbnail,
    required this.choreName,
    required this.assignee,
    required this.nextAssignee,
    required this.onCheckPressed,
    required this.onDeletePressed,
    required this.onFullRotaPressed,
  });

  final Widget thumbnail;
  final String choreName;
  final String assignee;
  final String nextAssignee;
  final VoidCallback onCheckPressed;
  final VoidCallback onDeletePressed;
  final VoidCallback onFullRotaPressed;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, width: 1,
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1, 
              child: thumbnail
              ),
            Expanded(
              flex: 2, // flex 1
              child: Padding(
                //padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                padding: EdgeInsets.all(8),
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
            Row(
              children: [
                IconButton(onPressed: onCheckPressed, icon: const Icon(Icons.check, size: 16.0)),
                IconButton(onPressed: onDeletePressed, icon: const Icon(Icons.delete, size: 16.0)),
                IconButton(onPressed: onFullRotaPressed, icon: const Icon(Icons.more_vert, size: 16.0)),
              ],
              )
          ],
        ),
      ),
    );
  }
}

class _RotaState extends State<Rota> {
  final generalChoreName = TextEditingController();
  final weeklyChoreName = TextEditingController();

  List<GeneralChoreRota> generalChoreRota = Database().generalChoreRotaList;
  List<WeeklyChoreRota> weeklyChoreRota = Database().weeklyChoreRotaList;

  User selectedUser = Database().users[Database().currentUser];
  List<User> selectedUsers = [];

  User currentUser = Database().users[Database().currentUser];


  List<DropdownMenuEntry<User>> menuEntries = UnmodifiableListView<DropdownMenuEntry<User>>(
    Database().users.map<DropdownMenuEntry<User>>((User name) => DropdownMenuEntry<User>(value: name, label: name.firstName)),
  );

  void addGeneralChore() {
    GeneralChoreRota rota = GeneralChoreRota(generalChoreName.text, selectedUsers,currentUser);
    Database().generalChoreRotaList.add(rota);
    ActionLogNotification action = ActionLogNotification('${currentUser.firstName} ${currentUser.lastName} added a new general chore rota: ${generalChoreName.text}', 'Rota: ${selectedUsers.join(' → ')}');
    actionsList.add(action);
    setState(() {
      selectedUsers = [];
    });
  }

  void addGeneralDialog(context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                icon: const Icon(Icons.local_laundry_service_sharp),
                title: const Text("New General Rota"),
                content: Wrap(
                  children: [
                    TextField(
                      controller: generalChoreName,
                        maxLength: 30,
                        decoration: const InputDecoration(
                          label: Text("Chore name:"),
                        )),
                    DropdownMenu<User>(
                      initialSelection: currentUser,
                      onSelected: (value) {
                        setState(() {
                          selectedUser = value!;
                        });
                      },
                      dropdownMenuEntries: menuEntries,
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
                          if (selectedUsers.isNotEmpty) {
                            addGeneralChore();
                            Navigator.pop(context);
                          }
                        },
                        icon: const Icon(Icons.save),
                        label: const Text("Add to list"))
                  ]),
                ]));
  }

  void addWeeklyChore() {
    WeeklyChoreRota rota = WeeklyChoreRota(weeklyChoreName.text, selectedUsers, currentUser);
    Database().weeklyChoreRotaList.add(rota);
    ActionLogNotification action = ActionLogNotification('${currentUser.firstName} ${currentUser.lastName} added a new weekly chore rota: ${weeklyChoreName.text}', 'Rota: ${selectedUsers.join(' → ')}');
    actionsList.add(action);
    setState(() {
      selectedUsers = [];
    });
  }

  void addWeeklyDialog(context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                icon: const Icon(Icons.event_repeat),
                title: const Text("New Weekly Rota"),
                content: Wrap(
                  children: [
                    TextField(
                      controller: weeklyChoreName,
                        maxLength: 30,
                        decoration: const InputDecoration(
                          label: Text("Chore name:"),
                        )),
                    DropdownMenu<User>(
                      initialSelection: currentUser,
                      onSelected: (value) {
                        setState(() {
                          selectedUser = value!;
                        });
                      },
                      dropdownMenuEntries: menuEntries,
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
                          if (selectedUsers.isNotEmpty) {
                            addWeeklyChore();
                            Navigator.pop(context);
                          }
                        },
                        icon: const Icon(Icons.save),
                        label: const Text("Add to list"))
                  ]),
                ]));
  }

  void removeGeneralRota(rota) {
    Database().generalChoreRotaList.remove(rota);
    ActionLogNotification logAction = ActionLogNotification('${currentUser.firstName} ${currentUser.lastName} deleted a general chore rota', rota.choreName);
    actionsList.add(logAction);
  }

  void removeWeeklyRota(rota) {
    Database().weeklyChoreRotaList.remove(rota);
    ActionLogNotification logAction = ActionLogNotification('${currentUser.firstName} ${currentUser.lastName} deleted a weekly chore rota', rota.choreName);
    actionsList.add(logAction);
  }

  void showFullRota(context, List<User> rota) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                icon: const Icon(Icons.assignment),
                title: const Text("Full Rota:"),
                content: Wrap(
                  children: [
                    Center(child: Text(rota.map((user) => user.firstName).join(' → '),
                    )
                  ),
                  ],
                ),
                actions: [
                  Center(child: 
                    TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                        label: const Text("Close")),
                  ),
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: 'generalRotaFab',
            onPressed: () {
              addGeneralDialog(context);
            },
            label: const Text("General Rota"),
            icon: const Icon(Icons.add),
            hoverColor: Colors.cyan,
          ),

          const Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
          FloatingActionButton.extended(
            heroTag: 'weeklyRotaFab',
            onPressed: () {
              addWeeklyDialog(context);
            },
            label: const Text("Weekly Rota"),
            icon: const Icon(Icons.add),
            hoverColor: Colors.cyan,
          ),
        ],
      ),
      body: TabBarView(children: <Widget>[
        ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 106.0,
        itemCount: Database().generalChoreRotaList.length,
        itemBuilder: (context, i) {
          return RotaItem( // the general chore rota
            onCheckPressed: () {
              ActionLogNotification action = ActionLogNotification('${currentUser.firstName} completed a task of the general chore rota', generalChoreRota[i].choreName);
              actionsList.add(action);
              Database().generalChoreRotaList[i].incrementRota();
              Database().generalChoreRotaList[i].setLastCompleted();
              setState(() {});
            },
            onDeletePressed: () {
              removeGeneralRota(generalChoreRota[i]);
              setState(() {});
            }, 
            onFullRotaPressed: () {
              showFullRota(context, generalChoreRota[i].choreRota);
            },
            choreName: generalChoreRota[i].choreName,
            assignee: generalChoreRota[i].getAssignee(),
            nextAssignee: generalChoreRota[i].getNextAssignee(),
            thumbnail: Container(
              decoration: const BoxDecoration(
                color: Colors.cyan,
                //border: Border(right: const BorderSide(color: Colors.black, width: 2)),
                ), 
              child: Center(child: Text('Last Completed: ${Database().generalChoreRotaList[i].getLastCompleted()}\nBy: ${Database().generalChoreRotaList[i].getLastAssignee()}'))),
          );
        },
      ),
        ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 106.0,
        itemCount: weeklyChoreRota.length,
        itemBuilder: (context, i) {
          return RotaItem(
            onCheckPressed: () {
              weeklyChoreRota[i].setCompleted();
              if (weeklyChoreRota[i].completed) {
                ActionLogNotification action = ActionLogNotification('${weeklyChoreRota[i].assignee} marked a weekly chore as completed', weeklyChoreRota[i].choreName);
                actionsList.add(action);
              } else {
                ActionLogNotification action = ActionLogNotification('${weeklyChoreRota[i].assignee} marked a weekly chore as incomplete', weeklyChoreRota[i].choreName);
                actionsList.add(action);
              }
              setState(() {});
            },
            onDeletePressed: () {
              removeWeeklyRota(weeklyChoreRota[i]);
              setState(() {});
            },
            onFullRotaPressed: () {
              showFullRota(context, weeklyChoreRota[i].choreRota);
            },
            choreName: weeklyChoreRota[i].choreName,
            assignee: weeklyChoreRota[i].assignee.firstName,
            nextAssignee: weeklyChoreRota[i].choreRota.first.firstName,
            thumbnail: Container(
              decoration: BoxDecoration(
                color: weeklyChoreRota[i].getColor(),
                ), 
                child: Center(child: weeklyChoreRota[i].getIcon())
                ),
          );
        },
      ),
      ]
    ),
    ),
    );
  }
}