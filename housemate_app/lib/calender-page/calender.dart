import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:housemate_app/class/action_log_notification.dart';
import 'package:housemate_app/main.dart';
import 'package:housemate_app/utils/calender_utils.dart';
import 'package:housemate_app/calender-page/widgets/add_chore.dart';
import 'package:housemate_app/calender-page/widgets/chore_widgets/other_chore/other_chore_lists.dart';
import 'package:housemate_app/calender-page/widgets/chore_widgets/user_chore_tile.dart';
import 'package:housemate_app/calender-page//widgets/heat_map_calender.dart';
import 'package:flutter/material.dart';
import 'package:housemate_app/utils/database/database.dart';
import 'package:housemate_app/utils/helpers.dart';
import 'package:housemate_app/utils/database/data-models.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderHomePageState();
}

class _CalenderHomePageState extends State<CalenderPage>
    with TickerProviderStateMixin {

  late EventList<Event> heatMapDataset ;

  late Map<DateTime, List<Chore>> allUserDateChores;

  late Map<DateTime, List<Chore>> userDateChores;

  late Map<DateTime, Map<int, List<Chore>>> otherUserDateChores ;

  String selectedDate = "";

  DateTime currentDate = DateTime.now();

  DateTime targetDate = DateTime.now();
  String currentMonth = convertToMonthYear(DateTime.now());

  TextEditingController newChoreName = TextEditingController();

  bool showSideBar = false;

  
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
    if (userDateChores.containsKey(currentDate) && // checks the data then saves it to the database, it also adds the actions to the action log
        newChoreName.text.isNotEmpty) {
          ActionLogNotification logAction = ActionLogNotification('${currentUser.getFirstName()} ${currentUser.getLastName()} added a Chore', newChoreName.text);
          actionsList.add(logAction);
          heatMapDataset.add(currentDate,markedDateEvent(currentDate, (userDateChores[currentDate]!.length + 1)));
          setState(() {
            Database().chore.add(Chore(choreId: Database().chore.length+1, userId: Database().users[Database().currentUser].userId, choreName: newChoreName.text, choreDescription: newChoreName.text, dueDate: currentDate, assignedDate: DateTime.now(), completed: false));
            userDateChores = sortingUserChoreDates(sortingChoreDates(Database().chore));
          });
    } else if (newChoreName.text.isNotEmpty) {
      ActionLogNotification logAction = ActionLogNotification('${currentUser.getFirstName()} ${currentUser.getLastName()} added a Chore', newChoreName.text);
      actionsList.add(logAction);
      setState(() {
        Database().chore.add(Chore(choreId: Database().chore.length+1, userId: Database().users[Database().currentUser].userId, choreName: newChoreName.text, choreDescription: newChoreName.text, dueDate: currentDate, assignedDate: DateTime.now(), completed: false));
        userDateChores = sortingUserChoreDates(sortingChoreDates(Database().chore));
      });
    }

    newChoreName.clear();
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // these load all of the user data and formats it for easier use
    allUserDateChores =  sortingChoreDates(Database().chore);
    userDateChores = sortingUserChoreDates(sortingChoreDates(Database().chore));
    otherUserDateChores = choresByDateAndUser(sortingChoreDates(Database().chore)); 
    heatMapDataset = markedChoreDays(addingToHeatMap(sortingChoreDates(Database().chore)));
    
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
        children: [
          // ---------- THE CALENDAR
          Expanded(
            flex: 7,
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: 
                  AspectRatio(
                    aspectRatio: 1,
                    child: 
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: MyHeatMap( // ---- the Calendar widget
                        currentDate: currentDate, 
                        heatMapDataset: heatMapDataset,
                        calenderSelected: pressedCalender, 
                        targetDate: targetDate, 
                        currentMonth: currentMonth, 
                        calendarChange: calenarChange, 
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
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
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
                                  ) // -- user chores
                                  ? UserChoreTile(
                                    userChores: userDateChores[currentDate]!,
                                    
                                  ) // -----
                                  : const UserChoreTile(userChores: []),
                        ),
                      ),
                      const Divider(color: Colors.black),
                      Expanded(
                        flex: 5,
                        child: Container(
                          child:
                              otherUserDateChores.containsKey(
                                    currentDate,
                                  ) // the other housemates chores
                                  ? ListView.builder(
                                    itemCount:
                                        otherUserDateChores[currentDate]!
                                            .length,
                                    itemBuilder: (
                                      BuildContext context,
                                      int index,
                                    ) {
                                      // seperates the other users into their seperate chores
                                      final otherUsers = otherUserDateChores[currentDate]!;

                                      final otherUserChores = otherUsers.keys.elementAt(index);

                                      User currentSelectedUser = findUser(otherUserChores);
                                      
                                      return OtherChoreLists(
                                        userName: currentSelectedUser.firstName,
                                        userChores:  otherUsers[otherUserChores]!,
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


  // -- changing the calendar
  void calenarChange(DateTime time) {
    setState(() {
      targetDate = time;
      currentMonth = convertToMonthYear(targetDate);
    });
  } 

  // -- changing what happens when a day is pressed on the calendar
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

  // -- for adding dots to the calendar
  EventList<Event> markedChoreDays (Map<DateTime,int> choresOnDay){
    return EventList<Event>(
      events: {
        for (var i in choresOnDay.entries) i.key: [
          markedDateEvent(i.key, i.value)
        ]
      }
      );
  }

  Event markedDateEvent (DateTime key, int amount) =>  Event(date: key,icon: markedDayIcon(amount),dot: Container(),);

  Widget markedDayIcon (int count){
    Color color;
    if (count*10 <= 255){
      color = Color.fromARGB(255, 255, 255 - count*10, 0);
    } else {
      color = Colors.red;
    }

    return Container(
      padding: EdgeInsets.all(6),
      color: color,
      child: SizedBox.expand(),
    );

  }
}

