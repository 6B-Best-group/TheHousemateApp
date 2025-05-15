import 'package:flutter/material.dart';
import 'package:housemate_app/binRota.dart';
import 'package:housemate_app/calender-page/calender.dart';
import 'package:housemate_app/class/bins.dart';
import 'package:housemate_app/group_chat.dart';
import 'package:housemate_app/class/action_log_notification.dart';
import 'package:housemate_app/class/house.dart';
import 'package:housemate_app/create_house.dart';
import 'package:housemate_app/rota.dart';
import 'package:housemate_app/sign-in%20pages/findHouse.dart';
import 'package:housemate_app/class/home.dart';
// import 'package:housemate_app/class/profile.dart';
import 'package:housemate_app/sign-in%20pages/joinHouse.dart';
import 'package:housemate_app/shopping_list.dart';
import 'package:housemate_app/sign-in%20pages/sign_up.dart';
import 'package:housemate_app/spending.dart';
import 'package:housemate_app/user_profile.dart';
import 'package:housemate_app/utils/database/data-models.dart';
import 'package:housemate_app/utils/database/database.dart';
import 'package:housemate_app/utils/theme.dart';
import 'package:housemate_app/sign-in%20pages/log_in.dart';
import 'package:housemate_app/class/shoppingItem.dart';
import 'package:housemate_app/welcome.dart';
import 'package:housemate_app/action_log.dart';
import 'package:housemate_app/settings.dart';

List<ActionLogNotification> actionsList = [];
List<ShoppingItem> broughItems = [];
Map<String, double> spendingMap = {};
Bins bin = Bins();
bool login = true;
bool houseMember = true;
String screen = '/welcome';
final db = Database();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  if (login) {
    if (houseMember) {
      screen = '/';
    }
  }

  // loads the database on initialization of the app

  await db.loadHouse();
  await db.loadUsers();
  await db.loadMessage();
  await db.loadShoppingList();
  await db.loadChore();
    


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
      initialRoute: '/',
      routes: {    // -- navigates the various different pages there are
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
        '/binRota': (context) => const binRota(),
        '/settings': (context) => const Settings(),
        '/spending': (context) => const spendingPage(),
      },
    );
  }
}
