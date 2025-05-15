
/*
this file defines the data types for all of the madjor datatypes, each
of the classes define a .fromJson function that converts a corresponding
Json file into a list of the according datatypes
*/


class House {
  final int houseId;
  final String houseNickname;
  final String houseAddress;
  final String city;
  final String country;
  final String postcode;
  final String binCode;

  House({
    required this.houseId,
    required this.houseNickname,
    required this.houseAddress,
    required this.city,
    required this.country,
    required this.postcode,
    required this.binCode,
  });

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      houseId: json['house_id'] as int,
      houseNickname: json['house_nickname'] as String,
      houseAddress: json['house_address'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      postcode: json['postcode'] as String,
      binCode: json['bin_code'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'house_id': houseId,
      'house_nickname': houseNickname,
      'house_address': houseAddress,
      'city': city,
      'country': country,
      'postcode': postcode,
      'bin_code': binCode,
    };
  }
}

class User {
  final int userId;
  final int houseId;
  final String firstName;
  final String lastName;
  final String username;
  final String password;
  double spending = 0.00;
  final String email;
  final DateTime dateOfBirth;

  User({
    required this.userId,
    required this.houseId,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password,
    required this.spending,
    required this.email,
    required this.dateOfBirth,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'] as int,
      houseId: json['house_id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      spending: json['spending'] as double,
      email: json['email'] as String,
      dateOfBirth: DateTime.parse(json['date_of_birth'] as String)
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'house_id': houseId,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'password': password,
      'spending': spending,
      'email': email,
      'date_of_birth': dateOfBirth.toIso8601String(),
    };
  }
}

class Message {
  final int messageId;
  final int houseId;
  final int userId;
  final String messageText;
  final DateTime messageDate;

  Message({
    required this.messageId,
    required this.houseId,
    required this.userId,
    required this.messageText,
    required this.messageDate,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: json['message_id'] as int,
      houseId: json['house_id'] as int,
      userId: json['user_id'] as int,
      messageText: json['message_text'] as String,
      messageDate: DateTime.parse(json['message_date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_id': messageId,
      'house_id': houseId,
      'user_id': userId,
      'message_text': messageText,
      'message_date': messageDate.toIso8601String(),
    };
  }
}

class ShoppingList {
  final int itemId;
  final int houseId;
  final String itemName;
  final int itemQuantity;
  double itemPrice;
  final bool itemBrought;
  final int userId;

  ShoppingList({
    required this.itemId,
    required this.houseId,
    required this.itemName,
    required this.itemQuantity,
    required this.itemPrice,
    required this.itemBrought,
    required this.userId,
  });

  factory ShoppingList.fromJson(Map<String, dynamic> json) {
    return ShoppingList(
      itemId: json['item_id'] as int,
      houseId: json['house_id'] as int,
      itemName: json['item_name'] as String,
      itemQuantity: json['item_quantity'] as int,
      itemPrice: (json['item_price'] as num).toDouble(),
      itemBrought: json['item_bought'] as bool,
      userId: json['user_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item_id': itemId,
      'house_id': houseId,
      'item_name': itemName,
      'item_quantity': itemQuantity,
      'item_price': itemPrice,
      'item_bought': itemBrought,
      'user_id': userId,
    };
  }
}

class Chore {
  final int choreId;
  final int userId;
  final String choreName;
  final String choreDescription;
  final DateTime dueDate;
  final DateTime assignedDate;
  bool completed;

  Chore({
    required this.choreId,
    required this.userId,
    required this.choreName,
    required this.choreDescription,
    required this.dueDate,
    required this.assignedDate,
    required this.completed,
  });


  factory Chore.fromJson(Map<String, dynamic> json) {
    return Chore(
      choreId: json['chore_id'] as int,
      userId: json['user_id'] as int,
      choreName: json['chore_name'] as String,
      choreDescription: json['chore_description'] as String,
      dueDate: DateTime.parse(json['due_date'] as String),       
      assignedDate: DateTime.parse(json['assigned_date'] as String), 
      completed: json['completed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chore_id': choreId,
      'user_id': userId,
      'chore_name': choreName,
      'chore_description': choreDescription,
      'due_date': dueDate.toIso8601String(),         
      'assigned_date': assignedDate.toIso8601String(), 
      'completed': completed,
    };
  }
}