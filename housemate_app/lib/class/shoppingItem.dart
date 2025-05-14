class ShoppingItem {
  String itemName;
  double cost = 0.0;
  DateTime dateAdded = DateTime.now();
  bool completed = false;
  int quanity; //check this with the database before deployment
  String whoPaid = '';

  ShoppingItem(this.itemName, this.quanity);

  void setPaid(String name, double money) {
    cost = money;
    whoPaid = name;
  }
}
