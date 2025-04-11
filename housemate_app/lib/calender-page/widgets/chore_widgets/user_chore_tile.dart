import 'package:housemate_app/utils/calender_utils.dart';
import 'package:housemate_app/calender-page/widgets/chore_widgets/chore_tile.dart';
import 'package:flutter/material.dart';

class UserChoreTile extends StatelessWidget {
  final List<Chore> userChores;
  const UserChoreTile({super.key, required this.userChores});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: BoxConstraints(minHeight: 80),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Row(
          children: [
            // color banner
            Container(
              width: 25,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border(
                  right: BorderSide(color: Colors.black, width: 1),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Your Chores Today: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(color: Colors.black),
                  userChores.isEmpty
                      ? Padding(
                        // if the list is empty
                        padding: const EdgeInsets.all(8.0),
                        child: Text("You have no Chores today"),
                      )
                      : ListView.builder(
                        // if the list isnt empty
                        shrinkWrap: true,
                        itemCount: userChores.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: ChoreTile(chore: userChores[index]),
                          );
                        },
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
