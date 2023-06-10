import 'package:riverpod/riverpod.dart';
import 'package:costm_software/models/tournament_model.dart';

final tournamentListProvider = StateProvider<List<Tournament>>((ref) => []);
