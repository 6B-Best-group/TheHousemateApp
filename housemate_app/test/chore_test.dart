import 'package:flutter_test/flutter_test.dart';
import 'package:housemate_app/class/profile.dart';
import 'package:housemate_app/inputCheck.dart';

User testUser = User();
User testUser2 = User();
void main() {
  group('chore creation tests', () {
    //valid tests
    test('Maxium chore name lengths', () {
      DataChecks check = DataChecks();
      expect(check.chore("clean sink cleansink", [testUser, testUser2]),
          equals(true));
    });
    test('Miniuim chore name length', () {
      DataChecks check = DataChecks();
      expect(check.chore("c", [testUser, testUser2]), equals(true));
    });
    test('One user assigned to the chore', () {
      DataChecks check = DataChecks();
      expect(check.chore("chore ", [testUser]), equals(true));
    });
    test('Two users assigned to the chore', () {
      DataChecks check = DataChecks();
      expect(check.chore("chore ", [testUser, testUser2]), equals(true));
    });
    //Invalid
     test('No chore', () {
      DataChecks check = DataChecks();
      expect(check.chore("", [testUser, testUser2]), equals(false));
    });
    test('Over the chore character name limit', () {
      DataChecks check = DataChecks();
      expect(check.chore("looooooooooooooooooooooooooooooooooooong chore", [testUser, testUser2]), equals(false));
    });
    test('No user assigned to the chore', () {
      DataChecks check = DataChecks();
      expect(check.chore("chore", []), equals(false));
    });
    test('The user assigned is not real', () {
      DataChecks check = DataChecks();
      expect(check.chore("chore", ["fake user"]), equals(false));
    });
    test('The user assigned is not real', () {
      DataChecks check = DataChecks();
      expect(check.chore("chore", ["fake user"]), equals(false));
    });
  });
}
