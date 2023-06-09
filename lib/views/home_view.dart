import 'package:flutter/material.dart';
import 'package:costm_software/views/add_tournament_view.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:costm_software/models/tournament_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tournament> tournamentList = [];
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadTournamentList();
  }

  Future<void> loadTournamentList() async {
    final storedTournamentList =
        await secureStorage.read(key: 'tournamentList') ?? '';
    if (storedTournamentList.isNotEmpty) {
      final List<dynamic> tournamentListJson = jsonDecode(storedTournamentList);
      setState(() {
        tournamentList = tournamentListJson
            .map((json) => Tournament.fromJson(json))
            .toList();
      });
    }
  }

  Future<void> navigateToAddTournamentPage() async {
    final updatedTournamentList = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTournamentPage()),
    );
    if (updatedTournamentList != null) {
      setState(() {
        tournamentList = updatedTournamentList;
      });
    }
  }

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
          navigateToAddTournamentPage();
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: tournamentList.length,
              itemBuilder: (context, index) {
                final tournament = tournamentList[index];
                return ListTile(
                  title: Text(tournament.name ?? ''),
                  subtitle: Text(tournament.organizer ?? ''),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
