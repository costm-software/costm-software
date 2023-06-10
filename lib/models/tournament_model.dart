import 'package:uuid/uuid.dart';

class Tournament {
  String? tournamentId;
  String? name;
  String? organizer;
  String? timeControl;
  int? roundsNumber;
  List<Rounds>? rounds;
  List<Player>? players;

  Tournament(
      {String? tournamentId,
      this.name,
      this.organizer,
      this.timeControl,
      this.roundsNumber,
      this.rounds,
      this.players})
      : tournamentId = tournamentId ?? const Uuid().v4();

  Tournament.fromJson(Map<String, dynamic> json) {
    tournamentId = json['tournament_id'];
    name = json['name'];
    organizer = json['organizer'];
    timeControl = json['time_control'];
    roundsNumber = json['rounds_number'];
    if (json['rounds'] != null) {
      rounds = <Rounds>[];
      json['rounds'].forEach((v) {
        rounds!.add(Rounds.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tournament_id'] = tournamentId;
    data['name'] = name;
    data['organizer'] = organizer;
    data['time_control'] = timeControl;
    data['rounds_number'] = roundsNumber;
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

class Rounds {
  String? roundId;
  List<Matches>? matches;

  Rounds({roundId, matches});

  Rounds.fromJson(Map<String, dynamic> json) {
    roundId = json['round_id'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(new Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['round_id'] = roundId;
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matches {
  String? matchId;
  String? matchResult;
  Player? playerOne;
  Player? playerTwo;

  Matches({matchId, matchResult, playerOne, playerTwo});

  Matches.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    matchResult = json['match_result'];
    playerOne = json['player_one'] != null
        ? new Player.fromJson(json['player_one'])
        : null;
    playerTwo = json['player_two'] != null
        ? new Player.fromJson(json['player_two'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['match_id'] = matchId;
    data['match_result'] = matchResult;
    if (playerOne != null) {
      data['player_one'] = playerOne!.toJson();
    }
    if (playerTwo != null) {
      data['player_two'] = playerTwo!.toJson();
    }
    return data;
  }
}

class Player {
  String? playerId;
  String? name;
  int? age;

  Player({String? playerId, this.name, this.age}): playerId = playerId ?? const Uuid().v4();

  Player.fromJson(Map<String, dynamic> json) {
    playerId = json['player_id'];
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_id'] = playerId;
    data['name'] = name;
    data['age'] = age;
    return data;
  }
}
