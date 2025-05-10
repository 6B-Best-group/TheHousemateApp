import 'package:housemate_app/class/shoppingItem.dart';
import 'package:housemate_app/dataInfo.dart';
import 'package:housemate_app/main.dart' show shoppingList;

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

    if (!userEmail.contains("@")) {
      return false;
    }
    return true;
  }

  bool itemValid(String quantity, String name) {
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
      ShoppingItem item = ShoppingItem(name, int.parse(quantity));
      shoppingList.add(item);
      return true;
    }
    return false;
  }
}
