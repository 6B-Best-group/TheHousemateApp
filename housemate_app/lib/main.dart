import 'package:flutter/material.dart';
import 'package:housemate_app/calender-page/calender.dart';
import 'package:housemate_app/group_chat.dart';
import 'package:housemate_app/class/action_log_notification.dart';
import 'package:housemate_app/class/general_chore_rota.dart';
import 'package:housemate_app/class/weekly_chore_rota.dart';
import 'package:housemate_app/class/house.dart';
import 'package:housemate_app/create_house.dart';
import 'package:housemate_app/edit_rotas.dart';
import 'package:housemate_app/rota.dart';
import 'package:housemate_app/sign-in%20pages/findHouse.dart';
import 'package:housemate_app/class/home.dart';
import 'package:housemate_app/class/profile.dart';
import 'package:housemate_app/sign-in%20pages/joinHouse.dart';
import 'package:housemate_app/shopping_list.dart';
import 'package:housemate_app/sign-in%20pages/sign_up.dart';
import 'package:housemate_app/user_profile.dart';
import 'package:housemate_app/utils/database/database.dart';
import 'package:housemate_app/utils/helpers.dart';
import 'package:housemate_app/utils/theme.dart';
import 'package:housemate_app/sign-in%20pages/log_in.dart';
import 'package:housemate_app/class/shoppingItem.dart';
import 'package:housemate_app/welcome.dart';
import 'package:housemate_app/action_log.dart';
import 'package:housemate_app/houseInfo.dart';
import 'package:housemate_app/settings.dart';

List<ActionLogNotification> actionsList = [];
List<WeeklyChoreRota> weeklyChoreRotaList = [WeeklyChoreRota('Bleach Toilet', ['Anna', 'Fish', 'Kieran', 'Dan', 'Matt'])];
//List<ShoppingItem> shoppingList = [];
List<ShoppingItem> broughItems = [];
List<String> housemates = []; //placeholder code
User currentUser = User();
House house = House();
bool login = true;
bool houseMember = true;
String screen = '/welcome';
final db = Database();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // currentUser.createUser(
  //     "John", "Doe", "J.Doe", "Doe@email.com", DateTime.now());
  // house.createHouse(
  //     "House", "Buckingham Palace", "London", "London", "London", " SW1A 1AA");
  if (login) {
    if (houseMember) {
      screen = '/';
    }
  }
  // Test comment.

  await Database().loadUsers();
  await Database().loadHouse();
  await Database().loadMessage();
  await Database().loadShoppingList();
  await Database().loadChore();
    


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        '/': (context) => const MyHomePage(title: 'Dweller'),
        '/shoppingList': (context) => const shopping_list(),
        '/userProfile': (context) => const UserProfile(),
        '/calenderPage': (context) => const CalenderPage(),
        '/groupChat': (context) => const GroupChatPage(),
        '/createHouse': (context) => const CreateHouse(),
        '/signUp': (context) => const sign_up(),
        '/login': (context) => const log_In(),
        '/welcome': (context) => const Welcome(),
        '/joinHouse': (context) => const joinHouse(),
        '/findHouse': (context) => const findHouse(),
        '/actionLog': (context) => const ActionLog(),
        '/rota': (context) => const Rota(),
        '/editRotas': (context) => const EditRotas(),
        '/houseInfo': (context) => const HouseInfoScreen(),
        '/settings': (context) => const Settings(),
      },
    );
  }
}
