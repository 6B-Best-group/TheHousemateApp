import 'package:flutter/material.dart';
import 'package:housemate_app/calender-page/calender.dart';
import 'package:housemate_app/home.dart';
import 'package:housemate_app/profile.dart';
import 'package:housemate_app/shopping_list.dart';
import 'package:housemate_app/spending.dart';
import 'package:housemate_app/user_profile.dart';
import 'package:housemate_app/utils/theme.dart';
import 'package:housemate_app/log_in.dart';
import 'package:housemate_app/class/shoppingItem.dart';

List<ShoppingItem> shoppingList = [];
List<ShoppingItem> broughItems = [];
List<User> housemates = []; //placeholder code
Map<String, double> spendingMap = {};

void main() {
  // Test comment.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint('Building MyApp....');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dweller',
      theme: defaultTheme,
      //home: const MyHomePage(title: 'Housemate App'),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Housemate App'),
        '/shoppingList': (context) => const shopping_list(),
        '/userProfile': (context) => const UserProfile(),
        '/calenderPage': (context) => const CalenderPage(),
        '/spendingPage': (context) => const spendingPage(),
      },
    );
  }
}
