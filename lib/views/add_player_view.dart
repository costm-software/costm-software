import 'package:flutter/material.dart';
import 'package:costm_software/services/storage_service.dart';

class AddPlayerPage extends StatefulWidget {
  const AddPlayerPage({Key? key}) : super(key: key);

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

  Future<void> _showConfirmationDialog() async {
    setState(() {
      isDialogOpen = true;
    });

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Player saved successfully.'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                _playerNameController.clear();
                _playerAgeController.clear();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );

    setState(() {
      isDialogOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Add player'),
        centerTitle: true,
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
          ElevatedButton(
            child: const Text('SAVE PLAYER'),
            onPressed: () async {
              _showConfirmationDialog();
              await _secureStorage.setPlayerName(_playerNameController.text);
              await _secureStorage.setPlayerAge(_playerAgeController.text);
            },
          )
        ]),
      ));
}
