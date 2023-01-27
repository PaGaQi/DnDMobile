import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Parties {
  String id;
  String name;
  Int lvl;
  Int players;
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
