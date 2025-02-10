import 'package:flutter/material.dart';

void main() => runApp(RoommateHouseApp());

class RoommateHouseApp extends StatelessWidget {
  const RoommateHouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roommate House Info',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HouseInfoScreen(),
    );
  }
}

class RoommateController {
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController profession = TextEditingController();
}

class HouseInfoScreen extends StatefulWidget {
  const HouseInfoScreen({super.key});

  @override
  _HouseInfoScreenState createState() => _HouseInfoScreenState();
}

class _HouseInfoScreenState extends State<HouseInfoScreen> {
  final houseNameController = TextEditingController();
  final List<RoommateController> roommateControllers = [];
  final List<Map<String, String>> savedRoommates = [];
  String errorMessage = "";
  bool allowAdditional = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    roommateControllers.addAll(List.generate(6, (_) => RoommateController()));
  }

  bool _validateInputs() {
    errorMessage = "";
    
    final enteredRoommates = roommateControllers.where((rc) =>
        rc.name.text.isNotEmpty ||
        rc.age.text.isNotEmpty ||
        rc.profession.text.isNotEmpty).length;

    if (enteredRoommates < 6) {
      errorMessage = "You must enter information for at least 6 roommates.";
      return false;
    }

    for (final rc in roommateControllers) {
      if (!RegExp(r'^[a-zA-Z ]+\$').hasMatch(rc.name.text)) {
        errorMessage = "All names must be valid strings.";
        return false;
      }
      if (rc.age.text.isEmpty || int.tryParse(rc.age.text) == null) {
        errorMessage = "Age must be a valid integer.";
        return false;
      }
      if (!RegExp(r'^[a-zA-Z ]+\$').hasMatch(rc.profession.text)) {
        errorMessage = "All professions must be valid strings.";
        return false;
      }
    }
    return true;
  }

  void _saveInfo() {
    setState(() {
      savedRoommates.clear();
      for (final rc in roommateControllers) {
        if (rc.name.text.isNotEmpty || rc.age.text.isNotEmpty || rc.profession.text.isNotEmpty) {
          savedRoommates.add({
            "name": rc.name.text,
            "age": rc.age.text,
            "profession": rc.profession.text,
          });
        }
      }
      _validateInputs();
    });
  }

  Widget _buildRoommateInputs() {
    return Column(
      children: [
        for (int i = 0; i < roommateControllers.length; i++)
          _RoommateInputGroup(
            controller: roommateControllers[i],
            index: i + 1,
          ),
        if (allowAdditional)
          ElevatedButton(
            onPressed: () => setState(() => roommateControllers.add(RoommateController())),
            child: Text('Add More Roommates'),
          ),
        Row(
          children: [
            Checkbox(
              value: allowAdditional,
              onChanged: (v) => setState(() => allowAdditional = v ?? false),
            ),
            Text('Allow adding more than 6 roommates'),
          ],
        ),
      ],
    );
  }

  Widget _buildSavedInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('House Name:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(houseNameController.text, style: TextStyle(fontSize: 18)),
        SizedBox(height: 20),
        Text('Roommates:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: savedRoommates.length,
          itemBuilder: (context, i) => Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(savedRoommates[i]["name"]!),
              subtitle: Text("Age: ${savedRoommates[i]["age"]}, Profession: ${savedRoommates[i]["profession"]}"),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    houseNameController.dispose();
    for (final rc in roommateControllers) {
      rc.name.dispose();
      rc.age.dispose();
      rc.profession.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('House Info')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: houseNameController,
              decoration: InputDecoration(labelText: 'House Name', border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            Text('Roommates (Min: 6):', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            _buildRoommateInputs(),
            ElevatedButton(onPressed: _saveInfo, child: Text('Save Info')),
            if (errorMessage.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(errorMessage, style: TextStyle(color: Colors.red, fontSize: 16)),
              ),
            _buildSavedInfo(),
          ],
        ),
      ),
    );
  }
}

class _RoommateInputGroup extends StatelessWidget {
  final RoommateController controller;
  final int index;

  const _RoommateInputGroup({required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          TextField(
            controller: controller.name,
            decoration: InputDecoration(
              labelText: 'Name of Roommate $index',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          TextField(
            controller: controller.age,
            decoration: InputDecoration(
              labelText: 'Age of Roommate $index',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 8),
          TextField(
            controller: controller.profession,
            decoration: InputDecoration(
              labelText: 'Profession of Roommate $index',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}