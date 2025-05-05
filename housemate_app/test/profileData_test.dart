import 'package:flutter_test/flutter_test.dart';
import 'package:housemate_app/inputCheck.dart';
import 'package:housemate_app/class/profile.dart';

void main() {
  group('Test first name validity', () {
    test('Test for an empty value', () {
      DataChecks check = DataChecks();
      expect(check.charLengthCheck("firstName", ""), equals(false));
    });
    test('Test for a value thats too long', () {
      DataChecks check = DataChecks();
      expect(
          check.charLengthCheck("firstName", "TwentyWordsIsTheLimitForAName"),
          equals(false));
    });
    test('Test for a valid name value', () {
      DataChecks check = DataChecks();
      expect(check.charLengthCheck("firstName", "Tina"), equals(true));
    });
  });

  group('Profile creation checks', () {
    test('Test for a real user', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks(
              "Steve", "Jones", "Username", "working@email", DateTime.now()),
          equals(true));
    });
    test('Test for missing first name', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks(
              "", "Jones", "Username", "working@email", DateTime.now()),
          equals(false));
    });
    test('Test for missing last name', () {
      DataChecks check = DataChecks();
      expect(
          check.createUserChecks(
              "Steve", "", "Username", "working@email", DateTime.now()),
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
