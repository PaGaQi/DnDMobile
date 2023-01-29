import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dndfirebase/Modals/firebase_data.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("D&D Monstruary",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 22, 22),
        toolbarHeight: 130,
      ),
      body: MainScreenData(),
    );
  }
}

class MainScreenData extends StatelessWidget {
  int aGoals = 0;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return StreamBuilder(
        stream: dbGetMonsters(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.red));
          }
          List<Monsters> currentMonster = snapshot.data!;
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  color: Color.fromARGB(255, 255, 189, 89),
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        //PARTIES BUTTON
                        SizedBox(
                          height: 100,
                          width: 500,
                          child: FloatingActionButton(
                            backgroundColor: Color.fromARGB(255, 255, 22, 22),
                            heroTag: "partiesScreen",
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                arguments: aGoals,
                                "/Parties",
                              );
                            },
                            child: const Text(
                              "Parties",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //MONSTER LIST BUTTON
                        SizedBox(
                          height: 100,
                          width: 500,
                          child: FloatingActionButton(
                            backgroundColor: Color.fromARGB(255, 255, 22, 22),
                            heroTag: "monsterScreen",
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                arguments: aGoals,
                                "/MonsterList",
                              );
                            },
                            child: const Text(
                              "Monster List",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //CREATE A MONSTER BUTTON
                        SizedBox(
                          height: 100,
                          width: 500,
                          child: FloatingActionButton(
                            backgroundColor: Color.fromARGB(255, 255, 22, 22),
                            heroTag: "partiesScreen",
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                arguments: aGoals,
                                "/Parties",
                              );
                            },
                            child: const Text(
                              "Create Monster",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 150,
                          width: 200,
                          child: FloatingActionButton(
                            backgroundColor: Color.fromARGB(255, 255, 22, 22),
                            heroTag: "partiesScreen",
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                arguments: "0",
                                "/MonsterInfo",
                              );
                            },
                            child: const Text(
                              "Battle",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
