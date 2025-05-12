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
          //backgroundColor: Colors.blue,
          title: const Text('My Profile'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  // borderRadius: const BorderRadius.only(
                  //   bottomRight: const Radius.circular(10),
                  //   bottomLeft: Radius.circular(10),
                  // ),
                  border: const Border(bottom: const BorderSide(color: Colors.black,width: 1))
                  ),
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
                        backgroundImage: null,//AssetImage('Insert profile picture here'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25,top: 8,bottom:8),
                      child: Column(
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
                      ),
                    )
                  ],
                ),
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
                  width: 1.0,
                )),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Phone - Phone Number Here',
                          //textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Email - Email Address Goes Here',
                          //textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'DOB - Data Of Birth',
                          //textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Divider(),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Rent p/m',
                            //textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: Colors.black),
                          )),
                      Divider(),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Payment Date',
                            //textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: Colors.black),
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
