import 'package:cloud_firestore/cloud_firestore.dart';
/*import 'package:flutter/material.dart';

class MonsterList extends StatelessWidget {
  const MonsterList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int aGoals = 0;
    int counter = 0;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      //PARTIES BUTTON
                      SizedBox(
                        height: 15,
                        width: 50,
                        child: FloatingActionButton(
                          backgroundColor: Color.fromARGB(255, 255, 22, 22),
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
                            "List",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      //MONSTER LIST BUTTON
                      SizedBox(
                        height: 15,
                        width: 50,
                        child: FloatingActionButton(
                          backgroundColor: Color.fromARGB(255, 255, 22, 22),
                          heroTag: "monsterScreen",
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              arguments: aGoals,
                              "/MonsterList",
                            );
                          },
                          child: const Text(
                            "Favourites",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      //CREATE A MONSTER BUTTON
                      SizedBox(
                        height: 15,
                        width: 50,
                        child: FloatingActionButton(
                          backgroundColor: Color.fromARGB(255, 255, 22, 22),
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
                            "Homebrew",
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
          )
        ],
        title: Text("Monster List"),
        backgroundColor: Color.fromARGB(255, 255, 22, 22),
        toolbarHeight: 130,
      ),
      //body: MonsterListBody(),
      backgroundColor: Color.fromARGB(255, 255, 189, 89),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/MainScreen'),
        backgroundColor: Color.fromARGB(255, 255, 22, 22),
      ),
    );
  }
}*/

/*class MonsterListBody extends StatelessWidget {
  int aGoals = 0;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 255, 189, 89),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  //PARTIES BUTTON
                  SizedBox(
                    height: 15,
                    width: 50,
                    child: FloatingActionButton(
                      backgroundColor: Color.fromARGB(255, 255, 22, 22),
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
                        "List",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  //MONSTER LIST BUTTON
                  SizedBox(
                    height: 15,
                    width: 50,
                    child: FloatingActionButton(
                      backgroundColor: Color.fromARGB(255, 255, 22, 22),
                      heroTag: "monsterScreen",
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          arguments: aGoals,
                          "/MonsterList",
                        );
                      },
                      child: const Text(
                        "Favourites",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  //CREATE A MONSTER BUTTON
                  SizedBox(
                    height: 15,
                    width: 50,
                    child: FloatingActionButton(
                      backgroundColor: Color.fromARGB(255, 255, 22, 22),
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
                        "Homebrew",
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
}*/
import 'package:flutter/material.dart';

List<String> titles = <String>[
  'List',
  'Favourites',
  'Homebrew',
];

void main() => runApp(const MonsterListBody());

class MonsterList extends StatelessWidget {
  const MonsterList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const MonsterListBody(),
    );
  }
}

class MonsterListBody extends StatelessWidget {
  const MonsterListBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 3;

    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Monster List'),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: Color.fromARGB(255, 255, 22, 22),

          // This check specifies which nested Scrollable's scroll notification
          // should be listened to.
          //
          // When `ThemeData.useMaterial3` is true and scroll view has
          // scrolled underneath the app bar, this updates the app bar
          // background color and elevation.
          //
          // This sets `notification.depth == 1` to listen to the scroll
          // notification from the nested `ListView.builder`.
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          // The elevation value of the app bar when scroll view has
          // scrolled underneath the app bar.
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            dividerColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.list),
                text: titles[0],
              ),
              Tab(
                icon: const Icon(Icons.star),
                text: titles[1],
              ),
              Tab(
                icon: const Icon(Icons.home),
                text: titles[2],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[0]} $index'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[1]} $index'),
                );
              },
            ),
            ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[2]} $index'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
