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
      expect(check.addShoppingItem("2", "Apples"), equals(true));
    });
    test('Test for an item with no value', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItem("", "Apples"), equals(true));
    });

    test('Test for a large quantity and short name', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItem("50", "Apples"), equals(true));
    });

    test('Test for an small quanity and long name', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItem("2", "itemNameWhichIsLong"), equals(true));
    });

    test('Test for an large name and large quantity', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItem("50", "itemNameWhichIsLong"), equals(true));
    });

    // Invalid tests:
    test('Test for an item with a negative value', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItem("-2", "Apples"), equals(false));
    });

    test('Test for an item without a name', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItem("2", ""), equals(false));
    });

    test('Test for an item without a name or value', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItem("", ""), equals(false));
    });

    test('Test for an item with a name thats too long', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItem("3", "aReallyReallyLongNameValue"),
          equals(false));
    });
    test('Test for an item with a to large quanity', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItem("70", "Apple"), equals(false));
    });
  });

  group('Test: adding an item cost', () {
    //valid tests
    test('add a small cost to the item with no decimals', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItemCost("2"), equals(true));
    });
    test('add a cost to the item with only 2 decimals', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItemCost("2.50"), equals(true));
    });

    test('add a cost to the item with only 1 decimals', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItemCost("2.5"), equals(true));
    });

    test('add a cost with the smallest possible price', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItemCost("0.01"), equals(true));
    });

    test('add a cost with the largest possible price', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItemCost("200"), equals(true));
    });
    //Invalid tests
    test('add a cost to the item with 3 decimals', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItemCost("20.945"), equals(false));
    });
    test('add a cost thats too large', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItemCost("200.50"), equals(false));
    });
    test('add a cost of 0', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItemCost("0"), equals(false));
    });
    test('Entering a string value', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItemCost("hello"), equals(false));
    });
    test('Entering a negative cost', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItemCost("-40.50"), equals(false));
    });
  });
}
