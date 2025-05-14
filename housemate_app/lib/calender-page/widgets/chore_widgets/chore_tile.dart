import 'package:housemate_app/utils/calender_utils.dart';
import 'package:flutter/material.dart';
import 'package:housemate_app/utils/database/data-models.dart';
import 'package:housemate_app/utils/database/database.dart';

class ChoreTile extends StatelessWidget {
  final Chore chore;
  final Function(bool,Chore)? changeCompleted;
  const ChoreTile({super.key, required this.chore, this.changeCompleted});

  @override
  Widget build(BuildContext context) {
    bool completed = chore.completed;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("> ${chore.choreName}"),
            Checkbox(
              activeColor: chore.completed ? Colors.green : Colors.red,
              value: completed,
              onChanged: (value) => completed
                
              
            ),
          ],
        ),
      ),
    );
  }
}
