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

  String name = "Custom Monster";
  String meta = "--";
  String ac = "1";
  String hp = "1";
  String speed = "1 ft";

  int str = 0;
  int dex = 0;
  int con = 0;
  int inte = 0;
  int wis = 0;
  int cha = 0;

  late String saving = "--";
  late String senses = "--";
  late String languages = "--";
  late String challenge = "1";

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
    if (number != 0)
      id = "$number";
    else
      id = '';
    super.didChangeDependencies();
  }

  void _addMonster() {
    if (controllerName.text.isEmpty || controllerMeta.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("'Name' and 'Meta' Fields are Mandatory"),
          backgroundColor: Colors.red[900],
        ),
      );
      return;
    }
    final db = FirebaseFirestore.instance;

    name = controllerName.text;
    meta = controllerMeta.text;
    if (controllerAc.text.isNotEmpty) ac = controllerAc.text;
    if (controllerHp.text.isNotEmpty) hp = controllerHp.text;
    if (controllerSpeed.text.isNotEmpty) speed = controllerSpeed.text;

    if (controllerStr.text.isNotEmpty) str = int.parse(controllerStr.text);
    if (controllerDex.text.isNotEmpty) dex = int.parse(controllerDex.text);
    if (controllerCon.text.isNotEmpty) con = int.parse(controllerCon.text);
    if (controllerInte.text.isNotEmpty) inte = int.parse(controllerInte.text);
    if (controllerWis.text.isNotEmpty) wis = int.parse(controllerWis.text);
    if (controllerCha.text.isNotEmpty) cha = int.parse(controllerCha.text);

    if (controllerSaving.text.isNotEmpty) saving = controllerSaving.text;
    if (controllerSenses.text.isNotEmpty) senses = controllerSenses.text;
    if (controllerLanguages.text.isNotEmpty)
      languages = controllerLanguages.text;
    if (controllerChallenge.text.isNotEmpty)
      challenge = controllerChallenge.text;

    if (id == '') {
      db.collection("/homebrew").add({
        'name': name,
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
        'saving throws': saving,
        'senses': senses,
        'languages': languages,
        'challenge': challenge,
      });
    } else {
      db.doc("/homebrew/$id").set({
        'name': name,
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
        'saving throws': saving,
        'senses': senses,
        'languages': languages,
        'challenge': challenge,
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
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
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
                //META
                TextField(
                  controller: controllerMeta,
                  decoration: const InputDecoration(
                    label: Text(
                      "Monster Type & Alignment",
                    ),
                  ),
                ),
                //AC
                TextField(
                  controller: controllerAc,
                  decoration: const InputDecoration(
                    label: Text("Armor Class"),
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
                    label: Text("Saving Throws"),
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
