import 'package:flutter/material.dart';

class MemberData{
  String username;
  String userID;
  Color userColor;

  MemberData(this.username,this.userColor,this.userID);
}

class GCMessage{
  DateTime timeSent;
  String message;
  MemberData user;

  GCMessage(this.timeSent,this.message,this.user);
}