import 'package:calender_demo/utils/calender_utils.dart';
import 'package:calender_demo/widgets/chore_widgets/chore_tile.dart';
import 'package:calender_demo/widgets/chore_widgets/other_chore/other_chore_tile.dart';
import 'package:flutter/material.dart';

class OtherChoreLists extends StatelessWidget {
  final String userName;
  final List<Chore> userChores;
  const OtherChoreLists({
    super.key,
    required this.userName,
    required this.userChores,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: BoxConstraints(maxHeight: 230, minHeight: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1),
        ),
        //width: double.maxFinite,
        child: Row(
          children: [
            // change this to a user color later
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.black, width: 1),
                ),
                color: Colors.cyanAccent,
              ),
              width: 25,
            ),
            Expanded(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      // the users name
                      userName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(color: Colors.black),
                  userChores.isEmpty
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("You have no Chores today"),
                      ) // if the list is empty
                      : Padding(
                        padding: const EdgeInsets.all(4),
                        child: ListView.builder(
                          // if the list isnt empty
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: userChores.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(4),
                              child: OtherChoreTile(chore: userChores[index]),
                            );
                          },
                        ),
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
