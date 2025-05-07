import 'package:flutter/material.dart';
import 'package:housemate_app/main.dart';

class spendingPage extends StatefulWidget {
  const spendingPage({super.key});

  @override
  State<spendingPage> createState() => _spendingPageState();
}

class _spendingPageState extends State<spendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shopping List"),
        ),
        body: ListView.builder(
            itemCount: housemates.length,
            itemBuilder: (context, i) {
              return ListTile(
                  title: Text(housemates[i]),
                  subtitle: Text("Total spent:"),
                  trailing: IconButton(
                      icon: const Icon(Icons.arrow_right), onPressed: () {}));
            }));
  }
}
