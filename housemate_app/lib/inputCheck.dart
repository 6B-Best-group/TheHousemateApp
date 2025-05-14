import 'package:housemate_app/class/shoppingItem.dart';
import 'package:housemate_app/dataInfo.dart';
//import 'package:housemate_app/main.dart' show shoppingList;
import 'package:housemate_app/utils/database/database.dart';

class DataChecks {
  bool charLengthCheck(int field, String value) {
    if (field < value.length || value.isEmpty) {
      return false;
    }
    return true;
  }

  bool createUserChecks(fname, lname, user, userEmail, date) {
    //string input checks
    List inputs = [fname, lname, user, userEmail];
    List keys = ["firstName", "lastName", "userName", "email"];
    int i = 0;

    for (String key in keys) {
      bool lenCheck = charLengthCheck(usernameData[key]!, inputs[i]);
      if (!lenCheck) {
        return false;
      }
      i += 1;
    }
    if (userEmail.length < 5) {
      return false;
    }

    if (checkForNum(fname) || checkForNum(lname)) {
      return false;
    }
    if (!userEmail.contains("@")) {
      return false;
    }
    return true;
  }

  //adding a shopping list item checks
  bool addShoppingItem(String quantity, String name) {
    if (quantity == "") {
      quantity = "0";
    }
    try {
      int quant = int.parse(quantity);
      if (quant < 0 || quant > 50) {
        return false;
      }
    } catch (e) {
      return false;
    }
    if (charLengthCheck(shoppingItemData["itemName"]!, name)) {
      //ShoppingItem item = ShoppingItem(name, int.parse(quantity));
      //Database().shoppingList.add(item);
      return true;
    }
    return false;
  }

  bool addShoppingItemCost(String cost) {
    if (cost == "") {
      return false;
    }
    try {
      double quant = double.parse(cost);
      if (quant <= 0 || quant > 200) {
        return false;
      }
    } catch (e) {
      return false;
    }
    if (cost.contains(".")) {
      String decPlaces = cost.split(".")[1];
      if (decPlaces.length > 2) {
        return false;
      }
    }
    return true;
  }
}

bool checkForNum(data) {
  for (int l = 0; l < data.length; l++) {
    try {
      int.parse(data[l]);
      return true;
    } catch (e) {
      //nothing happens
    }
  }
  return false;
}
