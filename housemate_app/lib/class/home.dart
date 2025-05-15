import 'package:flutter/material.dart';
import 'package:housemate_app/class/general_chore_rota.dart';
import 'package:housemate_app/utils/database/data-models.dart';
import 'package:housemate_app/utils/database/database.dart';
import 'package:housemate_app/utils/helpers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<String>> pages = [
    ["Shopping List", '/shoppingList'],
    ["Rotas", '/rota'],
    ["Group Chat", '/groupChat'],
  ];

  late final User currentUser;

  @override
  void initState() {
    // TODO: implement initState
    
    currentUser = Database().users[0];
    Database().generalChoreRotaList.addAll(
      [GeneralChoreRota("Take out the food bin", nextAssigned(3,Database().users[Database().currentUser], Database().users),Database().users[0]), 
        GeneralChoreRota("Clean Oven Grease", nextAssigned(2,Database().users[Database().currentUser], Database().users),Database().users[1] ), 
        GeneralChoreRota("Wipe down hob", nextAssigned(1,Database().users[Database().currentUser], Database().users),Database().users[3])
      ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("HOME PAGE"),
        ),
        drawer: Drawer(
          child: Container(
            decoration: const BoxDecoration(
                border:
                    Border(right: BorderSide(color: Colors.black, width: 1))),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      border: Border(
                          bottom:
                              const BorderSide(color: Colors.black, width: 1))),
                  padding: const EdgeInsets.all(8),
                  height: 90,
                  child: Row(
                    children: [
                      IconButton(
                        // profile button
                        onPressed: () {
                          Navigator.pushNamed(context, '/userProfile');
                        },
                        icon: const Icon(Icons.person),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black, width: 1),
                          shape: const CircleBorder(),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${currentUser.firstName} ${currentUser.lastName}" ,
                        style: Theme.of(context).textTheme.displayLarge,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: const Icon(Icons.hourglass_bottom),
                          title: const Text('Action Log'),
                          onTap: () {
                            Navigator.pushNamed(context, '/actionLog');
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: const Icon(Icons.delete),
                          title: const Text('Bin Day'),
                          onTap: () {
                            Navigator.pushNamed(context, '/binRota');
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                //  DRAWER -    B O T T O M    B A R
                // ---------------------------------------------------------------------------

                Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      border: Border(
                          top:
                              const BorderSide(color: Colors.black, width: 1))),
                  padding: const EdgeInsets.all(8),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        // settings button
                        onPressed: () {Navigator.pushNamed(context, '/settings'); },
                        icon: const Icon(Icons.settings),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: Center(
          child: SizedBox.square(
            dimension: MediaQuery.of(context).size.height,
            child: Container(
              //width: 100,
              padding: const EdgeInsets.only(
                  top: 60, bottom: 40, left: 60, right: 60),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: const Border(
                  left: BorderSide(color: Colors.black, width: 1),
                  right: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/calenderPage');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Center(
                          child: Text("Calendar",
                              style: Theme.of(context).textTheme.displayLarge
                              //   //color: Colors.white,
                              // ),
                              ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Flexible(
                    flex: 5,
                    child: ListView.builder(
                        itemCount: pages.length,
                        shrinkWrap: true,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, pages[index][1]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  pages[index][0],
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
