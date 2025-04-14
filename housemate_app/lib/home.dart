import 'dart:math';

import 'package:flutter/material.dart';

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
          title: const Text("Dweller Home Page"),
        ),
        body: Center(
            child: SizedBox.square(
                dimension: MediaQuery.of(context).size.height,
                child:GridView.count(
                   //Stack(alignment: Alignment.topLeft, children: [
                   crossAxisCount: 2,
                   mainAxisSpacing: 40,
                   crossAxisSpacing: 30,
                   childAspectRatio: 4/1,
                   children: [
                  ElevatedButton(
                      onPressed: null, child: Text("House Info")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/userProfile');
                      },
                      child: const Text("Profile")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/shoppingList');
                      },
                      child: const Text("Shopping List")),

                          // CALENDER
                  ElevatedButton( 
                      onPressed: (){
                        Navigator.pushNamed(context, '/calenderPage');
                      }, 
                      child: Text("Calender")),
                  ElevatedButton(
                      onPressed: null, child: Text("Chore List")),
                  ElevatedButton(
                      onPressed: null, child: Text("Group Chat")),
                  ElevatedButton(
                      onPressed: null, child: Text("Action Log")),
                ]))));
  }
}
