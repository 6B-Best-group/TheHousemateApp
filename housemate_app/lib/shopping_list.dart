import 'package:flutter/material.dart';
import 'package:housemate_app/class/action_log_notification.dart';
import 'package:housemate_app/class/shoppingItem.dart';

import 'package:housemate_app/main.dart';
import 'package:housemate_app/utils/database/data-models.dart';
import 'package:housemate_app/utils/database/database.dart';

class shopping_list extends StatefulWidget {
  const shopping_list({super.key});

  @override
  State<shopping_list> createState() => _shopping_listState();
}

class _shopping_listState extends State<shopping_list> {
  late List<ShoppingList> currentshoppingList; //this currently resets constantly, needs database loading
  final quantity = TextEditingController();
  final itemName = TextEditingController();
  final cost = TextEditingController();

  void addItem() {
    if (itemValid()) {
      Database().shoppingList.add(ShoppingList(itemId: Database().shoppingList.length + 1, houseId: Database().users[Database().currentUser].houseId, itemName: itemName.text, itemQuantity: int.parse(quantity.text), itemPrice: 0.00, itemBrought: false, userId: Database().users[Database().currentUser].userId));
      //ShoppingItem item = ShoppingItem(itemName.text, int.parse(quantity.text));
      //shoppingList.add(item);
      ActionLogNotification logAction = ActionLogNotification('${currentUser.getFirstName()} ${currentUser.getLastName()} added to the Shopping List', '${quantity.text}x ${itemName.text}');
      actionsList.add(logAction);
      setState(() {});
    }
  }

  void removeItem(item) {
    Database().shoppingList.remove(item);
    //print(currentshoppingList);
    ActionLogNotification logAction = ActionLogNotification('${currentUser.getFirstName()} ${currentUser.getLastName()} removed an item from the shopping list', 'Discover new and inciting Minecraft creations (placeholder)');
    actionsList.add(logAction);
    setState(() {});
  }

  bool itemValid() {
    try {
      int.parse(quantity.text);
      return true;
    } catch (e) {
      return false;
    }
  }

  void addCost(ShoppingItem item) {
    try {
      item.cost = double.parse(cost.text);
      broughItems.add(item);
      removeItem(item);
    } catch (e) {
      print("invalid entry");
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
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                        Database().shoppingList[index].itemPrice = double.parse(cost.text);
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
    // TODO: implement initState
    super.initState();
    currentshoppingList = Database().shoppingList;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shopping List"),
        ),
        body: Column(children: [
          //TextButton(onPressed: () {}, child: const Text("Spending page")),
          Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: ListView.builder(
                    itemCount: currentshoppingList.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black,width: 1),
                            borderRadius: BorderRadius.circular(0),
                        
                          ),
                            title: Text(currentshoppingList[i].itemName),
                            subtitle: Text("Quantity: ${currentshoppingList[i].itemQuantity}"),
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
            child: const Icon(Icons.add)));
  }
}
