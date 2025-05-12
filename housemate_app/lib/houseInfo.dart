import 'package:flutter/material.dart';

void main() => runApp(const RoommateApp());

class RoommateApp extends StatelessWidget {
  const RoommateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HouseInfoScreen(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HouseInfoScreen extends StatefulWidget {
  const HouseInfoScreen({super.key});

  @override
  State<HouseInfoScreen> createState() => _HouseInfoScreenState();
}

class _HouseInfoScreenState extends State<HouseInfoScreen> {
  final houseController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final jobController = TextEditingController();
  String? error;
  Map<String, String>? roommate;

  bool validate() {
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        jobController.text.isEmpty) {
      error = 'All fields are required';
      return false;
    }
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(nameController.text) ||
        !RegExp(r'^[a-zA-Z ]+$').hasMatch(jobController.text)) {
      error = 'Invalid characters in name or profession';
      return false;
    }
    if (int.tryParse(ageController.text) == null) {
      error = 'Age must be a number';
      return false;
    }
    error = null;
    return true;
  }

  void saveInfo() {
    setState(() {
      if (validate()) {
        roommate = {
          'name': nameController.text,
          'age': ageController.text,
          'job': jobController.text,
        };
      }
    });
  }

  @override
  void dispose() {
    houseController.dispose();
    nameController.dispose();
    ageController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('House Info')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField(houseController, 'House Name'),
            const SizedBox(height: 20),
            const Text('Roommate Information', style: TextStyle(fontSize: 18)),
            _buildInputField(nameController, 'Name'),
            _buildInputField(ageController, 'Age', number: true),
            _buildInputField(jobController, 'Profession'),
            if (error != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(error!, style: const TextStyle(color: Colors.red)),
              ),
            ElevatedButton(
              onPressed: saveInfo,
              child: const Text('Save'),
            ),
            if (roommate != null) _buildInfoCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String label,
      {bool number = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: number ? TextInputType.number : TextInputType.text,
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('House: ${houseController.text}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text('Name: ${roommate!['name']}', style: const TextStyle(fontSize: 16)),
            Text('Age: ${roommate!['age']}', style: const TextStyle(fontSize: 16)),
            Text('Profession: ${roommate!['job']}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}