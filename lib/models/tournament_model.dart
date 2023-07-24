import 'package:uuid/uuid.dart';

import 'package:costm_software/models/player_model.dart';
import 'package:costm_software/models/round_model.dart';

class Tournament {
  String? tournamentId;
  String? name;
  String? organizer;
  String? timeControl;
  int? roundsNumber;
  List<Round>? rounds;
  List<Player>? players;
  int? currentRound;
  String? status;

  Tournament({
    String? tournamentId,
    this.name,
    this.organizer,
    this.timeControl,
    this.roundsNumber,
    this.rounds,
    this.players,
    this.currentRound,
    this.status,
  }) : tournamentId = tournamentId ?? const Uuid().v4();

  Tournament.fromJson(Map<String, dynamic> json) {
    tournamentId = json['tournament_id'];
    name = json['name'];
    organizer = json['organizer'];
    timeControl = json['time_control'];
    roundsNumber = json['rounds_number'];
    currentRound = json['currentRound'];
    status = json['status'];

    if (json['rounds'] != null) {
      rounds = <Round>[];
      json['rounds'].forEach((v) {
        rounds!.add(Round.fromJson(v));
      });
    }
    if (json['players'] != null) {
      players = <Player>[];
      json['players'].forEach((v) {
        players!.add(Player.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'tournament_id': tournamentId,
      'name': name,
      'organizer': organizer,
      'time_control': timeControl,
      'rounds_number': roundsNumber,
      'current_round': currentRound,
      'status': status,
    };
    if (rounds != null) {
      data['rounds'] = rounds!.map((v) => v.toJson()).toList();
    }
    if (players != null) {
      data['players'] = players!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  void addPlayer(Player player) {
    players ??= <Player>[];
    players!.add(player);
  }

  void removePlayer(Player player) {
    players?.remove(player);
  }
}
