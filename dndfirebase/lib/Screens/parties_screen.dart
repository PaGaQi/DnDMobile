// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PartiesScreen extends StatelessWidget {
  const PartiesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parties"),
        backgroundColor: Color.fromARGB(255, 255, 22, 22),
      ),
      body: _PartiesList(),
      backgroundColor: Color.fromARGB(255, 255, 189, 89),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 255, 22, 22),
        onPressed: () => Navigator.of(context).pushNamed('/PartyEdit'),
      ),
    );
  }
}

class _PartiesList extends StatelessWidget {
  late int lvlInt;
  late int playersInt;

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return StreamBuilder(
      stream: db.collection("/Parties").snapshots(),
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      ) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator(
            color: Color.fromARGB(255, 255, 22, 22),
          ));
        }
        final querySnap = snapshot.data!;
        final docs = querySnap.docs;

        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final currentParty = docs[index];
            lvlInt = currentParty["lvl"];
            playersInt = currentParty["players"];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                  leading: const Icon(Icons.people),
                  title: Text(
                    currentParty['name'],
                    style: const TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text("LVL $lvlInt"),
                  tileColor: Color.fromARGB(255, 255, 22, 22),
                  trailing: Text(
                    "$playersInt PCs",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 189, 89),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onTap: (() => Navigator.of(context)
                      .pushNamed('/PartyEdit', arguments: currentParty.id)),
                  onLongPress: () {
                    final db = FirebaseFirestore.instance;
                    DocumentReference doc =
                        db.collection("/Parties").doc(currentParty.id);
                    doc.delete();
                  }),
            );
          },
        );
      },
    );
  }
}
