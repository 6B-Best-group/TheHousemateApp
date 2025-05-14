import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:housemate_app/class/action_log_notification.dart';
import 'package:housemate_app/class/general_chore_rota.dart';
import 'package:housemate_app/class/weekly_chore_rota.dart';
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
          Row(
            children: [
              IconButton(onPressed: onCheckPressed, icon: const Icon(Icons.check, size: 16.0)),
              IconButton(onPressed: onDeletePressed, icon: const Icon(Icons.delete, size: 16.0)),
              IconButton(onPressed: onFullRotaPressed, icon: const Icon(Icons.more_vert, size: 16.0)),
            ],
            )
        ],
      ),
    );
  }
}

class _RotaState extends State<Rota> {
  final generalChoreName = TextEditingController();
  final weeklyChoreName = TextEditingController();
  String selectedUser = "Ben";
  List<String> selectedUsers = [];
  List<DropdownMenuEntry<String>> menuEntries = UnmodifiableListView<DropdownMenuEntry<String>>(
    users1.map<DropdownMenuEntry<String>>((String name) => DropdownMenuEntry<String>(value: name, label: name)),
  );

  void addGeneralChore() {
    GeneralChoreRota rota = GeneralChoreRota(generalChoreName.text, selectedUsers);
    generalChoreRotaList.add(rota);
    ActionLogNotification action = ActionLogNotification('${currentUser.getFirstName()} ${currentUser.getLastName()} added a new general chore rota: ${generalChoreName.text}', 'Rota: ${selectedUsers.join(' → ')}');
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
                    DropdownMenu<String>(
                      initialSelection: users1[0],
                      onSelected: (String? value) {
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
    WeeklyChoreRota rota = WeeklyChoreRota(weeklyChoreName.text, selectedUsers);
    weeklyChoreRotaList.add(rota);
    ActionLogNotification action = ActionLogNotification('${currentUser.getFirstName()} ${currentUser.getLastName()} added a new weekly chore rota: ${weeklyChoreName.text}', 'Rota: ${selectedUsers.join(' → ')}');
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
                    DropdownMenu<String>(
                      initialSelection: users1[0],
                      onSelected: (String? value) {
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
    generalChoreRotaList.remove(rota);
    ActionLogNotification logAction = ActionLogNotification('${currentUser.getFirstName()} ${currentUser.getLastName()} deleted a general chore rota', rota.choreName);
    actionsList.add(logAction);
  }

  void removeWeeklyRota(rota) {
    weeklyChoreRotaList.remove(rota);
    ActionLogNotification logAction = ActionLogNotification('${currentUser.getFirstName()} ${currentUser.getLastName()} deleted a weekly chore rota', rota.choreName);
    actionsList.add(logAction);
  }

  void showFullRota(context, rota) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                icon: const Icon(Icons.assignment),
                title: const Text("Full Rota:"),
                content: Wrap(
                  children: [
                    Center(child: Text(rota.choreRota.join(' → '),
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
            onPressed: () {
              addGeneralDialog(context);
            },
            label: const Text("General Rota"),
            icon: const Icon(Icons.add),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
          FloatingActionButton.extended(
            onPressed: () {
              addWeeklyDialog(context);
            },
            label: const Text("Weekly Rota"),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: TabBarView(children: <Widget>[
        ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 106.0,
        itemCount: generalChoreRotaList.length,
        itemBuilder: (context, i) {
          return CustomListItem(
            onCheckPressed: () {
              ActionLogNotification action = ActionLogNotification('${generalChoreRotaList[i].getAssignee()} completed a task of the general chore rota', generalChoreRotaList[i].choreName);
              actionsList.add(action);
              generalChoreRotaList[i].incrementRota();
              generalChoreRotaList[i].setLastCompleted();
              setState(() {});
            },
            onDeletePressed: () {
              removeGeneralRota(generalChoreRotaList[i]);
              setState(() {});
            }, 
            onFullRotaPressed: () {
              showFullRota(context, generalChoreRotaList[i]);
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
            onCheckPressed: () {
              weeklyChoreRotaList[i].setCompleted();
              if (weeklyChoreRotaList[i].completed) {
                ActionLogNotification action = ActionLogNotification('${weeklyChoreRotaList[i].getAssignee()} marked a weekly chore as completed', weeklyChoreRotaList[i].choreName);
                actionsList.add(action);
              } else {
                ActionLogNotification action = ActionLogNotification('${weeklyChoreRotaList[i].getAssignee()} marked a weekly chore as incomplete', weeklyChoreRotaList[i].choreName);
                actionsList.add(action);
              }
              setState(() {});
            },
            onDeletePressed: () {
              removeWeeklyRota(weeklyChoreRotaList[i]);
              setState(() {});
            },
            onFullRotaPressed: () {
              showFullRota(context, weeklyChoreRotaList[i]);
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