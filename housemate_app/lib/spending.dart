import 'package:flutter/material.dart';
import 'package:housemate_app/class/shoppingItem.dart';
import 'package:housemate_app/main.dart';
import 'package:housemate_app/utils/database/data-models.dart';
import 'package:housemate_app/utils/database/database.dart';


class spendingPage extends StatefulWidget {
  const spendingPage({super.key});
  @override
  State<spendingPage> createState() => _spendingPageState();
}

class _spendingPageState extends State<spendingPage> {

  late User currentUser;

  List<User> housemates = Database().users;

  @override
  void initState() {
    super.initState();
    currentUser = Database().users[Database().currentUser];
    getSpending();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Total spending"),
        ),
        body: ListView.builder(
            itemCount: spendingMap.keys.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(Database().users[i].firstName),
                subtitle: Text(
                    "Total spent: ${currentUser.spending}"),
              );
            }));
  }
}

void getSpending() {
  for (User housemate in Database().users ) {
    String name = housemate.firstName;
    spendingMap[name] = 0;
  }
  for (ShoppingItem item in broughItems) {
    String buyer = item.whoPaid;
    double currentTot = spendingMap[buyer] ?? 0;
    spendingMap[buyer] = currentTot + item.cost;
  }
}
