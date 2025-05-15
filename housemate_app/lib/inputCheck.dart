import 'package:flutter/material.dart';
import 'package:housemate_app/class/profile.dart';
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
      ShoppingItem item = ShoppingItem(name, int.parse(quantity));
      shoppingList.add(item);
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

  bool houseCheck(name, add1, add2, cit, cont, code) {
    String address2 = add2;
    if (add2 == "") {
      address2 = cit;
    }
    List<String> values = [name, add1, address2, cit, cont, code];
    List<String> fields = [
      "name",
      "add1",
      "add2",
      "city",
      "county",
      "postcode"
    ];

    for (int i = 0; i < values.length; i++) {
      if (values[i] == " ") {
        return false;
      }

      if (!charLengthCheck(houseInputLen[fields[i]]!, values[i])) {
        return false;
      }
    }
    if (checkForNum(cit) || checkForNum(cont)) {
      return false;
    }
    return true;
  }

  bool chatMessage(String message, sender, time) {
    if (!(sender is User)) {
      return false;
    }
    if (message == "") {
      return false;
    }
    try {
      if (time.difference(DateTime.now()).inSeconds > 0) {
        return false;
      }
    } catch (e) {
      return false;
    }
    if (!charLengthCheck(chatData["message"]!, message)) {
      return false;
    }
    return true;
  }

  bool chore(name, List users) {
    if (!charLengthCheck(choreData["name"]!, name)) {
      return false;
    }
    if (users.isEmpty) {
      return false;
    }
    for (dynamic user in users) {
      if (user is! User) {
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
