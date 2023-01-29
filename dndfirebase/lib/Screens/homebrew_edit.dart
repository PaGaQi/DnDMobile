import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:dndfirebase/Modals/firebase_data.dart';

class HomebrewEditScreen extends StatefulWidget {
  const HomebrewEditScreen({super.key});

  @override
  State<HomebrewEditScreen> createState() => _HomebrewEditScreen();
}

class _HomebrewEditScreen extends State<HomebrewEditScreen> {
  final TextEditingController controllerName = TextEditingController();

  final TextEditingController controllerMeta = TextEditingController();
  final TextEditingController controllerAc = TextEditingController();
  final TextEditingController controllerHp = TextEditingController();
  final TextEditingController controllerSpeed = TextEditingController();

  final TextEditingController controllerStr = TextEditingController();
  final TextEditingController controllerDex = TextEditingController();
  final TextEditingController controllerCon = TextEditingController();
  final TextEditingController controllerInte = TextEditingController();
  final TextEditingController controllerWis = TextEditingController();
  final TextEditingController controllerCha = TextEditingController();

  final TextEditingController controllerSaving = TextEditingController();
  final TextEditingController controllerSenses = TextEditingController();
  final TextEditingController controllerLanguages = TextEditingController();
  final TextEditingController controllerChallenge = TextEditingController();
  final TextEditingController controllerTraits = TextEditingController();
  final TextEditingController controllerActions = TextEditingController();

  late String name;
  late String meta;
  late String ac;
  late String hp;
  late String speed;

  late String str;
  late String dex;
  late String con;
  late String inte;
  late String wis;
  late String cha;

  late String saving;
  late String senses;
  late String languages;
  late String challenge;
  late String traits;
  late String actions;

  bool isFinished = false;

  late String id;
  late String nameInTag = "Monster Name";

  @override
  void dispose() {
    controllerName.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    final number = ModalRoute.of(context)!.settings.arguments;
    if (number != null)
      id = "$number";
    else
      id = '';
    super.didChangeDependencies();
  }

  void _addMonster() {
    if (controllerName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Some information is missing"),
          backgroundColor: Colors.red[900],
        ),
      );
      return;
    }
    final db = FirebaseFirestore.instance;

    //intLevel = int.parse(controllerLevel.text);
    //intPlayers = int.parse(controllerPlayers.text);

    if (id == '') {
      db.collection("/homebrew").add({
        'name': controllerName.text,
        'meta': meta,
        'armor class': ac,
        'hit points': hp,
        'speed': speed,
        'STR': str,
        'DEX': dex,
        'CON': con,
        'INT': inte,
        'WIS': wis,
        'CHA': cha,
        'saving': saving,
        'senses': senses,
        'languages': languages,
        'challenege': challenge,
        'traits': traits,
        'actions': actions,
      });
    } else {
      db.doc("/homebrew/$id").set({
        'name': controllerName.text,
        'meta': meta,
        'armor class': ac,
        'hit points': hp,
        'speed': speed,
        'STR': str,
        'DEX': dex,
        'CON': con,
        'INT': inte,
        'WIS': wis,
        'CHA': cha,
        'saving': saving,
        'senses': senses,
        'languages': languages,
        'challenege': challenge,
        'traits': traits,
        'actions': actions,
      });
    }

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
          title: const Text("Edit Monster"),
          backgroundColor: const Color.fromARGB(255, 255, 22, 22),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //PARTY NAME
                TextField(
                  autofocus: true,
                  controller: controllerName,
                  decoration: InputDecoration(
                    label: Text(nameInTag),
                  ),
                ),
                //PARTY LEVEL
                TextField(
                  controller: controllerMeta,
                  decoration: const InputDecoration(
                    label: Text(
                      "Monster type & alignment",
                    ),
                  ),
                ),
                //PARTY MEMBERS
                TextField(
                  controller: controllerAc,
                  decoration: const InputDecoration(
                    label: Text("Armor class"),
                  ),
                ),
                TextField(
                  controller: controllerHp,
                  decoration: const InputDecoration(
                    label: Text("Hit Points"),
                  ),
                ),

                TextField(
                  controller: controllerSpeed,
                  decoration: const InputDecoration(
                    label: Text("Speed"),
                  ),
                ),
                TextField(
                  controller: controllerStr,
                  decoration: const InputDecoration(
                    label: Text("STR"),
                  ),
                ),
                TextField(
                  controller: controllerDex,
                  decoration: const InputDecoration(
                    label: Text("DEX"),
                  ),
                ),
                TextField(
                  controller: controllerCon,
                  decoration: const InputDecoration(
                    label: Text("CON"),
                  ),
                ),
                TextField(
                  controller: controllerInte,
                  decoration: const InputDecoration(
                    label: Text("INT"),
                  ),
                ),
                TextField(
                  controller: controllerWis,
                  decoration: const InputDecoration(
                    label: Text("WIS"),
                  ),
                ),
                TextField(
                  controller: controllerCha,
                  decoration: const InputDecoration(
                    label: Text("CHA"),
                  ),
                ),
                TextField(
                  controller: controllerSaving,
                  decoration: const InputDecoration(
                    label: Text("Saving"),
                  ),
                ),
                TextField(
                  controller: controllerSenses,
                  decoration: const InputDecoration(
                    label: Text("Senses"),
                  ),
                ),
                TextField(
                  controller: controllerLanguages,
                  decoration: const InputDecoration(
                    label: Text("Languages"),
                  ),
                ),
                TextField(
                  controller: controllerChallenge,
                  decoration: const InputDecoration(
                    label: Text("Challenges"),
                  ),
                ),
                TextField(
                  controller: controllerTraits,
                  decoration: const InputDecoration(
                    label: Text("Traits"),
                  ),
                ),
                TextField(
                  controller: controllerActions,
                  decoration: const InputDecoration(
                    label: Text("Actions"),
                  ),
                ),

                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addMonster,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 255, 22, 22)),
                  ),
                  child: const Text("Create"),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
