import 'package:flutter/material.dart';
import 'Home/home.dart';
import 'Player/add_player.dart';
import 'Tournament/add_tournament.dart';
import 'Player/player_detail.dart';
import 'Tournament/tournament_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => const HomePage(),
        "/add_tournament": (BuildContext context) => const AddTournamentPage(),
        "/add_player": (BuildContext context) => const AddPlayerPage(),
        "/tournament_detail": (BuildContext context) =>
            const TournamentDetailPage(),
        "/player_deatil": (BuildContext context) => const PlayerDetailPage(),
      },
      initialRoute: "/home",
      title: 'Flutter Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
