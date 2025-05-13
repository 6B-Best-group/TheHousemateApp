class ActionLogNotification {
  final String notificationName;
  final String notificationDetail;
  final DateTime dateAdded = DateTime.now();

  ActionLogNotification(this.notificationName, this.notificationDetail);
}
