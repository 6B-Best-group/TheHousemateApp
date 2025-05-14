


import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:housemate_app/class/general_chore_rota.dart';
import 'package:housemate_app/class/weekly_chore_rota.dart';
import 'package:housemate_app/utils/database/data-models.dart';

class Database {
    static final Database _instance = Database._internal();
    factory Database() => _instance;
    Database._internal(); 
    // this makes it so it always loads the same data no matter where its called

    List<User> users = [];
    List<House> house = [];
    List<Message> message = [];
    List<ShoppingList> shoppingList = [];
    List<Chore> chore = [];
    List<GeneralChoreRota> generalChoreRotaList = [];
    List<WeeklyChoreRota> weeklyChoreRotaList = [];
    // the various world wide lists that store data

    int currentUser = 0;

    
  // all the load functions for the initial data
   Future<void> loadUsers() async {
    final userRaw = await rootBundle.loadString('data/user-data.json');
    final userData = json.decode(userRaw);
    users = (userData as List).map((item) => User.fromJson(item)).toList();
   }

   Future<void> loadHouse() async {
    final houseRaw = await rootBundle.loadString('data/house-data.json');
    final houseData = json.decode(houseRaw);
    house = (houseData as List).map((item) => House.fromJson(item)).toList(); 
   }

   Future<void> loadMessage() async {
    final messageRaw = await rootBundle.loadString('data/messages-data.json');
    final messageData = json.decode(messageRaw);
    message = (messageData as List).map((item) => Message.fromJson(item)).toList();
   }

   Future<void> loadShoppingList() async {
    final listRaw = await rootBundle.loadString('data/shopping-list-data.json');
    final listData = json.decode(listRaw);
    shoppingList = (listData as List).map((item) => ShoppingList.fromJson(item)).toList();
   }

   Future<void> loadChore() async {
    final choreRaw = await rootBundle.loadString('data/chores-data.json');
    final choreData = json.decode(choreRaw);
    chore = (choreData as List).map((item) => Chore.fromJson(item)).toList();
   }  
}
