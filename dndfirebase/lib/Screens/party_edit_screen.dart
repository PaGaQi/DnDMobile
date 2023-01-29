import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class PartyEditScreen extends StatefulWidget {
  const PartyEditScreen({super.key});

  @override
  State<PartyEditScreen> createState() => _PartyEditScreen();
}

class _PartyEditScreen extends State<PartyEditScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerB = TextEditingController();

  final TextEditingController controllerLevel = TextEditingController();
  final TextEditingController controllerPlayers = TextEditingController();

  late int intLevel;
  late int intPlayers;

  bool isFinished = false;

  late String id;
  late String nameInTag = "Party Name";

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

  void _addParty() {
    if (controllerName.text.isEmpty ||
        controllerPlayers.text.isEmpty ||
        controllerLevel.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Some information is missing"),
          backgroundColor: Colors.red[900],
        ),
      );
      return;
    }
    final db = FirebaseFirestore.instance;

    intLevel = int.parse(controllerLevel.text);
    intPlayers = int.parse(controllerPlayers.text);

    if (id == '') {
      db.collection("/Parties").add({
        'name': controllerName.text,
        'lvl': intLevel,
        'players': intPlayers,
      });
    } else {
      db.doc("/Parties/$id").set({
        'name': controllerName.text,
        'lvl': intLevel,
        'players': intPlayers,
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
          title: const Text("Edit Player"),
          backgroundColor: const Color.fromARGB(255, 255, 22, 22),
        ),
        body: Padding(
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
                controller: controllerLevel,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  label: Text(
                    "Party Level",
                  ),
                ),
              ),
              //PARTY MEMBERS
              TextField(
                controller: controllerPlayers,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  label: Text("Party Members"),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addParty,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 22, 22)),
                ),
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
