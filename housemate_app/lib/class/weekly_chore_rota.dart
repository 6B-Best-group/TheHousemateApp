import 'package:flutter/material.dart';
import 'package:housemate_app/utils/database/data-models.dart';
//Author: Ben
//Parameters:
//choreName - name of the chore object
//choreRota - List of users assigned to chore
//assignee - Who assigned the chore
// Return value - none
class WeeklyChoreRota {
  final String choreName;
  List<User> choreRota;
  User assignee;
  int rotaIndexTracker = 0;
  bool completed = false;

  WeeklyChoreRota(this.choreName, this.choreRota, this.assignee);
  // Pushes the chore index up by one for the next person
  void incrementRota() {
    if (rotaIndexTracker == choreRota.length - 1) {
      rotaIndexTracker = 0;
    } else {
      rotaIndexTracker++;
    }
  }
  //returns: chore assigned to person
  User getAssignee() {
    return choreRota[rotaIndexTracker];
  }
  //returns: the next person to get the chore
  User getNextAssignee() {
    if (rotaIndexTracker == choreRota.length - 1) {
      return choreRota[0];
    } else {
      return choreRota[rotaIndexTracker + 1];
    }
  }

  void setCompleted() {
    completed = !completed;
  }
  // returns: chore colour
  Color getColor() {
    if (completed) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
  //returns: chore icon
  Icon getIcon() {
    if (completed) {
      return const Icon(Icons.check);
    } else {
      return const Icon(Icons.close);
    }
  }
}