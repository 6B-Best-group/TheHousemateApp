import 'dart:ffi';

class ShoppingItem {
  String itemName;
  Float amount;
  DateTime dateAdded;
  bool completed;
  int quanity; //check this with the database before deployment

  ShoppingItem(
      this.itemName, this.amount, this.dateAdded, this.completed, this.quanity);
}
