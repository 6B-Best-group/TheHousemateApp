import 'package:flutter/material.dart';
//simple menu for house finding
// WORK IN PROGRESS
class findHouse extends StatelessWidget {
  const findHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/joinHouse');
              },
              child: const Text("Join house")),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createHouse');
              },
              child: const Text("Make a house"))
        ],
      ));
  }
}
