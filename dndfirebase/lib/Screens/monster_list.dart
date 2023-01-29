import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dndfirebase/Modals/firebase_data.dart';

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
    const String placeholderImg =
        'https://www.dndbeyond.com/content/1-0-2372-0/skins/waterdeep/images/icons/monsters/aberration.jpg';

    return DefaultTabController(
        initialIndex: 1,
        length: tabsCount,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Monster List'),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
              backgroundColor: Color.fromARGB(255, 255, 22, 22),

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
            body: StreamBuilder(
              stream: dbGetMonsters(),
              builder: ((context, snapshotMon) {
                if (!snapshotMon.hasData) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.red));
                }

                List<Monsters> currentMonster = snapshotMon.data!;
                return StreamBuilder(
                  stream: dbGetHomebrew(),
                  builder: ((context, snapshotHom) {
                    if (!snapshotHom.hasData) {
                      return const Center(
                          child: CircularProgressIndicator(color: Colors.red));
                    }
                    List<Homebrew> currentHomebrew = snapshotHom.data!;
                    return TabBarView(
                      children: <Widget>[
                        ListView.builder(
                          itemCount: currentMonster.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              tileColor: index.isOdd
                                  ? Color.fromARGB(255, 255, 189, 89)
                                  : Color.fromARGB(255, 252, 201, 126),
                              title: Text(currentMonster[index].name,
                                  style: const TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              leading: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child:
                                      Image.network(currentMonster[index].url)),
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: 25,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              tileColor: index.isOdd
                                  ? Color.fromARGB(255, 255, 189, 89)
                                  : Color.fromARGB(255, 252, 201, 126),
                              title: Text('${titles[0]} $index'),
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: currentHomebrew.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                tileColor: index.isOdd
                                    ? Color.fromARGB(255, 255, 189, 89)
                                    : Color.fromARGB(255, 252, 201, 126),
                                title: Text(currentHomebrew[index].name,
                                    style: const TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                                leading: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image.network(placeholderImg)),
                                onTap: () => Navigator.of(context).pushNamed(
                                    '/MonsterInfo',
                                    arguments: currentHomebrew[index].id));
                          },
                        ),
                      ],
                    );
                  }),
                );
              }),
            )));
  }
}
