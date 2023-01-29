//import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Parties {
  String id;
  String name;
  int lvl;
  int players;
  String image;

  Parties.fromFirestrore(DocumentSnapshot<Map<String, dynamic>> docSnap)
      : id = docSnap.id,
        name = docSnap['name'],
        lvl = docSnap['lvl'],
        players = docSnap['players'],
        image = docSnap['image'];
}

Stream<List<Parties>> dbGetChats() async* {
  final db = FirebaseFirestore.instance;
  final query = db.collection("/Parties").orderBy("lvl", descending: true);
  await for (final qsnap in query.snapshots()) {
    List<Parties> parties = [];
    for (final doc in qsnap.docs) {
      parties.add(Parties.fromFirestrore(doc));
    }
    yield parties;
  }
}

class Homebrew {
  String id;

  String name;
  String meta;
  String ac;
  String hp;
  String speed;

  int str;
  int dex;
  int con;
  int inte;
  int wis;
  int cha;

  String saving;
  String senses;
  String languages;
  String challenge;
  String traits;
  String actions;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Homebrew.fromFirestrore(DocumentSnapshot<Map<String, dynamic>> docSnap)
      : id = docSnap.id,
        name = docSnap['name'],
        meta = docSnap['meta'],
        ac = docSnap['armor class'],
        hp = docSnap['hit points'],
        speed = docSnap['speed'],
        str = docSnap['STR'],
        dex = docSnap['DEX'],
        con = docSnap['CON'],
        inte = docSnap['INT'],
        wis = docSnap['WIS'],
        cha = docSnap['CHA'],
        saving = docSnap['saving throws'],
        senses = docSnap['senses'],
        languages = docSnap['languages'],
        challenge = docSnap['challenge'],
        traits = docSnap['traits'],
        actions = docSnap['actions'];
}

Stream<List<Homebrew>> dbGetHomebrew() async* {
  final db = FirebaseFirestore.instance;
  final query = db.collection("/homebrew").orderBy("name", descending: true);
  await for (final qsnap in query.snapshots()) {
    List<Homebrew> homebrew = [];
    for (final doc in qsnap.docs) {
      homebrew.add(Homebrew.fromFirestrore(doc));
    }
    yield homebrew;
  }
}

class Monsters {
  String id;

  String name;
  String meta;
  String armorClass;
  String hitPoint;
  String speed;
  String str;
  // String str_mod;
  String dex;
  //String dex_mod;
  String con;
  //String con_mod;
  String inte;
  //String inte_mod;
  String wis;
  //String wis_mod;
  String cha;
  //String cha_mod;
  String saving_throws;
  String skills;
  String senses;
  String languages;
  String challenge;
  String traits;
  String actions;
  //String legendary_actions;
  String image_url;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Monsters.fromFirestrore(DocumentSnapshot<Map<String, dynamic>> docSnap)
      : id = docSnap.id,
        name = docSnap['name'],
        meta = docSnap['meta'],
        armorClass = docSnap['Armor Class'],
        hitPoint = docSnap['Hit Points'],
        speed = docSnap['speed'],
        str = docSnap['STR'],
        //str = docSnap['STR'],
        dex = docSnap['DEX'],
        //dex = docSnap['DEX'],
        con = docSnap['CON'],
        //con = docSnap['CON'],
        inte = docSnap['INT'],
        //inte = docSnap['INT'],
        wis = docSnap['WIS'],
        //wis = docSnap['WIS'],
        cha = docSnap['CHA'],
        // cha = docSnap['CHA'],
        saving_throws = docSnap['Saving Throws'],
        skills = docSnap['Skills'],
        senses = docSnap['Senses'],
        languages = docSnap['Languages'],
        challenge = docSnap['Challenge'],
        traits = docSnap['Traits'],
        actions = docSnap['Actions'],
        image_url = docSnap['img_url'];
}

Stream<List<Monsters>> dbGetMonsters() async* {
  final db = FirebaseFirestore.instance;
  final query = db.collection("/monstersDnD").orderBy("name", descending: true);
  await for (final qsnap in query.snapshots()) {
    List<Monsters> monsters = [];
    for (final doc in qsnap.docs) {
      monsters.add(Monsters.fromFirestrore(doc));
    }
    yield monsters;
  }
}
