import 'package:flutter/material.dart';
import 'package:costm_software/Player/add_player.dart';

class AddTournamentPage extends StatelessWidget {
  const AddTournamentPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Add tournament'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const AddPlayerPage())));
          },
          child: const Icon(Icons.group_add),
        ),
      );
}
