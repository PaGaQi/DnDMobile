import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:dndfirebase/Modals/firebase_data.dart';

class MonsterInfoScreen extends StatefulWidget {
  const MonsterInfoScreen({super.key});

  @override
  State<MonsterInfoScreen> createState() => _MonsterInfoScreen();
}

class _MonsterInfoScreen extends State<MonsterInfoScreen> {
  late int intLevel;
  late int intPlayers;
  late String monsterName = "Monster";
  late String monsterMeta = 'Meta';
  bool isFinished = false;

  late String id;

  @override
  void didChangeDependencies() {
    final number = ModalRoute.of(context)!.settings.arguments;
    id = "$number";

    super.didChangeDependencies();
  }

  void _addParty() {
    final db = FirebaseFirestore.instance;

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    didChangeDependencies();

    return StreamBuilder(
        stream: db.doc("homebrew/$id").snapshots(),
        builder: (
          BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot,
        ) {
          if (snapshot.hasError) {
            return ErrorWidget(snapshot.error.toString());
          }
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final docSnap = snapshot.data!;
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 189, 89),
            appBar: AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${docSnap['name']}",
                    textAlign: TextAlign.left,
                  ),
                  Text("${docSnap['meta']}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left),
                ],
              ),
              backgroundColor: const Color.fromARGB(255, 255, 22, 22),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ),
          );
        });
  }
}
