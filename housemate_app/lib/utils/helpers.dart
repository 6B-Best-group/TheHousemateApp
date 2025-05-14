
import 'package:housemate_app/utils/database/data-models.dart';
import 'package:collection/collection.dart';

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

Map<DateTime,List<Chore>> sortingChoreDates (List<Chore> currentChores) => groupBy(currentChores, (chore) => chore.dueDate);
  