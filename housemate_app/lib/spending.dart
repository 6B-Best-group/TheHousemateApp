import 'package:flutter/material.dart';
import 'package:housemate_app/class/shoppingItem.dart';
import 'package:housemate_app/main.dart';
import 'package:housemate_app/profile.dart';
import 'package:housemate_app/user_profile.dart';

class spendingPage extends StatefulWidget {
  const spendingPage({super.key});
  @override
  State<spendingPage> createState() => _spendingPageState();
}

class _spendingPageState extends State<spendingPage> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    getSpending();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Total spending"),
        ),
        body: ListView.builder(
            itemCount: spendingMap.keys.length,
            itemBuilder: (context, i) {
              return ListTile(
                  title: Text(housemates[i].getUsername()),
                  subtitle: Text(
                      "Total spent:${spendingMap[housemates[i].getUsername()]}"),
                  trailing: IconButton(
                      icon: const Icon(Icons.arrow_right), onPressed: () {}));
            }));
  }
}

void getSpending() {
  for (User housemate in housemates) {
    String name = housemate.getUsername();
    spendingMap[name] = 0;
  }
  for (ShoppingItem item in broughItems) {
    String buyer = item.whoPaid;
    spendingMap[buyer] = item.cost;
  }
}
