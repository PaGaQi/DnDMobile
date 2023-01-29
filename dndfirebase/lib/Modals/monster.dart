import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class User {
  String name;
  String meta;
  String armorClass;
  int hitPoint;
  int speed;
  int str;
  int str_mod;
  int dex;
  int dex_mod;
  int con;
  int con_mod;
  int inte;
  int inte_mod;
  int wis;
  int wis_mod;
  int cha;
  int cha_mod;
  String saving_throws;
  String skills;
  String senses;
  String languages;
  int challenge;
  String traits;
  String actions;
  String legendary_actions;
  String image_url;

  User({
    required this.name,
    required this.meta,
    required this.armorClass,
    required this.hitPoint,
    required this.speed,
    required this.str,
    required this.str_mod,
    required this.dex,
    required this.dex_mod,
    required this.con,
    required this.con_mod,
    required this.inte,
    required this.inte_mod,
    required this.wis,
    required this.wis_mod,
    required this.cha,
    required this.cha_mod,
    required this.saving_throws,
    required this.skills,
    required this.senses,
    required this.languages,
    required this.challenge,
    required this.traits,
    required this.actions,
    required this.legendary_actions,
    required this.image_url,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = "${json["name"]} ${json["name"]}",
        meta = json["meta"],
        armorClass = json["Armor Class"],
        hitPoint = json["Hit Points"],
        speed = json["Speed"],
        str = json["STR"],
        str_mod = json["STR_mod"],
        dex = json["DEX"],
        dex_mod = json["DEX_mod"],
        con = json["CON"],
        con_mod = json["CON_mod"],
        inte = json["INT"],
        inte_mod = json["INT_mod"],
        wis = json["WIS"],
        wis_mod = json["WIS_mod"],
        cha = json["CHA"],
        cha_mod = json["CHA_mod"],
        saving_throws = json["Saving Throws"],
        skills = json["Skills"],
        senses = json["Senses"],
        languages = json["Languages"],
        challenge = json["Challenge"],
        traits = json["Traits"],
        actions = json["Actions"],
        legendary_actions = json["Legendary Actions"],
        image_url = json["img_url"];
}

Future<List<User>> loadUserList([int numUsers = 50]) async {
  final uri = Uri.parse(
      "https://gist.githubusercontent.com/tkfu/9819e4ac6d529e225e9fc58b358c3479/raw/d4df8804c25a662efc42936db60cfbc0a5b19db8/srd_5e_monsters.json");
  //final response = await http.get(uri);
  final response = await rootBundle.loadString('assets/srd_5e_monsters.json');
  final json = await jsonDecode(response);
  //final json = jsonDecode(response.body);
  final jsonUserList = json["results"];
  List<User> userList = [];
  for (final jsonUser in jsonUserList) {
    userList.add(User.fromJson(jsonUser));
  }
  return userList;
}
