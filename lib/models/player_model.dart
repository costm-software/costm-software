import 'package:uuid/uuid.dart';

class Player {
  String? playerId;
  String? name;
  int? age;

  Player({String? playerId, this.name, this.age})
      : playerId = playerId ?? const Uuid().v4();

  Player.fromJson(Map<String, dynamic> json) {
    playerId = json['player_id'];
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'player_id': playerId,
      'name': name,
      'age': age,
    };
    return data;
  }
}
