import 'package:flutter/material.dart';

class GroupchatMemberTile extends StatelessWidget {
  final String memberName;
  final Color memberColor;
  const GroupchatMemberTile({super.key, required this.memberName, required this.memberColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black,width: 1),
        color: Colors.white,
      ),
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 20,
            decoration: BoxDecoration(
              border: const Border(right: const BorderSide(color: Colors.black,width: 2),),
              color: memberColor,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                memberName,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 16,
                ),
              ),
            )
            )
        ],
      ),
    );
  }
}