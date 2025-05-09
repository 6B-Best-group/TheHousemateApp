import 'package:flutter/material.dart';
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
  });

  final Widget thumbnail;
  final String choreName;
  final String assignee;
  final String nextAssignee;

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
          const Icon(Icons.more_vert, size: 16.0),
        ],
      ),
    );
  }
}

class _RotaState extends State<Rota> {

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
      body: TabBarView(children: <Widget>[
        ListView(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 106.0,
        children: <CustomListItem>[
          CustomListItem(
            choreName: 'Take out Food Bin',
            assignee: '${currentUser.getFirstName()} ${currentUser.getLastName()}',
            nextAssignee: '${currentUser.getFirstName()} ${currentUser.getLastName()}',
            thumbnail: Container(decoration: const BoxDecoration(color: Colors.green), 
              child: Center(child: Text("data"))),
          ),
          CustomListItem(
            choreName: 'Clean Microwave',
            assignee: 'Dash',
            nextAssignee: '884000',
            thumbnail: Container(decoration: const BoxDecoration(color: Colors.red)),
          ),
        ],
      ),
      ListView(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 106.0,
        children: <CustomListItem>[
          CustomListItem(
            choreName: 'Cleaning Kitchen Sides',
            assignee: '${currentUser.getFirstName()} ${currentUser.getLastName()}',
            nextAssignee: '${currentUser.getFirstName()} ${currentUser.getLastName()}',
            thumbnail: Container(decoration: const BoxDecoration(color: Colors.green)),
          ),
          CustomListItem(
            choreName: 'Bleach Toilet',
            assignee: 'Dash',
            nextAssignee: '884000',
            thumbnail: Container(decoration: const BoxDecoration(color: Colors.red)),
          ),
        ],
      ),
      ]
    ),
    ),
    );
  }
}