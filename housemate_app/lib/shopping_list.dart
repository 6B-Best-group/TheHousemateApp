import 'package:flutter/material.dart';

class shopping_list extends StatefulWidget {
  const shopping_list({super.key});

  @override
  State<shopping_list> createState() => _shopping_listState();
}

class _shopping_listState extends State<shopping_list> {
  //buttons used on the pop up menu
  Widget actionButtons(button2Title, button2Function, button2Icon) {
    return Row(children: [
      TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.delete),
          label: const Text("discard")),
      TextButton.icon(
          onPressed: () {}, // To be added
          icon: Icon(button2Icon),
          label: Text(button2Title))
    ]);
  }

  //Pop up menu to add an item
  void addItemPopUp(context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            icon: const Icon(Icons.shopping_cart),
            title: const Text("Add an item to the list"),
            content: const Wrap(
              children: [
                TextField(
                    maxLength: 90, //placeholder limit
                    decoration: InputDecoration(
                      label: Text("Item name:"),
                    )),
                TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Quanity:"),
                    )),
              ],
            ),
            actions: [actionButtons("Save", (), Icons.save)]));
  }

  void removeItemPopUp(context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            icon: const Icon(Icons.money),
            title: const Text("Cost log"),
            content: const Wrap(
              children: [
                TextField(
                    maxLength: 90, //placeholder limit
                    decoration: InputDecoration(
                      label: Text("Item cost:"),
                    )),
              ],
            ),
            actions: [actionButtons("Add item", (), Icons.add)]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
                title: const Text("Dish soap"), //Add database stuff
                subtitle: const Text("Quantity: 3"), //Add database stuff
                trailing: Wrap(children: [
                  IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        removeItemPopUp(context);
                      }),
                  IconButton(
                      icon: const Icon(Icons.delete_forever), onPressed: () {}),
                ]));
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addItemPopUp(context);
          },
          child: const Icon(Icons.add)),
    );
  }
}
