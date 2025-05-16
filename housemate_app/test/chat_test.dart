import 'package:flutter_test/flutter_test.dart';
import 'package:housemate_app/class/profile.dart';
import 'package:housemate_app/inputCheck.dart';

// Testing plan 2.1 user creation
User testUser = User();
void main() {
  group('chat tests', () {
    //valid tests
    test('message uses valid characters', () {
      DataChecks check = DataChecks();
      expect(
          check.chatMessage("hello", testUser, DateTime.now()), equals(true));
    });

    test('message uses one character', () {
      DataChecks check = DataChecks();
      expect(check.chatMessage("h", testUser, DateTime.now()), equals(true));
    });

    test('message max characters', () {
      DataChecks check = DataChecks();
      expect(
          check.chatMessage(
              "hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello",
              testUser,
              DateTime.now()),
          equals(true));
    });
    //Invalid
    test('Empty message test', () {
      DataChecks check = DataChecks();
      expect(check.chatMessage("", testUser, DateTime.now()), equals(false));
    });
    test('message over the max characters', () {
      DataChecks check = DataChecks();
      expect(
          check.chatMessage(
              "hellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohellohello",
              testUser,
              DateTime.now()),
          equals(false));
    });
    test('A non-exsistant user', () {
      DataChecks check = DataChecks();
      expect(check.chatMessage("h", 'notAUser', DateTime.now()), equals(false));
    });
    test('No time stamp', () {
      DataChecks check = DataChecks();
      expect(check.chatMessage("h", testUser, ''), equals(false));
    });
    test('At time in the future', () {
      DataChecks check = DataChecks();
      expect(check.chatMessage("h", testUser, DateTime(2050, DateTime.may, 12)),
          equals(false));
    });
  });
}
