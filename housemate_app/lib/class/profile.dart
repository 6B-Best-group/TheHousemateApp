//Author: Anna
//Parameters: None
class User {
  bool loggedIn = false;
  String firstName = "";
  String lastName = "";
  String email = "";
  String username = "";
  DateTime dob = DateTime(2025);
  User();

  // resets values
  void logOut() {
    loggedIn = false;
    firstName = "";
    lastName = "";
    email = "";
    username = "";
  }
  /* Parameters
  fname - first name 
  lname - last name 
  user - username 
  userEmail - user email
  date - date of birth
  */
  void createUser(String fname, String lname, String user, String userEmail,
      DateTime date) {
    loggedIn = true;
    firstName = fname;
    lastName = lname;
    email = userEmail;
    username = user;
    dob = date;
  }

  void setFirstName(fname) {
    firstName = fname;
  }

  void setLastName(lname) {
    lastName = lname;
  }

  void setEmail(userEmail) {
    email = userEmail;
  }

  //Getting basic info for pages
  String getFirstName() {
    return firstName;
  }

  String getLastName() {
    return lastName;
  }

  String getEmail() {
    return email;
  }

  String getUsername() {
    return username;
  }
  // gets date of birth
  String getDOB() {
    return '$dob';
  }
}
