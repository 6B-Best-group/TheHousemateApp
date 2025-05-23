import 'package:flutter/material.dart';
import 'package:housemate_app/class/action_log_notification.dart';
import 'package:housemate_app/class/shoppingItem.dart';
import 'package:housemate_app/inputCheck.dart';

import 'package:housemate_app/main.dart';
import 'package:housemate_app/utils/database/data-models.dart';
import 'package:housemate_app/utils/database/database.dart';

class shopping_list extends StatefulWidget {
  const shopping_list({super.key});

  @override
  State<shopping_list> createState() => _shopping_listState();
}

class _shopping_listState extends State<shopping_list> {
  late List<ShoppingList> currentshoppingList;
  final quantity = TextEditingController();
  final itemName = TextEditingController();
  final cost = TextEditingController();
  late User currentUser;
  //adds item to the shopping list
  void addItem() {
    DataChecks check = DataChecks();
    if (check.addShoppingItem(quantity.text, itemName.text)) {
      Database().shoppingList.add(ShoppingList(
          itemId: Database().shoppingList.length + 1,
          houseId: Database().users[Database().currentUser].houseId,
          itemName: itemName.text,
          itemQuantity: int.parse(quantity.text),
          itemPrice: 0.00,
          itemBrought: false,
          userId: Database().users[Database().currentUser].userId));
      ActionLogNotification logAction = ActionLogNotification(
          '${currentUser.firstName} ${currentUser.lastName} added to the Shopping List',
          '${quantity.text}x ${itemName.text}');
      actionsList.add(logAction);
      setState(() {});
    }
  }

  //Parameter: shopping list item
  //removes item from list
  void removeItem(item) {
    Database().shoppingList.remove(item);
    ActionLogNotification logAction = ActionLogNotification(
        '${currentUser.firstName} ${currentUser.lastName} removed an item from the shopping list',
        '');
    actionsList.add(logAction);
    setState(() {});
  }

  //add costs to the user and list
  void addCost(ShoppingItem item) {
    DataChecks check = DataChecks();
    if (check.addShoppingItemCost(cost.text)) {
      try {
        item.cost = double.parse(cost.text);
        broughItems.add(item);
        removeItem(item);
        item.setPaid(currentUser.username, double.parse(cost.text));
        print(broughItems);
        currentUser.spending = currentUser.spending + double.parse(cost.text);
        print(currentUser.spending);
      } catch (e) {
        print("invalid entry");
      }
    }
  }

  //Pop up menu to add an item
  void addItemPopUp(context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                icon: const Icon(Icons.shopping_cart),
                title: const Text("Add an item to the list"),
                content: Wrap(
                  children: [
                    TextField(
                        controller: itemName,
                        maxLength: 90, //placeholder limit
                        decoration: const InputDecoration(
                          label: Text("Item name:"),
                        )),
                    TextField(
                        controller: quantity,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text("Quanity:"),
                        )),
                  ],
                ),
                actions: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton.icon(
                            onPressed: () {
                              itemName.clear();
                              quantity.clear();
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.delete),
                            label: const Text("discard")),
                        TextButton.icon(
                            onPressed: () {
                              addItem();
                              Navigator.pop(context);
                            }, // To be added
                            icon: Icon(Icons.save),
                            label: Text("Add to list"))
                      ]),
                ]));
  }

  void removeItemPopUp(context, int index) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              icon: Icon(Icons.money),
              title: const Text("Cost log"),
              content: Wrap(
                children: [
                  TextField(
                      controller: cost,
                      maxLength: 90, //placeholder limit
                      decoration: const InputDecoration(
                        label: Text("Item cost:"),
                      )),
                ],
              ),
              actions: [
                Row(children: [
                  TextButton.icon(
                      onPressed: () {
                        quantity.clear();
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text("discard")),
                  TextButton.icon(
                      onPressed: () {
                        Database().shoppingList[index].itemPrice =
                            double.parse(cost.text);
                        quantity.clear();
                        Navigator.pop(context);
                      }, // To be added
                      icon: Icon(Icons.add),
                      label: Text("Log"))
                ])
              ],
            ));
  }

  @override
  void initState() {
    super.initState();
    currentshoppingList = Database().shoppingList;
    currentUser = Database().users[Database().currentUser];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shopping List"),
        ),
        body: Column(children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/spending');
              },
              child: const Text("Spending page")),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ListView.builder(
                itemCount: currentshoppingList.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        title: Text(currentshoppingList[i].itemName),
                        subtitle: Text(
                            "Quantity: ${currentshoppingList[i].itemQuantity}"),
                        trailing: Wrap(children: [
                          IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () {
                                removeItemPopUp(context, i);
                              }),
                          IconButton(
                              icon: const Icon(Icons.delete_forever),
                              onPressed: () {
                                removeItem(currentshoppingList[i]);
                                //Navigator.pop(context);
                              }),
                        ])),
                  );
                }),
          ))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addItemPopUp(context);
          },
          hoverColor: Colors.cyan,
          child: const Icon(Icons.add),
        ));
  }
}
