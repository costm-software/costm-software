import 'package:flutter/material.dart';
import 'package:costm_software/views/add_tournament_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tournaments'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const AddTournamentPage())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
