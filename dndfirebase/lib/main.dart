import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

import 'Screens/main_screen.dart';
import 'Screens/parties_screen.dart';
import 'Screens/party_edit_screen.dart';
import 'Screens/monster_list.dart';
import 'Screens/monster_info_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/MainScreen',
      routes: {
        '/MainScreen': (context) => MainScreen(),
        '/Parties': (context) => PartiesScreen(),
        '/PartyEdit': (context) => PartyEditScreen(),
        '/MonsterList': (context) => MonsterListBody(),
        '/MonsterInfo': (context) => MonsterInfoScreen(),
      },
    );
  }
}
