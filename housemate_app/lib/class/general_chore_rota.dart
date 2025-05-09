class GeneralChoreRota {
  final String choreName;
  List<String> choreRota;
  int rotaIndexTracker = 0;
  DateTime? lastCompleted;

  GeneralChoreRota(this.choreName, this.choreRota);

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

  String getLastAssignee() {
    if (lastCompleted != null) {
      if (rotaIndexTracker == 0) {
        return choreRota[choreRota.length - 1];
      } else {
        return choreRota[rotaIndexTracker - 1];
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