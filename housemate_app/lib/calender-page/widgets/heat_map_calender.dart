import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
//import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
//import 'package:google_fonts/google_fonts.dart';

class MyHeatMap extends StatelessWidget {
  final DateTime currentDate;
  final DateTime targetDate;
  final String currentMonth;
  // final   List<MarkedDate> markedDate = [
  //     MarkedDate(color: Colors.cyan, date: DateTime(2025, 4, 20)),
  //     MarkedDate(color: Colors.cyan, date: DateTime(2025, 20, 20)),
  //   ];

  final EventList<Event> heatMapDataset;
  final Function(DateTime)? calenderSelected;
  final Function(DateTime)? calendarChange;


  const MyHeatMap({
    super.key,
    required this .currentDate,
    required this.heatMapDataset,
    required this.calenderSelected, 
    required this.calendarChange, required this.targetDate, required this.currentMonth,
  });

  // List<DateTime> markedDate = [
  //   DateTime(2025, 4, 20), 
  //   DateTime(2025, 14, 2)
  //   ];


 @override

  @override
  Widget build(BuildContext context) {
  
    return Column(
      children: [
        // the top bar of the calendar
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currentMonth,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 30,
                ),
              ),
              Row(children: [
              IconButton(
                onPressed: (){
                  calendarChange!(DateTime(targetDate.year,targetDate.month -1));
                  print(calenderSelected);
                }, 
                iconSize: 20,
                icon: const Icon(Icons.arrow_back_ios),
                ),
              IconButton(
                onPressed: (){
                  calendarChange!(DateTime(targetDate.year,targetDate.month + 1));
                }, 
                iconSize: 20,
                icon: const Icon(Icons.arrow_forward_ios),
              ),],),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        // the actual calendar
        Expanded(
          child: Container(
            child: CalendarCarousel(
              onDayPressed: (DateTime date, List<String> events) { // what happens when a day is pressed
                calenderSelected!(date);
              },
              targetDateTime: targetDate,
              onCalendarChanged: (DateTime time) { // when the change screen arrows are pressed
                calendarChange!(time);
              },
              selectedDateTime: currentDate,
              showHeader: false,
              weekdayTextStyle: TextStyle(
                color: Colors.grey.shade700
              ),
              todayBorderColor: Colors.black,
              todayButtonColor: Colors.red.shade400,
              selectedDayBorderColor: Colors.transparent,
              
              selectedDayButtonColor: Colors.grey.shade500,
              selectedDayTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
              thisMonthDayBorderColor: Colors.black,
              daysHaveCircularBorder: false,
              dayPadding: 6,
              pageSnapping: true,
              dayButtonColor: Colors.grey.shade200,
              //markedDatesMap: heatMapDataset,
            ),
          ),
        ),
      ],
    );

    //   return HeatMapCalendar(
    //     initDate: currentDate,
    //     //endDate: DateTime currentDate.year currentDate.month,0),
    //     colorMode: ColorMode.color,
    //     defaultColor: Colors.grey.shade200,
    //     textColor: Colors.black,

    //     flexible: true,
    //     monthFontSize: 20,
    //     fontSize: 16,
    //     margin: EdgeInsets.all(8.0),
    //     borderRadius: 0,
    //     //showText: true,
    //     //scrollable: true,
    //     showColorTip: false,
    //     //size: 50,
    //     onClick: (value) {
    //       calenderSelected!(value);
    //     },

    //     datasets: heatMapDataset,
    //     colorsets: const {1: Colors.red},
    //   );
    // }
  }
}
