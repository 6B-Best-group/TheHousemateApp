import 'package:flutter/material.dart';
import 'package:housemate_app/class/general_chore_rota.dart';
import 'package:housemate_app/main.dart';

class EditRotas extends StatefulWidget {
  const EditRotas({super.key});

  @override
  State<EditRotas> createState() => _EditRotasState();
}

class _EditRotasState extends State<EditRotas> {
  final generalChoreName = TextEditingController();

  void addChore() {
    GeneralChoreRota rota = GeneralChoreRota(generalChoreName.text, ["test from here"]);
    generalChoreRotaList.add(rota);
    setState(() {});
  }

  void addChoreDialog(context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                icon: const Icon(Icons.local_laundry_service_sharp),
                title: const Text("New General Chore Rota"),
                content: Wrap(
                  children: [
                    TextField(
                      controller: generalChoreName,
                        maxLength: 30,
                        decoration: const InputDecoration(
                          label: Text("Chore name:"),
                        )),
                    const TextField( // To be changed
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text("Quanity:"),
                        )),
                  ],
                ),
                actions: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text("discard")),
                    TextButton.icon(
                        onPressed: () {
                          addChore();
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.save),
                        label: const Text("Add to list"))
                  ]),
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Your Rotas"),
      ),
      body: const Text("text"),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addChoreDialog(context);
        },
        label: const Text("Create New Rota"),
        icon: const Icon(Icons.add),
        ),
    );
  }
}