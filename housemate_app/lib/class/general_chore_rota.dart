import 'package:housemate_app/utils/database/data-models.dart';

class GeneralChoreRota {
  final String choreName;
  List<User> choreRota;
  User assignee;
  int rotaIndexTracker = 0;
  DateTime? lastCompleted;

  GeneralChoreRota(this.choreName, this.choreRota,this.assignee);

  void incrementRota() {
    if (rotaIndexTracker == choreRota.length - 1) {
      rotaIndexTracker = 0;
    } else {
      rotaIndexTracker++;
    }
  }

  String getAssignee() {
    return choreRota[rotaIndexTracker].firstName;
  }

  String getNextAssignee() {
    if (rotaIndexTracker == choreRota.length - 1) {
      return choreRota[0].firstName;
    } else {
      return choreRota[rotaIndexTracker + 1].firstName;
    }
  }

  String getLastAssignee() {
    if (lastCompleted != null) {
      if (rotaIndexTracker == 0) {
        return choreRota[choreRota.length - 1].firstName;
      } else {
        return choreRota[rotaIndexTracker - 1].firstName;
      }
    } else {
      return 'N/A';
    }
  }

  String getLastCompleted() {
    if (lastCompleted != null) {
      return lastCompleted.toString().substring(0, 16);
    } else {
      return 'Never';
    }
  }

  void setLastCompleted() {
    lastCompleted = DateTime.now();
  }
}