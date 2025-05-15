import 'package:flutter/material.dart';
import 'package:housemate_app/utils/database/data-models.dart';

class OtherChoreTile extends StatelessWidget {
  final Chore chore;
  const OtherChoreTile({super.key, required this.chore});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("> ${chore.choreName}"),
            Container(
              width: 20,
              height: 20,
              color: chore.completed ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
