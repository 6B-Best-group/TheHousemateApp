import 'package:flutter/material.dart';
import 'package:housemate_app/calender-page/calender.dart';
import 'package:housemate_app/class/house.dart';
import 'package:housemate_app/create_house.dart';
import 'package:housemate_app/home.dart';
import 'package:housemate_app/class/profile.dart';
import 'package:housemate_app/shopping_list.dart';
import 'package:housemate_app/sign_up.dart';
import 'package:housemate_app/user_profile.dart';
import 'package:housemate_app/utils/theme.dart';
import 'package:housemate_app/log_in.dart';
import 'package:housemate_app/class/shoppingItem.dart';

List<ShoppingItem> shoppingList = [];
List<ShoppingItem> broughItems = [];
List<String> housemates = []; //placeholder code
User currentUser = User();
House house = House();

void main() {
  currentUser.createUser(
      "Jane", "Doe", "Jane.Doe", "jane@gmail", DateTime.now());
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
      initialRoute: '/createHouse',
      routes: {
        '/': (context) => const MyHomePage(title: 'Dweller'),
        '/shoppingList': (context) => const shopping_list(),
        '/userProfile': (context) => const UserProfile(),
        '/calenderPage': (context) => const CalenderPage(),
        '/createHouse': (context) => const CreateHouse(),
        '/signUp': (context) => const sign_up(),
      },
    );
  }
}
