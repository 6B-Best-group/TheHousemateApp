
import 'package:housemate_app/utils/database/data-models.dart';
import 'package:collection/collection.dart';
import 'package:housemate_app/utils/database/database.dart';

List<User> nextAssigned(int amountAssigned,User currentUser, List<User> validUsers){ // returns the next however many usersafter the current one
  List<User> returnedUsers = [];

  if ( (currentUser.userId + amountAssigned) > validUsers.length){
    int remainingUsers = (currentUser.userId + amountAssigned) - validUsers.length;
    returnedUsers.addAll(validUsers.sublist(currentUser.userId - 1,validUsers.length - 1));
    returnedUsers.addAll(validUsers.sublist(0 ,amountAssigned - remainingUsers));
  }
  else {
    returnedUsers.addAll(validUsers.sublist(currentUser.userId,currentUser.userId + amountAssigned));
  }

  return returnedUsers;


}

Map<DateTime, List<Chore>> sortingUserChoreDates(Map<DateTime, List<Chore>> allUserData) {
  final userID = Database().currentUser + 1;
  final Map<DateTime, List<Chore>> result = {};

  allUserData.forEach((date, chores) {
    final matches = chores.where((item) => item.userId == userID).toList();
    if (matches.isNotEmpty) {
      result[date] = matches;
    }
  });

  return result;
}

Map<DateTime, List<Chore>> sortingOtherUserChoreDates(Map<DateTime, List<Chore>> allUserData) {
  final int userId = Database().currentUser + 1;
  final Map<DateTime, List<Chore>> result = {};

  allUserData.forEach((date, chores) {
    final matches = chores.where((item) => item.userId != userId).toList();
    if (matches.isNotEmpty) {
      result[date] = matches;
    }
  });

  return result;
}

Map<DateTime, Map<int, List<Chore>>> choresByDateAndUser (Map<DateTime, List<Chore>> choresByDate){
  Map<DateTime, Map<int, List<Chore>>> result = {};

  choresByDate.forEach((date, choresList) {
    result[date] = groupBy(choresList, (Chore chore) => chore.userId);
  });

  return result;

}
List<Chore> sortedCurrentUserData (int userID, DateTime selectedDate) => Database().chore.where((item) => 
  (item.userId == userID) && (item.dueDate == selectedDate)).toList();


Map<DateTime,List<Chore>> sortingChoreDates (List<Chore> currentChores) => groupBy(currentChores, (chore) => chore.dueDate);
  
Map<DateTime,int> addingToHeatMap (Map<DateTime,List> choreDates) => choreDates.map((key,value) => MapEntry(key, value.length));

User findUser (int selectedUserID) => Database().users.firstWhere((user) => user.userId == selectedUserID);