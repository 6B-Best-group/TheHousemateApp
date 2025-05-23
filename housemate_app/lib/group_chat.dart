import 'package:flutter/material.dart';
import 'package:housemate_app/inputCheck.dart';

import 'package:housemate_app/utils/Widgets/groupchat_message_tile.dart';
import 'package:housemate_app/utils/calender_utils.dart';
import 'package:housemate_app/utils/database/data-models.dart';
import 'package:housemate_app/utils/database/database.dart';
import 'package:housemate_app/utils/widgets/groupchat_member_tile.dart';

//Author: Matt

class GroupChatPage extends StatefulWidget {
  const GroupChatPage({super.key});

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  late User currentUser;

  TextEditingController myMessage = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final currentMessageDate = DateTime.now();

  late List<User> houseMember = [];

  // List<MemberData> houseMembers = [
  //   MemberData('Dan', Colors.pink, '0111567aEd'),
  //   MemberData('Craig', Colors.orange, '5689442gIc'),
  //   MemberData('Mark', Colors.cyan, '7829635hOp'),
  //   MemberData('Lucy', Colors.green, '3331983jMp'),
  //   MemberData('Gurt', Colors.yellow, '6722039gTd'),
  // ];

  late List<Message> messages = [];

  // List<GCMessage> messages = [
  //   GCMessage(DateTime(2025,12,5,7,30,21), 'Yo', MemberData('Gurt', Colors.yellow, '6722039gTd'),),
  //   GCMessage(DateTime(2025,12,5,7,40,21), 'Hello Gurthanial', MemberData('Craig', Colors.orange, '5689442gIc'),),
  //   GCMessage(DateTime(2025,12,5,7,50,21), 'How are all of you', MemberData('Gurt', Colors.yellow, '6722039gTd'),),
  //   GCMessage(DateTime(2025,12,5,7,55,21), 'im not bad myself, what about wou how was your weekend?', MemberData('Lucy', Colors.green, '3331983jMp'),),
  //   GCMessage(DateTime(2025,12,5,8,50,21), 'My weekend was rather fun, i went fishing and walked my dog. Im super excited for our holiday next week, i have never been to go ape, is everyone else ready to go?', MemberData('Gurt', Colors.yellow, '6722039gTd'),),
  //   GCMessage(DateTime(2025,12,5,9,40,21), 'For what its worth im rather excited aswell, LOLS', MemberData('Craig', Colors.orange, '5689442gIc'),),
  // ];

  void sendMessage() {
    DataChecks check = DataChecks();
    if (check.chatMessage(
        myMessage.text, currentUser.username, DateTime.now())) {
      setState(() {
        Database().message.add(Message(
              messageId: Database().message.length,
              houseId: currentUser.houseId,
              userId: currentUser.userId,
              messageText: myMessage.text,
              messageDate: DateTime.now(),
            ));
        myMessage.clear();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    currentUser = Database().users[Database()
        .currentUser]; //MemberData('Lucy', Colors.green, '3331983jMp');
    messages = Database().message;
    houseMember = Database().users;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Group Chat',
        ),
      ),
      body: Row(
        children: [
          Flexible(
            // --------------------- side bar ----------------------------
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                //color: Colors.purple,
                border: Border(
                  right: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // THE HOUSE BOX
                      height: 100,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            // colour banner
                            width: 25,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade700,
                              border: const Border(
                                right:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 5, bottom: 5),
                                  child: Text(
                                    'House',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(fontSize: 18),
                                  ),
                                ),
                                const Divider(
                                  height: 0,
                                ),
                                Container(
                                  color: Colors.white,
                                  width: double.maxFinite,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10, bottom: 15),
                                    child: Text(
                                      // house address goes here
                                      '1 Orchard Road, P03 7HE',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.grey.shade600,
                            width: double.maxFinite,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              child: Text(
                                'Members',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: 18),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 0,
                          ),
                          Expanded(
                            child: ListView.builder(
                              // lists all of the members
                              itemCount: houseMember.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GroupchatMemberTile(
                                    memberName:
                                        '${houseMember[index].firstName} ${houseMember[index].lastName}',
                                    memberColor: Colors.cyan,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
          Expanded(
            // -------------------- gc page ------------------------------
            flex: 4,
            child: Container(
              color: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: messages.length,
                        shrinkWrap: false,
                        itemBuilder: (BuildContext context, int index) {
                          if (checkDate(
                              messages[index].messageDate,
                              index == 0
                                  ? currentMessageDate
                                  : messages[index - 1].messageDate)) {
                            return GCMessageTile(
                              isMe:
                                  currentUser.userId == messages[index].userId,
                              message: messages[index],
                            );
                          } else {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Divider()),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          '${messages[index].messageDate.year.toString()} ${convertDatetimeToMonth(messages[index].messageDate)} ${messages[index].messageDate.day.toString()}'),
                                    ),
                                    Expanded(child: Divider()),
                                  ],
                                ),
                                GCMessageTile(
                                  // this is what the messages are displayed on
                                  isMe: currentUser.userId ==
                                      messages[index].userId,
                                  message: messages[index],
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                    Container(
                      // the text bar at the bottom to allow for messaging
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: TextField(
                              controller: myMessage,
                              onSubmitted: (value) => sendMessage(),
                              decoration: const InputDecoration(
                                hintText: "message Group Chat",
                                focusColor: Colors.grey,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.zero),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.zero),
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 14,
                                  ),
                              cursorColor: Colors.black,
                            ),
                          ),
                          IconButton(
                              padding: const EdgeInsets.all(12),
                              onPressed: sendMessage,
                              icon: const Icon(Icons.arrow_upward_sharp),
                              style: IconButton.styleFrom(
                                  side: const BorderSide(
                                      color: Colors.black, width: 1),
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  )))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool checkDate(DateTime checkedDate, DateTime checkedDate2) {
    if ((checkedDate.year == checkedDate2.year) &&
        (checkedDate.month == checkedDate2.month) &&
        (checkedDate.day == checkedDate2.day)) {
      return true;
    } else {
      currentMessageDate == checkedDate;

      return false;
    }
  }
}
