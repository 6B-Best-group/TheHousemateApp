import 'package:housemate_app/utils/calender_utils.dart';
import 'package:housemate_app/calender-page/widgets/add_chore.dart';
import 'package:housemate_app/calender-page/widgets/chore_widgets/other_chore/other_chore_lists.dart';
import 'package:housemate_app/calender-page/widgets/chore_widgets/user_chore_tile.dart';
import 'package:housemate_app/calender-page//widgets/heat_map_calender.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_calendar_carousel/classes/event.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderHomePageState();
}

class _CalenderHomePageState extends State<CalenderPage>
    with TickerProviderStateMixin {
  /*
  TO DO:
  - when the database is make, merge the map data into one map

  - have the ability to tick off chores in the database
  - make it so the text is lined out

  - make the calenders month changing buttons rectangular

  - other list view builder varying in size
  - make the check box work
  - change my calender over to the carousel

  - make this so the date title isnt restricted my screen size
  - check if the same chore is already added
  - fix overflow issue for user chores
  
  */

  Map<DateTime, int> heatMapDataset = {
    DateTime(2025, 04, 4): 1,
    DateTime(2025, 04, 7): 1,
    DateTime(2025, 04, 12): 1,
    DateTime(2025, 04, 2): 1,
    DateTime(2025, 04, 1): 1,
  };

  Map<DateTime, List<Chore>> userDateChores = {
    // map for the users chores ,i could merge the two maps
    DateTime(2025, 04, 4): [
      Chore(choreTitle: "Clean the fridge"),
      Chore(choreTitle: "Clean floor"),
      Chore(choreTitle: "Wash Dishes"),
    ],
    DateTime(2025, 04, 7): [
      Chore(choreTitle: "Mop the floor"),
      Chore(choreTitle: "take out bins"),
    ],
    DateTime(2025, 04, 12): [Chore(choreTitle: "Clean Surfaces")],
  };

  Map<DateTime, List<dynamic>> otherUserDateChores = {
    // map for the users chores , this will 100% get changed later, its just for testing at the moment
    DateTime(2025, 04, 4): [
      // users map
      [
        "Iris",
        [
          // user
          Chore(choreTitle: "buy soap"),
          Chore(choreTitle: "clean bathroom"),
        ],
      ],
      [
        "Dave",
        [
          // user
          Chore(choreTitle: "cook"),
        ],
      ],
      [
        "Nathan",
        [
          // user
          Chore(choreTitle: "hoover"),
          Chore(choreTitle: "make a list of needed things"),
          Chore(choreTitle: "churn out some cheese"),
        ],
      ],
    ],
    DateTime(2025, 04, 7): [
      [
        "Charlie",
        [
          // user
          Chore(choreTitle: "cook"),
          Chore(choreTitle: "Clean the Garden"),
        ],
      ],
    ],
    DateTime(2025, 04, 22): [
      [
        "Charlie",
        [
          // user
          Chore(choreTitle: "cook"),
          Chore(choreTitle: "Clean the Garden"),
        ],
      ],
    ],

    DateTime(2025, 04, 15): [
      // users map
      [
        "Iris",
        [
          // user
          Chore(choreTitle: "buy soap"),
          Chore(choreTitle: "clean bathroom"),
        ],
      ],
      [
        "Dave",
        [
          // user
          Chore(choreTitle: "cook"),
          Chore(choreTitle: "clean bathroom 2"),
        ],
      ],
      [
        "Charlie",
        [
          // user
          Chore(choreTitle: "wash up"),
          Chore(choreTitle: "Clean the Garden"),
        ],
      ],
      [
        "Nathan",
        [
          // user
          Chore(choreTitle: "hoover"),
          Chore(choreTitle: "make a list of needed things"),
          Chore(choreTitle: "churn out some cheese"),
          Chore(choreTitle: "do the bins"),
        ],
      ],
    ],
  };

  String selectedDate = "";

  DateTime currentDate = DateTime.now();

  DateTime targetDate = DateTime.now();
  String currentMonth = convertToMonthYear(DateTime.now());

  TextEditingController newChoreName = TextEditingController();

  bool showSideBar = false;

  // -- dateTime picker

  // Future<void> selectDate() async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime(2021, 7, 25),
  //     firstDate: DateTime(2021),
  //     lastDate: DateTime(2022),
  //   );

  //   setState(() {
  //     newChoreDatetime = pickedDate!;
  //   });
  // }

  // -- adding chore widget --

  void addNewChore() {
    showDialog(
      context: context,
      builder: (context) {
        return AddChoreWidget(
          newChoreText: newChoreName,
          selectedDate: currentDate,
          onSave: saveNewChore,
          onCancel: () {
            newChoreName.clear();
            Navigator.of(context).pop();
          }, //cancelNewChore,
        );
      },
    );
  }

  // -- Saving New Chore --

  void saveNewChore() {
    if (!heatMapDataset.containsKey(currentDate) &&
        newChoreName.text.isNotEmpty) {
      setState(() {
        heatMapDataset[currentDate] = 1;
      });
    }

    if (userDateChores.containsKey(currentDate) &&
        newChoreName.text.isNotEmpty) {
      setState(() {
        userDateChores[currentDate]?.add(Chore(choreTitle: newChoreName.text));
      });
    } else if (newChoreName.text.isNotEmpty) {
      setState(() {
        userDateChores[currentDate] = [Chore(choreTitle: newChoreName.text)];
      });
    }

    newChoreName.clear();
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: const Text('C A L E N D A R'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Container(color: Colors.orange, width: 250, height: double.maxFinite,),

          // THE CALENDER
          Expanded(
            // the calender
            flex: 7, //flex: 6, -- this for when the side bar is added
            child: Container(
              //color: Colors.purple,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: 
                  AspectRatio(
                    aspectRatio: 1,
                    child: 
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: MyHeatMap(
                        currentDate: currentDate, //DateTime(
                        //DateTime.now().year, // year
                        //DateTime.april, // month // day
                        //),
                        
                      
                        heatMapDataset: heatMapDataset,
                        calenderSelected: pressedCalender, 
                        targetDate: targetDate, 
                        currentMonth: currentMonth, 
                        calendarChange: calenderChange, 
                        
                        
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // the SIDE BAR
          showSideBar
              ? Expanded(
                flex: 2,

                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Row(
                          // the Date at the top
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(color: Colors.grey, width: 20),
                            Padding(
                              // ------
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                // the title text
                                selectedDate,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child:
                              userDateChores.containsKey(
                                    currentDate,
                                  ) // set a minimum size for this // user chores
                                  ? UserChoreTile(
                                    userChores: userDateChores[currentDate]!,
                                  ) // -----
                                  : const UserChoreTile(userChores: []),
                        ),
                      ),
                      const Divider(color: Colors.black),

                      // otherUserDateChores.containsKey(currentDate) // set a minimum size for this
                      //       ? OtherChoreLists(userName:otherUserDateChores[currentDate]![0][0] ,  userChores: otherUserDateChores[currentDate]![0][1])
                      //       : OtherChoreLists(userName: "", userChores: [ ]),
                      // other users lists, display nothing if there are no users
                      Expanded(
                        flex: 5,
                        child: Container(
                          child:
                              otherUserDateChores.containsKey(
                                    currentDate,
                                  ) // set a minimum size for this // other user chores
                                  ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        otherUserDateChores[currentDate]!
                                            .length,
                                    itemBuilder: (
                                      BuildContext context,
                                      int index,
                                    ) {
                                      List currentUser =
                                          otherUserDateChores[currentDate]?[index]!;
                                      return OtherChoreLists(
                                        userName: currentUser[0],
                                        userChores: currentUser[1],
                                      );
                                    },
                                  )
                                  : Container(),
                        ),
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                                // ------------------------------- make a rectangle
                                onPressed: addNewChore,
                                icon: const Icon(Icons.add, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              : Container(),
        ],
      ),
    );
  }

  // -- changing the calender

  void calenderChange(DateTime time) {
    setState(() {
      targetDate = time;
      currentMonth = convertToMonthYear(targetDate);
    });
  } 

  // -- changing what happens when a day is pressed on the calender

  void pressedCalender(DateTime time) {
    // condense this section
    String textDate =
        "${convertDatetimeToWeekday(time)} ${time.day}${convertDayToTh(time.day)} ${convertDatetimeToMonth(time)}";
    DateTime newTime = currentDate;
    bool sideBar = showSideBar;

    if (time.isAtSameMomentAs(currentDate) && sideBar == true) {
      // if they are not the same
      sideBar = false;
      print("test 1");
    } else {
      newTime = time;
      sideBar = true;
    }

    setState(() {
      showSideBar =
          sideBar; //!time.isAtSameMomentAs(currentDate); // double tapping the same date closes the tab
      currentDate = newTime;
      selectedDate = textDate;
      //showSideBar = !showSideBar;
      //heatMapDataset.containsKey(time)? showSideBar = true : showSideBar = false;
      //showSideBar = heatMapDataset.containsKey(time);
    });
  }

  // String convertDatetimeToWeekday(DateTime time) {
  //   // add this to a functions list
  //   int weekday = time.weekday;

  //   switch (weekday) {
  //     case 1:
  //       return "Monday";
  //     case 2:
  //       return "Tuesday";
  //     case 3:
  //       return "Wednesday";
  //     case 4:
  //       return "Thursday";
  //     case 5:
  //       return "Friday";
  //     case 6:
  //       return "Saturday";
  //     case 7:
  //       return "Sunday";
  //     default:
  //       return "Error, Try again";
  //   }
  // }

  // String convertDatetimeToMonth(DateTime time) {
  //   // add this to a functions list
  //   int month = time.month;

  //   switch (month) {
  //     case 1:
  //       return "Jan";
  //     case 2:
  //       return "Feb";
  //     case 3:
  //       return "Mar";
  //     case 4:
  //       return "Apr";
  //     case 5:
  //       return "May";
  //     case 6:
  //       return "Jun";
  //     case 7:
  //       return "Jul";
  //     case 8:
  //       return "Aug";
  //     case 9:
  //       return "Sep";
  //     case 10:
  //       return "Oct";
  //     case 11:
  //       return "Nov";
  //     case 12:
  //       return "Dec";
  //     default:
  //       return "Error, Try again";
  //   }
  // }

  // String convertDayToTh(int day) {
  //   switch (day) {
  //     case 1:
  //       return "st";
  //     case 2:
  //       return "nd";
  //     case 3:
  //       return "rd";
  //     default:
  //       return "th";
  //   }
  // }
}
