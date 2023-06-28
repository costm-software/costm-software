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
        body: Container(
          padding: const EdgeInsets.all(
              16.0), // Adicionando espaçamento interno com um valor de 16.0 pixels
          color: Colors.white, // Definindo a cor de fundo como branca
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Alinhando os elementos verticalmente ao centro
            crossAxisAlignment: CrossAxisAlignment
                .start, // Alinhando os elementos horizontalmente à esquerda
            children: [
              Text(
                "Player's ID: ${widget.player.playerId.toString()}",
                style: const TextStyle(
                  fontSize: 18.0, // Definindo o tamanho da fonte como 18.0
                  fontWeight: FontWeight
                      .bold, // Definindo o estilo da fonte como negrito
                  color: Colors.black, // Definindo a cor do texto como preto
                ),
              ),
              const SizedBox(
                  height:
                      8.0), // Adicionando um espaçamento vertical de 8.0 pixels
              Text(
                "Player's name: ${widget.player.name.toString()}",
                style: const TextStyle(
                  fontSize: 16.0, // Definindo o tamanho da fonte como 16.0
                  color: Colors.grey, // Definindo a cor do texto como cinza
                ),
              ),
              const SizedBox(
                  height:
                      8.0), // Adicionando um espaçamento vertical de 8.0 pixels
              Text(
                "Player's Age: ${widget.player.age.toString()}",
                style: const TextStyle(
                  fontSize: 16.0, // Definindo o tamanho da fonte como 16.0
                  color: Colors.grey, // Definindo a cor do texto como cinza
                ),
              ),
            ],
          ),
        ),
      );
}
