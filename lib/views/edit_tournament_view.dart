import 'package:costm_software/models/tournament_model.dart';
import 'package:flutter/material.dart';

class EditTournamentPage extends StatefulWidget {
  final Tournament tournament;

  const EditTournamentPage({required this.tournament, Key? key}) : super(key: key);
  @override
  State<EditTournamentPage> createState() => _EditTournamentPageState();
}

class _EditTournamentPageState extends State<EditTournamentPage> {
  @override
  Widget build (BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.tournament.name ?? ''),
    ),
  );
}