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
  late String id;

  @override
  void didChangeDependencies() {
    final number = ModalRoute.of(context)!.settings.arguments;
    id = "$number";

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    didChangeDependencies();

    return StreamBuilder(
        stream: db.doc("monstersDnD/$id").snapshots(),
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
                          child: Image.network(docSnap['img_url'])),
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
                          const Text(
                            "Armor Class: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            " ${docSnap['Armor Class']}",
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
                            "Health Points: ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            " ${docSnap['Hit Points']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 5),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //SPEED--------------------------------------------------------------------
                      const Text(
                        "Speed: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "  ${docSnap['Speed']}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      //SENSES--------------------------------------------------------------------
                      const Text(
                        "Senses: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "  ${docSnap['Senses']}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 5),
                      //LANGUAGES--------------------------------------------------------------------
                      const Text(
                        "Languages: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "  ${docSnap['Languages']}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 5),
                      //CHALLENGE--------------------------------------------------------------------

                      const Text(
                        "Challenge: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "  ${docSnap['Challenge']}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
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
