import 'package:flutter/material.dart';
import 'package:housemate_app/utils/Widgets/groupchat_message_tile.dart';
import 'package:housemate_app/utils/groupchat_utils.dart';
import 'package:housemate_app/utils/widgets/groupchat_member_tile.dart';

class GroupChatPage extends StatefulWidget {
  const GroupChatPage({super.key});

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {

  late MemberData currentUser; 

  List<MemberData> houseMembers = [
    MemberData('Dan', Colors.pink, '0111567aEd'),
    MemberData('Craig', Colors.orange, '5689442gIc'),
    MemberData('Mark', Colors.cyan, '7829635hOp'),
    MemberData('Lucy', Colors.green, '3331983jMp'),
    MemberData('Gurt', Colors.yellow, '6722039gTd'),
  ];

  List<GCMessage> messages = [
    GCMessage(DateTime(2025,12,5,7,30,21), 'Yo', MemberData('Gurt', Colors.blue, '6722039gTd'),),
    GCMessage(DateTime(2025,12,5,7,40,21), 'Hello Gurthanial', MemberData('Craig', Colors.orange, '5689442gIc'),),
    GCMessage(DateTime(2025,12,5,7,50,21), 'How are all of you', MemberData('Gurt', Colors.blue, '6722039gTd'),),
    GCMessage(DateTime(2025,12,5,7,55,21), 'im not bad myself, what about wou how was your weekend?', MemberData('Lucy', Colors.green, '3331983jMp'),),
    GCMessage(DateTime(2025,12,5,8,50,21), 'My weekend was rather fun, i went fishing and walked my dog. Im super excited for our holiday next week, i have never been to go ape, is everyone else ready to go?', MemberData('Gurt', Colors.blue, '6722039gTd'),),
    GCMessage(DateTime(2025,12,5,9,40,21), 'For what its worth im rather excited aswell, i feel like this holiday will be super fun', MemberData('Craig', Colors.orange, '5689442gIc'),),
  ];


  
  @override
  void initState() {
    super.initState();
      currentUser = MemberData('Lucy', Colors.green, '3331983jMp');
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Group Chat',
        ),
      ),
      body: Row(
        children: [
          Flexible( // --------------------- side bar ----------------------------
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                      //color: Colors.purple,
                      border: Border(
                        right: BorderSide(color: Colors.black ,width: 2),
                      ),
                    ),
              
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( // THE HOUSE BOX
                      height: 78,//double.minPositive,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.black ,width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container( // colour banner
                              width: 25,
                              //height: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade700,
                                border: const Border(
                                  right: BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          Expanded(
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
                                  child: Text( // work on this next
                                  
                                    'House',
                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                      fontSize: 18
                                    ),
                                  ),
                                ),
                                const Divider(
                                  height: 0,
                                ),
                                Container(
                                  color: Colors.white,
                                  width: double.maxFinite,
                                  
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 10,bottom: 15),
                                    child: Text( // house address goes here
                                      '1 Orchard Road, P03 7HE',
                                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                              
                                
                                              
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                         // color: Colors.grey,
                          border: Border.all(color: Colors.black,width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.grey.shade600,
                              width: double.maxFinite,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                                child: Text(
                                  'Members',
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                    fontSize: 18
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 0,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: houseMembers.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding:EdgeInsets.all(8.0),
                                    child: GroupchatMemberTile(
                                      memberName: houseMembers[index].username, 
                                      memberColor: houseMembers[index].userColor,
                                      ),
                                  );
                                },
                              ),
                            ),
                          ],

                        ),
                        
                      ),
                    )
                    )
                ],
              
              
              ),
              ),
            ),

          Expanded( // -------------------- gc page ------------------------------
            flex: 4,
            child: Container(
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //main
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: messages.length,
                      shrinkWrap: false,
                      itemBuilder: (BuildContext context, int index) {
                        return GCMessageTile(
                          isMe: currentUser.username == messages[index].user.username, 
                          message: messages[index]
                          )
                        
                        ;
                      },
                    ),
                  ),
                  
                ],
              )),
            ),
        ],
      ),
    );
  }
}