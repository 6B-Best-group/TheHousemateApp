import 'package:housemate_app/dataInfo.dart';

class DataChecks {
  bool charLengthCheck(String field, String value) {
    if (inputLen[field]! < value.length || value.isEmpty) {
      return false;
    }
    return true;
  }

  bool createUserChecks(fname, lname, user, userEmail, date) {
    //string input checks
    List inputs = [fname, lname, user, userEmail];
    List keys = ["firstName", "lastName", "email", "userName"];
    int i = 0;

    for (String key in keys) {
      bool lenCheck = charLengthCheck(key, inputs[i]);
      if (!lenCheck) {
        return false;
      }
      i += 1;
    }

    if (userEmail.contains("@") != 1) {
      return false;
    }
    return true;
  }
}
