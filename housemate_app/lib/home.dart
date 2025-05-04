import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<List<String>> pages = [
    ["Calender", '/calenderPage'],
    ["Shopping List",'/shoppingList'],
    ["Group Chat",' '],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Dweller Home Page"),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  border: Border(bottom: const BorderSide(color: Colors.black,width: 1))
                
                ),
                padding: const EdgeInsets.all(8),
                height: 90,
                child: Row(
                children: [
                  IconButton( // profile button
                    onPressed: (){
                      Navigator.pushNamed(context, '/userProfile');
                    }, 
                    icon: const Icon(Icons.person),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black,width: 1),
                      shape: const CircleBorder(),
                      
                    ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  Text(
                    'Garry Giggles',
                    style: Theme.of(context).textTheme.displayLarge,
                  )
                ],
              ),),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: const Icon(Icons.house_outlined),
                          title:  const Text('House Info'),
                          onTap: (){},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: const Icon(Icons.hourglass_bottom),
                          title:  const Text('Action Log'),
                          onTap: (){},
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
                  border: Border(top: const BorderSide(color: Colors.black,width: 1))
                
                ),
                padding: const EdgeInsets.all(8),
                height: 60,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton( // settings button
                    onPressed: (){}, 
                    icon: const Icon(Icons.settings),
                    
                    ),
                    IconButton(
                    onPressed: (){
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

        body: Center(
            child: SizedBox.square(
                dimension: MediaQuery.of(context).size.height,
                child: Container(
                  //width: 100,
                  padding: const EdgeInsets.only(top: 60,bottom: 40,left: 20,right: 20),
                  //color: Colors.blue,
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
                        child: 
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              pages[index][0],
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontSize: 18,
                            
                              ),
                                                    ),
                          ),),
                      );
                          
                      
                            
                    }
                    ),
                ),
              
                ),
                  ));
  }
}
