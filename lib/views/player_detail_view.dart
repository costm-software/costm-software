import 'package:flutter/material.dart';
import 'package:costm_software/models/player_model.dart';

class PlayerDetailPage extends StatefulWidget {
  final Player player;

  const PlayerDetailPage({required this.player, Key? key}) : super(key: key);

  @override
  State<PlayerDetailPage> createState() => _PlayerDetailPageState();
}

class _PlayerDetailPageState extends State<PlayerDetailPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.player.name ?? ''),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Player's ID: ${widget.player.playerId.toString()}",
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                "Player's name: ${widget.player.name.toString()}",
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                "Player's Age: ${widget.player.age.toString()}",
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
}
