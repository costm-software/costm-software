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
      body: Container(
        color: Colors.amberAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: Colors.blueAccent,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 8.0, 10.0, 0.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "ID: ",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.tournament.tournamentId
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Organizer: ",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        widget.tournament.organizer.toString(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Time Control: ",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.tournament.timeControl
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Number of Rounds: ",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.tournament.roundsNumber
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Number of Players: ",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.tournament.players?.length
                                            .toString() ??
                                        '0',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 8.0, 10.0, 0.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Status: ",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.tournament.tournamentId
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 8.0, 10.0, 0.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Current round: ",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.tournament.tournamentId
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ])),
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
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
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      hoverColor: const Color.fromRGBO(200, 213, 26, 1),
                      contentPadding:
                          const EdgeInsets.fromLTRB(16.0, 0.0, 10.0, 0.0),
                      title: Text(
                        player.name ?? '',
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Age: ${player.age ?? ''}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                label: const Text('Add player'),
                icon: const Icon(Icons.group_add),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPlayerPage(
                        tournament: widget.tournament,
                      ),
                    ),
                  );
                  if (result == true) {
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
      ));
}
