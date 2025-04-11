import 'package:housemate_app/utils/calender_utils.dart';
import 'package:flutter/material.dart';

class ChoreTile extends StatelessWidget {
  final Chore chore;
  const ChoreTile({super.key, required this.chore});

  @override
  Widget build(BuildContext context) {
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
            Text("> ${chore.choreTitle}"),
            Checkbox(
              activeColor: chore.completed ? Colors.green : Colors.red,
              value: chore.completed,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
