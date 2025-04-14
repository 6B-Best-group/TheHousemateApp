import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('My Profile'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )),
              child: const Row(
                children: [
                  CircleAvatar(
                    maxRadius: 50.0,
                    minRadius: 50.0,
                    backgroundColor: Colors.white,
                    backgroundImage: null,//AssetImage('Insert profile picture here'),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'Name Goes Here',
                        style: TextStyle(
                          fontSize: 27,
                        ),
                      ),
                      Text(
                        'Address Goes Here',
                        style: TextStyle(
                          fontSize: 23,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 500,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                )),
                child: const Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Phone Number Here',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Email Address Goes Here',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Data Of Birth',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Rent p/m',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              )),
                          Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Payment Date',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
