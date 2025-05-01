import 'package:flutter/material.dart';
import 'package:housemate_app/class/shoppingItem.dart';
import 'package:housemate_app/main.dart';

class shopping_list extends StatefulWidget {
  const shopping_list({super.key});

  @override
  State<shopping_list> createState() => _shopping_listState();
}

class _shopping_listState extends State<shopping_list> {
  // List<ShoppingItem> itemList =   []; //this currently resets constantly, needs database loading
  final quantity = TextEditingController();
  final itemName = TextEditingController();
  final cost = TextEditingController();

  void addItem() {
    if (itemValid()) {
      ShoppingItem item = ShoppingItem(itemName.text, int.parse(quantity.text));
      shoppingList.add(item);
      setState(() {});
    }
  }

  void removeItem(item) {
    shoppingList.remove(item);
    print(shoppingList);
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
                  Row(children: [
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

  void removeItemPopUp(context, item) {
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
                      onPressed: () {}, // To be added
                      icon: Icon(Icons.add),
                      label: Text("Log"))
                ])
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shopping List"),
        ),
        body: Column(children: [
          TextButton(onPressed: () {}, child: const Text("Spending page")),
          Flexible(
              child: ListView.builder(
                  itemCount: shoppingList.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                        title: Text(shoppingList[i].itemName),
                        subtitle: Text("Quantity: ${shoppingList[i].quanity}"),
                        trailing: Wrap(children: [
                          IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () {
                                removeItemPopUp(context, shoppingList[i]);
                              }),
                          IconButton(
                              icon: const Icon(Icons.delete_forever),
                              onPressed: () {
                                removeItem(shoppingList[i]);
                                //Navigator.pop(context);
                              }),
                        ]));
                  }))
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              addItemPopUp(context);
            },
            child: const Icon(Icons.add)));
  }
}
