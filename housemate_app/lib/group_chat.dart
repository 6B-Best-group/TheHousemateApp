import 'package:flutter/material.dart';

class GroupChatPage extends StatefulWidget {
  const GroupChatPage({super.key});

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Group Chat',
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.purple,
              child: Column(),
              ),
            ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.green,
              child: Column()),
            ),
        ],
      ),
    );
  }
}