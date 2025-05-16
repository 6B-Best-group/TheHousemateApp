import 'package:flutter_test/flutter_test.dart';
import 'package:housemate_app/inputCheck.dart';

/* 
Test plan: 3.1 house creation
*/
void main() {
  group('House creation test', () {
    //valid tests
    test('Inputting with a 6 digit postcode', () {
      DataChecks check = DataChecks();
      expect(
          check.houseCheck("testHouse", "Flat 2", "Drive street", "Portsmouth",
              "Hampshire", "PO1AAA"),
          equals(true));
    });
    test('Setting a house with all fields', () {
      DataChecks check = DataChecks();
      expect(
          check.houseCheck("testHouse", "Flat 2", "Drive street", "Portsmouth",
              "Hampshire", "PO1 AAA"),
          equals(true));
    });
    test('Setting a house with one address line', () {
      DataChecks check = DataChecks();
      expect(
          check.houseCheck("testHouse", "2 Drive street", "", "Portsmouth",
              "Hampshire", "PO1 AAA"),
          equals(true));
    });
    test('setting a house with two address lines', () {
      DataChecks check = DataChecks();
      expect(
          check.houseCheck("testHouse", "Flat 2", "Drive street", "Portsmouth",
              "Hampshire", "PO1 AAA"),
          equals(true));
    });
    //Invalid tests
    test('No house name', () {
      DataChecks check = DataChecks();
      expect(
          check.houseCheck("testHouse", "", "Drive street", "Portsmouth",
              "Hampshire", "PO1 AAA"),
          equals(false));
    });
    test('City with numbers in', () {
      DataChecks check = DataChecks();
      expect(
          check.houseCheck("testHouse", "Flat 2", "Drive street", "Portsmouth3",
              "Hampshire", "PO1 AAA"),
          equals(false));
    });
    test('House name with more than 30 characters', () {
      DataChecks check = DataChecks();
      expect(
          check.houseCheck("testHouseextrawordswordswordswordswordswords",
              "Flat 2", "Drive street", "Portsmouth", "Hampshire", "PO1 AAA"),
          equals(false));
    });
    test('Postcode having more than 7 characters', () {
      DataChecks check = DataChecks();
      expect(
          check.houseCheck("testHouse", "Flat 2", "Drive street", "Portsmouth",
              "Hampshire", "PO1 AAAAAAA"),
          equals(false));
    });
    test('Only having a second address line', () {
      DataChecks check = DataChecks();
      expect(
          check.houseCheck("testHouse", "", "Drive street", "Portsmouth",
              "Hampshire", "PO1 AAA"),
          equals(false));
    });
  });
}
