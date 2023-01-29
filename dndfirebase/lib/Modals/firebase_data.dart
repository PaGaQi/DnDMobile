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
