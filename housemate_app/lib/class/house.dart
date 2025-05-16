//Author: Anna
//Parameters: None
class House {
  String housename = "";
  String address1 = "";
  String address2 = "";
  String city = "";
  String county = "";
  String postcode = "";
  House();

  //Parameters
  /*name - house username
   add1 - address line 1 
   add2 - address line 2 
   cit - city 
   cont - county 
   code - postcode */
  void createHouse(name, add1, add2, cit, cont, code) {
    housename = name;
    address1 = add1;
    address2 = add2;
    city = cit;
    county = cont;
    postcode = code;
  }
}
