import 'package:costm_software/models/player_model.dart';

class Matches {
  String? matchId;
  String? matchResult;
  Player? playerOne;
  Player? playerTwo;

  Matches({this.matchId, this.matchResult, this.playerOne, this.playerTwo});

  Matches.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    matchResult = json['match_result'];
    playerOne =
        json['player_one'] != null ? Player.fromJson(json['player_one']) : null;
    playerTwo =
        json['player_two'] != null ? Player.fromJson(json['player_two']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'match_id': matchId,
      'match_result': matchResult,
    };
    if (playerOne != null) {
      data['player_one'] = playerOne!.toJson();
    }
    if (playerTwo != null) {
      data['player_two'] = playerTwo!.toJson();
    }
    return data;
  }
}
