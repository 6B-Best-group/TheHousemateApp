import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class MyHeatMap extends StatelessWidget {
  final DateTime currentDate;
  final DateTime targetDate;
  final String currentMonth;

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
              onCalendarChanged: (DateTime time) { // changes the screen when the arrows are clicked
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
            ),
          ),
        ),
      ],
    );
  }
}
