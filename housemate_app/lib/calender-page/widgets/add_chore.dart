import 'package:housemate_app/calender-page/widgets/date_selector.dart';
import 'package:flutter/cupertino.dart';
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Colors.white,
      content: Container(
        padding: EdgeInsets.all(8.0),
        height: 250,
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  "NEW CHORE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                Divider(),

                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter New Chore Here",
                  ),
                  controller: newChoreText,
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              // make a seperate button class
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SAVE
                OutlinedButton(
                  onPressed: onSave,
                  style: OutlinedButton.styleFrom(
                    //backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.green,
                    side: BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text("SAVE"),
                ),
                //SizedBox(width: 20),

                // CANCEL
                OutlinedButton(
                  onPressed: onCancel,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black, width: 1),
                    foregroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text("CANCEL"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
