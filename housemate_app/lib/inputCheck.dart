import 'package:housemate_app/dataInfo.dart';

class DataChecks {
  bool charLengthCheck(String field, String value) {
    if (inputLen[field]! < value.length || value.isEmpty) {
      print(value);
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
      bool lenCheck = charLengthCheck(key, inputs[i]);
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
