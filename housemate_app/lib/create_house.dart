import 'package:flutter/material.dart';
import 'package:housemate_app/main.dart';

class CreateHouse extends StatefulWidget {
  const CreateHouse({super.key});

  @override
  State<CreateHouse> createState() => _CreateHouseState();
}

class _CreateHouseState extends State<CreateHouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create House"),
      ),
      body: const MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final housename = TextEditingController();
  final address1 = TextEditingController();
  final address2 = TextEditingController();
  final city = TextEditingController();
  final county = TextEditingController();
  final postcode = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void submitButtonHandler() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      house.createHouse(housename.text, address1.text, address2.text, city.text,
          county.text, postcode.text);
      houseMember = true;
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            // House name.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid house name.";
              }
              return null;
            },
            controller: housename,
            decoration: const InputDecoration(
              hintText: "House name",
            ),
          ),
          TextFormField(
            // Address line 1.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid address.";
              }
              return null;
            },
            controller: address1,
            decoration: const InputDecoration(
              hintText: "Address Line 1",
            ),
          ),
          TextFormField(
            // Address line 2.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid address.";
              }
              return null;
            },
            controller: address2,
            decoration: const InputDecoration(
              hintText: "Address Line 2",
            ),
          ),
          TextFormField(
            // City.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid city name.";
              }
              return null;
            },
            controller: address2,
            decoration: const InputDecoration(
              hintText: "City",
            ),
          ),
          TextFormField(
            // County.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid county.";
              }
              return null;
            },
            controller: county,
            decoration: const InputDecoration(
              hintText: "County",
            ),
          ),
          TextFormField(
            // Postcode.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid postcode.";
              }
              return null;
            },
            controller: postcode,
            decoration: const InputDecoration(
              hintText: "Postcode",
            ),
          ),
          ElevatedButton.icon(
            onPressed: () async {
            },
            icon: const Icon(Icons.calendar_month),
            label: const Text("Choose Tennancy Dates"),
          ),
          ElevatedButton(
            onPressed: () {
              submitButtonHandler();
            },
            child: const Text("Create House"),
          ),
        ],
      ),
    );
  }
}
