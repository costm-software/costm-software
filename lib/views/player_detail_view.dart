import 'package:flutter/material.dart';
import 'package:costm_software/models/tournament_model.dart';

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
      body: Column(children: [
        Text(widget.player.playerId ?? ''),
        Text(widget.player.name ?? ''),
        Text(widget.player.age.toString()),
      ]));
}
