import 'package:housemate_app/calender-page//widgets/chore_widgets/other_chore/other_chore_tile.dart';
import 'package:flutter/material.dart';
import 'package:housemate_app/utils/database/data-models.dart';

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
        constraints: const BoxConstraints(
          minHeight: 40
          ),
        decoration: BoxDecoration(
          color: Colors.cyan,
          border: Border.all(color: Colors.black, width: 1),
        ),
       
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 25,
            ),
            Flexible(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left:BorderSide (color: Colors.black, width: 1)
                    ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(

                        // the users name
                        userName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(color: Colors.black),
                    userChores.isEmpty
                        ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("You have no Chores today"),
                        ) // if the list is empty
                        : Padding(
                          padding: const EdgeInsets.only(
                            left: 4,
                            top: 4,
                            bottom: 10,
                            right: 4,
                            ),
                          child: ListView.builder(
                            // if the list isnt empty
                            physics: const ClampingScrollPhysics(),
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
            ),
          ],
        ),
      ),
    );
  }
}
