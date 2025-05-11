import 'package:flutter/material.dart';
import 'package:housemate_app/utils/groupchat_utils.dart';

class GCMessageTile extends StatelessWidget {
  final bool isMe;
  final GCMessage message;

  const GCMessageTile({super.key, required this.isMe, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isMe ? 64.0 : 16.0,4, isMe? 16.0:64.0,4
        ),
        child: Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            //height: double.maxFinite,
            // constraints: const BoxConstraints(
            //               minWidth: 300,
            //                maxWidth: 500,
            //             ),
            
            //width: 400,
            decoration: BoxDecoration(
              color: message.user.userColor,   
              border: Border.all(
                color: Colors.black,width: 1,
              )
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              
              children: [ // maybe change around how its laid out
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,//message.user.userColor,   
                    border: Border(
                     left: BorderSide(color: Colors.black,width: 1,)
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                   // mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          message.user.username,
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 14,
                            color: Colors.black //isMe? Colors.black: Colors.white,  
                          ),
                        ),
                      ),
                      
                      
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.black, width: 1,
                            )
                          )
                        ),
                              
                        constraints: const BoxConstraints(
                          minWidth: 300,
                           maxWidth: 450,
                        ),
                        child: Text(
                          softWrap: true,
                          overflow: TextOverflow.clip,
                          maxLines: 7,
                          message.message,
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontSize: 14,
                            color: Colors.black , //isMe? Colors.black: Colors.white,  
                            //backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left:12,
                          right: 12,
                          top: 5,
                          bottom: 12,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                                  " ${message.timeSent.hour}:${message.timeSent.minute}  ",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                    fontSize: 13,
                                    color: Colors.grey //isMe? Colors.black: Colors.white,  
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
    );
  }
}