import 'package:costm_software/models/match_model.dart';

class Round {
  String? roundId;
  List<Match>? matches;
  String? status;

  Round({this.roundId, this.matches, this.status});

  Round.fromJson(Map<String, dynamic> json) {
    roundId = json['round_id'];
    status = json['status'];
    if (json['matches'] != null) {
      matches = <Match>[];
      json['matches'].forEach((v) {
        matches!.add(Match.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'round_id': roundId,
      'status': status,
    };
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
