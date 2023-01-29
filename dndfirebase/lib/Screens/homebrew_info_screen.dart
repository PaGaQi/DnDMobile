import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:dndfirebase/Modals/firebase_data.dart';

class HomebrewInfoScreen extends StatefulWidget {
  const HomebrewInfoScreen({super.key});

  @override
  State<HomebrewInfoScreen> createState() => _HomebrewInfoScreen();
}

class _HomebrewInfoScreen extends State<HomebrewInfoScreen> {
  late String id;
  String homebrewImg =
      'https://www.dndbeyond.com/content/1-0-2372-0/skins/waterdeep/images/icons/monsters/aberration.jpg';

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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${docSnap['name']}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      Text("${docSnap['meta']}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.left),
                    ],
                  ),
                  FloatingActionButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed('/HomebrewEdit', arguments: docSnap.id),
                    child: Icon(Icons.edit),
                    backgroundColor: Color.fromARGB(255, 255, 22, 22),
                    elevation: 0,
                  )
                ],
              ),
              backgroundColor: const Color.fromARGB(255, 255, 22, 22),
              toolbarHeight: 130,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Container(
                      color: Colors.red,
                      height: 250,
                      width: 250,
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.network(homebrewImg)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.red,
                    height: 5,
                    width: 50,
                  ),
                  //ARMOR CLASS--------------------------------------------------------------------
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //const SizedBox(width: 50),
                          const Text(
                            "Armor Class: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "  ${docSnap['armor class']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      //HIT POINTS--------------------------------------------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Hit Points: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "  ${docSnap['hit points']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      //SPEED--------------------------------------------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Speed: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "  ${docSnap['speed']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.red,
                    height: 5,
                    width: 50,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //STR----------------------------------------------------------
                      Column(
                        children: [
                          const Text(
                            "STR",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${docSnap['STR']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      //DEX----------------------------------------------------------
                      Column(
                        children: [
                          const Text(
                            "DEX",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${docSnap['DEX']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      //CON----------------------------------------------------------
                      Column(
                        children: [
                          const Text(
                            "CON",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${docSnap['CON']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      //INT----------------------------------------------------------
                      Column(
                        children: [
                          const Text(
                            "INT",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${docSnap['INT']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      //WIS----------------------------------------------------------
                      Column(
                        children: [
                          const Text(
                            "WIS",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${docSnap['WIS']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      //CHA----------------------------------------------------------
                      Column(
                        children: [
                          const Text(
                            "CHA",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${docSnap['CHA']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.red,
                    height: 5,
                    width: 50,
                  ),
                  const SizedBox(height: 5),
                  //SAVING THROWS--------------------------------------------------------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //const SizedBox(width: 50),
                          const Text(
                            "Saving Throws: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "  ${docSnap['saving throws']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      //SENSES--------------------------------------------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Senses: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "  ${docSnap['senses']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      //LANGUAGES--------------------------------------------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Languages: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "  ${docSnap['languages']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      //CHALLENGE--------------------------------------------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Challenge: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "  ${docSnap['challenge']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.red,
                    height: 5,
                    width: 500,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          );
        });
  }
}
