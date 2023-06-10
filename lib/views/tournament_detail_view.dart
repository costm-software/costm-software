import 'package:flutter/material.dart';
import 'package:costm_software/models/tournament_model.dart';
import 'package:costm_software/views/add_player_view.dart';
import 'package:costm_software/views/player_detail_view.dart';

class TournamentDetailPage extends StatefulWidget {
  final Tournament tournament;

  const TournamentDetailPage({required this.tournament, Key? key})
      : super(key: key);

  @override
  State<TournamentDetailPage> createState() => _TournamentDetailPageState();
}

class _TournamentDetailPageState extends State<TournamentDetailPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.tournament.name ?? ''),
          centerTitle: true,
        ),
        body: Column(children: [
          Text(widget.tournament.tournamentId ?? ''),
          Text(widget.tournament.organizer ?? ''),
          Text(widget.tournament.timeControl ?? ''),
          Text(widget.tournament.roundsNumber.toString()),
          const Text("Players: "),
          Text(widget.tournament.players?.length.toString() ?? '0'),
          Expanded(
            child: ListView.builder(
              itemCount: widget.tournament.players?.length ?? 0,
              itemBuilder: (context, index) {
                final player = widget.tournament.players![index];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayerDetailPage(
                                    player: player,
                                  )));
                    },
                    child: ListTile(
                      title: Text(player.name ?? ''),
                      subtitle: Text('Age: ${player.age ?? ''}'),
                    ));
              },
            ),
          ),
          ElevatedButton.icon(
            label: const Text('Add player'),
            icon: const Icon(Icons.group_add),
            onPressed: () async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) =>
                          AddPlayerPage(tournament: widget.tournament))));
              if (result == true) {
                setState(
                    () {}); // Atualiza o estado para reconstruir a interface
              }
            },
          )
        ]),
      );
}
