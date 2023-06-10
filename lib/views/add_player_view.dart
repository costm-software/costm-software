import 'package:flutter/material.dart';
import 'package:costm_software/services/storage_service.dart';
import 'package:costm_software/models/tournament_model.dart';

class AddPlayerPage extends StatefulWidget {
  final Tournament tournament;
  const AddPlayerPage({required this.tournament, Key? key}) : super(key: key);

  @override
  State<AddPlayerPage> createState() => _AddPlayerPageState();
}

class _AddPlayerPageState extends State<AddPlayerPage> {
  final TextEditingController _playerNameController = TextEditingController();
  final TextEditingController _playerAgeController = TextEditingController();
  final SecureStorage _secureStorage = SecureStorage();

  bool isDialogOpen = false;

  @override
  void initState() {
    super.initState();
    fetchSecureStorageData();
  }

  Future<void> fetchSecureStorageData() async {
    _playerNameController.text = await _secureStorage.getPlayerName() ?? '';
    _playerAgeController.text = await _secureStorage.getPlayerAge() ?? '';
  }

  void showSaveConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Player saved'),
        content: const Text('The player has been successfully saved.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<bool> savePlayer() async {
    if (_playerNameController.text.isEmpty ||
        _playerAgeController.text.isEmpty) {
      return false;
    }

    final Player newPlayer = Player(
      name: _playerNameController.text,
      age: int.tryParse(_playerAgeController.text),
    );

    widget.tournament.addPlayer(newPlayer);

    _playerNameController.clear();
    _playerAgeController.clear();

    return true;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Add player'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final savedSuccessfully = await savePlayer();
          if (savedSuccessfully) {
            showSaveConfirmationDialog();
            await _secureStorage.setPlayerName(_playerNameController.text);
            await _secureStorage.setPlayerAge(_playerAgeController.text);
          } else {
            // ignore: use_build_context_synchronously
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Empty fields'),
                content: const Text('Please fill in all fields.'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        label: const Text('SAVE PLAYER'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _playerNameController,
              maxLines: 1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _playerAgeController,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Age',
              ),
            ),
          ),
        ]),
      ));
}
