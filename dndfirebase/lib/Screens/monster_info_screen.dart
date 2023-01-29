import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:dndfirebase/Modals/firebase_data.dart';

class PartyEditScreen extends StatefulWidget {
  const PartyEditScreen({super.key});

  @override
  State<PartyEditScreen> createState() => _PartyEditScreen();
}

class _PartyEditScreen extends State<PartyEditScreen> {
  late String monsterName;

  late int intLevel;
  late int intPlayers;

  bool isFinished = false;

  late String id;
  late String nameInTag = "Party Name";

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
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 189, 89),
        appBar: AppBar(
          title: const Text("Edit Player"),
          backgroundColor: const Color.fromARGB(255, 255, 22, 22),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //PARTY NAME
            ],
          ),
        ),
      ),
    );
  }
}
