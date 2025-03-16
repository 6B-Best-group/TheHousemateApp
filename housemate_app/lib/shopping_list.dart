import 'package:flutter/material.dart';

class shopping_list extends StatefulWidget {
  const shopping_list({super.key});

  @override
  State<shopping_list> createState() => _shopping_listState();
}

class _shopping_listState extends State<shopping_list> {
  //Pop up menu to add an item
  void addItemPopUp(context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
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
                actions: [
                  TextButton.icon(
                      onPressed: () {}, //To be added
                      icon: Icon(Icons.delete),
                      label: Text("discard")),
                  TextButton.icon(
                      onPressed: () {}, // To be added
                      icon: Icon(Icons.save),
                      label: Text("save"))
                ]));
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
              title: Text("Dish soap"), //Add database stuff
              subtitle: Text("Quantity: 3"), //Add database stuff
              trailing:
                  IconButton(icon: const Icon(Icons.check), onPressed: () {}),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addItemPopUp(context);
          },
          child: const Icon(Icons.add)),
    );
  }
}
