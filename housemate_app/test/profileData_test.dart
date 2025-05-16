import 'package:flutter_test/flutter_test.dart';
import 'package:housemate_app/dataInfo.dart';
import 'package:housemate_app/inputCheck.dart';
import 'package:housemate_app/class/profile.dart';

/* 
Test plan: 2.1 user creation
*/
void main() {
  group('Test first name validity', () {
    test('Test for an empty value', () {
      DataChecks check = DataChecks();
      expect(
          check.charLengthCheck(usernameData["firstName"]!, ""), equals(false));
    });
    test('Test for a value thats too long', () {
      DataChecks check = DataChecks();
      expect(
          check.charLengthCheck(
              usernameData["firstName"]!, "TwentyWordsIsTheLimitForAName"),
          equals(false));
    });
    test('Test for a valid name value', () {
      DataChecks check = DataChecks();
      expect(check.charLengthCheck(usernameData["firstName"]!, "Tina"),
          equals(true));
    });
  });

// Test plan: 3.1
  group('Profile creation checks', () {
    test('Test for valid entries', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks(
              "Steve", "Jones", "Username", "working@email", DateTime.now()),
          equals(true));
    });
    test('Test for valid entries at the max entry limit', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks(
              "SteveSteveSteve",
              "JonesJoneJonesJones",
              "SteveJonesJones",
              "workingemailworkingemail@email",
              DateTime.now()),
          equals(true));
    });

    test('A user with numbers in the email', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks("Steve", "Jones", "Steve.J",
              "workingemail123@email", DateTime.now()),
          equals(true));
    });

    test('A user with numbers in the username', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks("Steve", "Jones", "Steve.J123",
              "workingemail@email", DateTime.now()),
          equals(true));
    });

    test('A user with all minimum limit entries', () {
      DataChecks check = DataChecks();
      expect(check.createUserChecks("S", "J", "1", "SJ@Em", DateTime.now()),
          equals(true));
    });

    test('Test for missing first name', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks(
              "", "Jones", "Username", "working@email", DateTime.now()),
          equals(false));
    });
    test('Test for a last name with numbers', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks(
              "Steve", "Jones2", "Username", "working@email", DateTime.now()),
          equals(false));
    });
    test('Test for missing username', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks(
              "Steve", "Jones", "", "working@email", DateTime.now()),
          equals(false));
    });
    test('Test for missing email', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks(
              "Steve", "Jones", "Username", "", DateTime.now()),
          equals(false));
    });

    test('Test for to short of an email', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks(
              "Steve", "Jones", "Username", "@", DateTime.now()),
          equals(false));
    });

    test('Test for a fake email', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks(
              "Steve", "Jones", "Username", "notanemail", DateTime.now()),
          equals(false));
    });

    group('Test: getting and setting user data', () {
      test('Test getting and setting a users firstname', () {
        User user = User();
        user.setFirstName("Tina");
        expect(user.getFirstName(), equals("Tina"));
      });
    });
  });
}
