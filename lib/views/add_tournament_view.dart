import 'package:flutter/material.dart';
import 'package:costm_software/models/tournament_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class AddTournamentPage extends StatefulWidget {
  const AddTournamentPage({Key? key}) : super(key: key);

  @override
  State<AddTournamentPage> createState() => _AddTournamentPageState();
}

class _AddTournamentPageState extends State<AddTournamentPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController organizerController = TextEditingController();
  final TextEditingController timeControlController = TextEditingController();
  final TextEditingController roundsController = TextEditingController();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  final List<String> timeControlList = const [
    '3 min',
    '3 min | 2 sec',
    '5 min',
    '5 min | 5 sec',
    '10 min',
    '15 min | 10 sec',
    '20 min',
    '21 min',
    '30 min',
    '60 min'
  ];

  String dropdownValue = '3 min';

  @override
  void initState() {
    super.initState();
    dropdownValue = timeControlList[0];
  }

  void onTimeControlChanged(String? newValue) {
    if (timeControlList.contains(newValue)) {
      setState(() {
        dropdownValue = newValue!;
        timeControlController.text = dropdownValue;
      });
    }
  }

  List<Tournament> tournamentList = [];

  Future<bool> saveTournament() async {
    if (nameController.text.isEmpty ||
        organizerController.text.isEmpty ||
        timeControlController.text.isEmpty ||
        roundsController.text.isEmpty) {
      return false;
    }

    final Tournament tournament = Tournament(
      name: nameController.text,
      organizer: organizerController.text,
      timeControl: timeControlController.text,
      roundsNumber: int.tryParse(roundsController.text),
    );

    // Retrieve existing tournament list from secure storage
    final String? tournamentListJson =
        await secureStorage.read(key: 'tournamentList');
    if (tournamentListJson != null) {
      final List<dynamic> tournamentListData = jsonDecode(tournamentListJson);
      tournamentList =
          tournamentListData.map((t) => Tournament.fromJson(t)).toList();
    }

    // Add new tournament to the list
    tournamentList.add(tournament);

    // Write updated tournament list back to secure storage
    await secureStorage.write(
      key: 'tournamentList',
      value: jsonEncode(tournamentList.map((t) => t.toJson()).toList()),
    );

    nameController.clear();
    organizerController.clear();
    timeControlController.clear();
    roundsController.clear();

    return true;
  }

  void showSaveConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tournament saved'),
        content: const Text('The tournament has been successfully saved.'),
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

  @override
  Widget build(BuildContext context) => Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Add tournament'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final savedSuccessfully = await saveTournament();
          if (savedSuccessfully) {
            showSaveConfirmationDialog();
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
        label: const Text('SAVE TOURNAMENT'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                key: const ValueKey('nameField'),
                controller: nameController,
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
                controller: organizerController,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Organizer',
                ),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 8),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Select a time control option:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: const Text('Select an option'),
                      value: dropdownValue,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: onTimeControlChanged,
                      items: timeControlList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: roundsController,
                maxLines: 1,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number of rounds',
                ),
              ),
            ),
          ],
        ),
      ));
}
