class House {
  String housename = "";
  String address1 = "";
  String address2 = "";
  String city = "";
  String county = "";
  String postcode = "";
  House();

  void createHouse(name, add1, add2, cit, cont, code) {
    housename = name;
    address1 = add1;
    address2 = add2;
    city = cit;
    county = cont;
    postcode = code;
  }
}
