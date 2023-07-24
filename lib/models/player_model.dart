import 'dart:ffi';
import 'package:uuid/uuid.dart';

import 'package:uuid/uuid.dart';

class Player {
  String? playerId;
  String? name;
  int? age;
  String? colourHistory;
  int? colourDifference;
  double? score;
  int? pairingNumber;

  Player(
      {String? playerId,
      this.name,
      this.age,
      this.colourHistory,
      this.colourDifference,
      this.score,
      this.pairingNumber})
      : playerId = playerId ?? const Uuid().v4();

  Player.fromJson(Map<String, dynamic> json) {
    playerId = json['player_id'];
    name = json['name'];
    age = json['age'];
    colourHistory = json['colour_history'];
    colourDifference = json['colour_difference'];
    score = json['score'];
    pairingNumber = json['pairing_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'player_id': playerId,
      'name': name,
      'age': age,
      'colour_history': colourHistory,
      'colour_difference': colourDifference,
      'score': score,
      'pairing_number': pairingNumber,
    };
    return data;
  }
}
