//Author: Ben
//Parameters:
// notificationName -  Name of notification
// notificationDetail - any details about the notification
// Return value - none

class ActionLogNotification {
  final String notificationName;
  final String notificationDetail;
  final DateTime dateAdded = DateTime.now();

  ActionLogNotification(this.notificationName, this.notificationDetail);
}
