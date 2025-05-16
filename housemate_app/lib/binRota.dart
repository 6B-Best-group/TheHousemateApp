import 'package:flutter/material.dart';
import 'package:housemate_app/main.dart';

List<String> days = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thurday",
  "Friday",
  "Saturday",
  "Sunday"
];
List<String> timings = ["Weekly", "Biweekly"];

class binRota extends StatefulWidget {
  const binRota({super.key});

  @override
  State<binRota> createState() => _binRota();
}

class _binRota extends State<binRota> {
  //Each drop down is directly linked to the class
  String binDay = bin.genDay;
  String recDay = bin.recDay;
  String recTime = bin.recTime;
  String binTime = bin.genTime;
  @override
  //Returns: 4 drop downs containing days and times for bin/recycling
  //days
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bin rota"),
        ),
        body: Column(children: [
          Row(
            children: [
              const Text('General waste'),
              DropdownButton<String>(
                hint: const Text("Pick a day"),
                value: binDay,
                padding: EdgeInsets.all(16.0),
                onChanged: (String? newValue) {
                  setState(() {
                    binDay = newValue!;
                    bin.genDay = binDay;
                  });
                },
                items: days.map<DropdownMenuItem<String>>((String newValue) {
                  return DropdownMenuItem<String>(
                    value: newValue,
                    child: Text(newValue),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                hint: const Text("Pick a day"),
                value: binTime,
                onChanged: (String? newValue) {
                  setState(() {
                    binTime = newValue!;
                    bin.genTime = binTime;
                  });
                },
                items: timings.map<DropdownMenuItem<String>>((String newValue) {
                  return DropdownMenuItem<String>(
                    value: newValue,
                    child: Text(newValue),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Recycling'),
              DropdownButton<String>(
                hint: const Text("Pick a day"),
                padding: EdgeInsets.all(16.0),
                value: recDay,
                onChanged: (String? newValue) {
                  setState(() {
                    recDay = newValue!;
                    bin.recDay = recDay;
                  });
                },
                items: days.map<DropdownMenuItem<String>>((String newValue) {
                  return DropdownMenuItem<String>(
                    value: newValue,
                    child: Text(newValue),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                hint: const Text("Pick a day"),
                value: recTime,
                onChanged: (String? newValue) {
                  setState(() {
                    recTime = newValue!;
                    bin.recTime = recTime;
                  });
                },
                items: timings.map<DropdownMenuItem<String>>((String newValue) {
                  return DropdownMenuItem<String>(
                    value: newValue,
                    child: Text(newValue),
                  );
                }).toList(),
              ),
            ],
          ),
        ]));
  }
}
