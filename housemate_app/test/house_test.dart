import 'package:flutter_test/flutter_test.dart';
import 'package:housemate_app/inputCheck.dart';

void main() {
  group('House creation test', () {
    //valid tests
    test('Test for an small item and value', () {
      DataChecks check = DataChecks();
      expect(check.addShoppingItem("2", "Apples"), equals(true));
    });
  });
}
