//Author: Anna
//Parameters:
/*itemName - name of the item to be brought
quanity - amount needed*/
class ShoppingItem {
  String itemName;
  double cost = 0.0;
  DateTime dateAdded = DateTime.now();
  bool completed = false;
  int quanity;
  String whoPaid = '';

  ShoppingItem(this.itemName, this.quanity);
  /*Parameters:
  name - name of user who paid
  money - the cost of the item */
  void setPaid(String name, double money) {
    cost = money;
    whoPaid = name;
  }
}
