import 'package:flutter/material.dart';

class AddChoreWidget extends StatelessWidget {
  final TextEditingController newChoreText;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final DateTime selectedDate;

  const AddChoreWidget({
    super.key,
    required this.newChoreText,
    required this.onSave,
    required this.onCancel,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Colors.white,
      content: Container(
        padding: const EdgeInsets.all(8.0),
        height: 250,
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const Text(
                  "NEW CHORE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                const Divider(),

                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter New Chore Here",
                  ),
                  controller: newChoreText,
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // -- save
                OutlinedButton(
                  onPressed: onSave,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    side: const BorderSide(color: Colors.black, width: 1),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text("SAVE"),
                ),

                // -- cancel
                OutlinedButton(
                  onPressed: onCancel,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black, width: 1),
                    foregroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text("CANCEL"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
