import 'package:flutter/material.dart';
import 'package:housemate_app/main.dart';
import 'package:housemate_app/utils/database/data-models.dart';
import 'package:housemate_app/utils/database/database.dart';
//import 'class/profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late User currentUser;

  @override
  void initState() {
    super.initState();
    // Retrives the current user from the database
    currentUser = Database().users[Database().currentUser];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  border: const Border(
                      bottom: const BorderSide(color: Colors.black, width: 1))),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: const CircleAvatar(
                        maxRadius: 50.0,
                        minRadius: 50.0,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            null, //AssetImage('Insert profile picture here'), When fully operational this will be the profile picture
                      ),
                    ),
                    Padding(
                      // User name and address displayed beside profiel picture
                      padding: EdgeInsets.only(left: 25, top: 8, bottom: 8),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            '${currentUser.firstName} ${currentUser.lastName}', //user.getFirstName(), Gets user's first and last name to be shown on the user profile
                            style: TextStyle(
                              fontSize: 27,
                            ),
                          ),
                          Text(
                            Database()
                                .house[0]
                                .houseAddress, // Gets the address of the house to be shown on the user profile
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Displays main Infomation bellow header: users email address, Date of birth, general waste bin collection day and time, recycling bin collection day and time
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 400,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                )),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          currentUser.email, // Displays users email address
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Divider(),
                      // Date Of Birth
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '${currentUser.dateOfBirth.year}-${currentUser.dateOfBirth.month}-${currentUser.dateOfBirth.year}', // Gets the users date of birth to be shown on the user profile
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Divider(),
                      // General waste bin collection day and time
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'General waste bin day is ${bin.genDay} ${bin.genTime}', // gets the date and time for when the general waste bin is collected and shown on the user profile
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          )),
                      Divider(),
                      // Recycling bin collection day and time
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Recycling bin day is ${bin.recDay} ${bin.recTime}', // gets the date and time for when the recycling bin is collected and shown on the user profile
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
