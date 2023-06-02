import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  final String _keyPlayerName = 'playername';
  final String _keyPlayerAge = 'playerage';

  Future setPlayerName(String playername) async {
    await storage.write(key: _keyPlayerName, value: playername);
  }

  Future<String?> getPlayerName() async {
    return await storage.read(key: _keyPlayerName);
  }

  Future setPlayerAge(String playerage) async {
    await storage.write(key: _keyPlayerAge, value: playerage);
  }

  Future<String?> getPlayerAge() async {
    return await storage.read(key: _keyPlayerAge);
  }
}
