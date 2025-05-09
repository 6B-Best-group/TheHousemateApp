class GeneralChoreRota {
  final String choreName;
  List<String> choreRota;
  int rotaIndexTracker = 0;
  DateTime lastCompleted = DateTime.now();

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

  DateTime getLastCompleted() {
    return lastCompleted;
  }

  void setLastCompleted() {
    lastCompleted = DateTime.now();
  }
}