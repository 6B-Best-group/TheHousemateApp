import 'package:flutter/material.dart';
import 'package:housemate_app/home.dart';
import 'package:housemate_app/shopping_list.dart';
import 'package:housemate_app/user_profile.dart';

void main() {
  // Test comment.
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
      // home: const MyHomePage(title: 'Housemate App'),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Housemate App'),
        '/shoppingList': (context) => const shopping_list(),
        '/userProfile': (context) => const UserProfile(),
      },
    );
  }
}
