import 'package:flutter/material.dart';
import 'package:housemate_app/shopping_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Dwwlr Home Page"),
        ),
        body: Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(alignment: Alignment.topLeft, children: [
                  Align(
                      alignment: const Alignment(-0.4, -0.6),
                      child: ElevatedButton(
                          onPressed: null, child: Text("House Info"))),
                  Align(
                      alignment: const Alignment(0.4, -0.6),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/userProfile');
                          },
                          child: Text("Profile"))),
                  Align(
                      alignment: const Alignment(0.4, -0.2),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/shoppingList');
                          },
                          child: Text("Shopping List"))),
                  Align(
                      alignment: const Alignment(-0.4, -0.2),
                      child: ElevatedButton(
                          onPressed: null, child: Text("Calender"))),
                  Align(
                      alignment: const Alignment(0.4, 0.2),
                      child: ElevatedButton(
                          onPressed: null, child: Text("Chore List"))),
                  Align(
                      alignment: const Alignment(-0.4, 0.2),
                      child: ElevatedButton(
                          onPressed: null, child: Text("Group Chat"))),
                  Align(
                      alignment: const Alignment(-0.4, 0.6),
                      child: ElevatedButton(
                          onPressed: null, child: Text("Action Log"))),
                ]))));
  }
}
