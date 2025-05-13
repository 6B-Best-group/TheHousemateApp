import 'package:flutter/material.dart';

class WeeklyChoreRota {
  final String choreName;
  List<String> choreRota;
  int rotaIndexTracker = 0;
  bool completed = false;

  WeeklyChoreRota(this.choreName, this.choreRota);

  void incrementRota() {
    if (rotaIndexTracker == choreRota.length - 1) {
      rotaIndexTracker = 0;
    } else {
      rotaIndexTracker++;
    }
  }

  String getAssignee() {
    return choreRota[rotaIndexTracker];
  }

  String getNextAssignee() {
    if (rotaIndexTracker == choreRota.length - 1) {
      return choreRota[0];
    } else {
      return choreRota[rotaIndexTracker + 1];
    }
  }

  void setCompleted() {
    completed = !completed;
  }

  Color getColor() {
    if (completed) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  Icon getIcon() {
    if (completed) {
      return const Icon(Icons.check);
    } else {
      return const Icon(Icons.close);
    }
  }
}