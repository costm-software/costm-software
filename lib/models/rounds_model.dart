import 'package:costm_software/models/matches_model.dart';

class Rounds {
  String? roundId;
  List<Matches>? matches;

  Rounds({this.roundId, this.matches});

  Rounds.fromJson(Map<String, dynamic> json) {
    roundId = json['round_id'];
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'round_id': roundId,
    };
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
