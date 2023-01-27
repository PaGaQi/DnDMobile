import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("D&D Monstruary"),
        backgroundColor: Colors.red,
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
    int count = 0;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 214, 224, 165),
          ),
          //PARTIES BUTTON
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
                      backgroundColor: Colors.red,
                      heroTag: "partiesScreen",
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          arguments: aGoals,
                          "/Parties",
                        );
                      },
                      child: const Text(
                        "Parties",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //MONSTER LIST BUTTON
                  SizedBox(
                    height: 100,
                    width: 500,
                    child: FloatingActionButton(
                      backgroundColor: Colors.red,
                      heroTag: "partiesScreen",
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          arguments: aGoals,
                          "/Parties",
                        );
                      },
                      child: const Text(
                        "Monster List",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //CREATE A MONSTER LIST BUTTON
                  SizedBox(
                    height: 100,
                    width: 500,
                    child: FloatingActionButton(
                      backgroundColor: Colors.red,
                      heroTag: "partiesScreen",
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          arguments: aGoals,
                          "/Parties",
                        );
                      },
                      child: const Text(
                        "Create Monster",
                        style: TextStyle(color: Colors.white, fontSize: 20),
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
  }
}
