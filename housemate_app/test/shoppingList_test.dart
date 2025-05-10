import 'package:flutter_test/flutter_test.dart';
import 'package:housemate_app/inputCheck.dart';

/* 
Test file: shopping list 
*/
void main() {
  // Testing plan unit: Being able to add an item to the shopping list
  group('Test item creation', () {

    //valid tests
    test('Test for an small item and value', () {
      DataChecks check = DataChecks();
      expect(check.itemValid("2", "Apples"), equals(true));
    });
    test('Test for an item with no value', () {
      DataChecks check = DataChecks();
      expect(check.itemValid("", "Apples"), equals(true));
    });

    test('Test for a large quantity and short name', () {
      DataChecks check = DataChecks();
      expect(check.itemValid("50", "Apples"), equals(true));
    });

    test('Test for an small quanity and long name', () {
      DataChecks check = DataChecks();
      expect(check.itemValid("2", "itemNameWhichIsLong"), equals(true));
    });

    test('Test for an large name and large quantity', () {
      DataChecks check = DataChecks();
      expect(check.itemValid("50", "itemNameWhichIsLong"), equals(true));
    });

    // Invalid tests:
    test('Test for an item with a negative value', () {
      DataChecks check = DataChecks();
      expect(check.itemValid("-2", "Apples"), equals(false));
    });

    test('Test for an item without a name', () {
      DataChecks check = DataChecks();
      expect(check.itemValid("2", ""), equals(false));
    });

    test('Test for an item without a name or value', () {
      DataChecks check = DataChecks();
      expect(check.itemValid("", ""), equals(false));
    });

    test('Test for an item with a name thats too long', () {
      DataChecks check = DataChecks();
      expect(check.itemValid("3", "aReallyReallyLongNameValue"), equals(false));
    });
    test('Test for an item with a to large quanity', () {
      DataChecks check = DataChecks();
      expect(check.itemValid("70", "Apple"), equals(false));
    });
  });
}
