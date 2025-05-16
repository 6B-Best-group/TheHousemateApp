import 'package:housemate_app/utils/database/data-models.dart';

//Author: Ben
//Parameters:
//choreName - name of the chore object
//choreRota - List of users assigned to chore
//assignee - Who assigned the chore
// Return value - none
class GeneralChoreRota {
  final String choreName;
  List<User> choreRota;
  User assignee;
  int rotaIndexTracker = 0;
  DateTime? lastCompleted;

  GeneralChoreRota(this.choreName, this.choreRota, this.assignee);

  // Pushes the chore index up by one for the next person
  void incrementRota() {
    if (rotaIndexTracker == choreRota.length - 1) {
      rotaIndexTracker = 0;
    } else {
      rotaIndexTracker++;
    }
  }

  //returns: chore assigned to person
  String getAssignee() {
    return choreRota[rotaIndexTracker].firstName;
  }

  //returns: the next person to get the chore
  String getNextAssignee() {
    if (rotaIndexTracker == choreRota.length - 1) {
      return choreRota[0].firstName;
    } else {
      return choreRota[rotaIndexTracker + 1].firstName;
    }
  }

  //returns: the final person in the chore list before it restarts
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

  //Returns: when the chire was last completed
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
