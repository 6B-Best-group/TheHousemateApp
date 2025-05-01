import 'package:flutter/material.dart';
import 'package:housemate_app/log_in.dart';
import 'package:housemate_app/class/shoppingItem.dart';
import 'package:housemate_app/shopping_list.dart';

List<ShoppingItem> shoppingList = [];
List<ShoppingItem> broughItems = [];
List<String> housemates = []; //placeholder code

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dweller',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const shopping_list(),
    );
  }
}
