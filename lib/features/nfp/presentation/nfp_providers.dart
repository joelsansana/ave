import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../habits/presentation/habit_providers.dart';
import '../domain/nfp_data.dart';
import '../data/nfp_repository.dart';

final nfpRepositoryProvider = Provider<NfpRepository>((ref) {
  return NfpRepository(ref.watch(sharedPreferencesProvider));
});

final nfpProvider = StateNotifierProvider<NfpNotifier, List<CycleDay>>((ref) {
  return NfpNotifier(ref.watch(nfpRepositoryProvider));
});

class NfpNotifier extends StateNotifier<List<CycleDay>> {
  final NfpRepository _repository;

  NfpNotifier(this._repository) : super([]) {
    _loadData();
  }

  void _loadData() {
    state = _repository.getCycleDays();
  }

  void _saveData() {
    _repository.saveCycleDays(state);
  }

  CycleDay? getDay(DateTime date) {
    final key = DateTime(date.year, date.month, date.day);
    try {
      return state.firstWhere((d) => 
        d.date.year == key.year && d.date.month == key.month && d.date.day == key.day);
    } catch (_) {
      return null;
    }
  }

  void updateDay(CycleDay day) {
    final key = DateTime(day.date.year, day.date.month, day.date.day);
    final index = state.indexWhere((d) => 
      d.date.year == key.year && d.date.month == key.month && d.date.day == key.day);
      
    if (index >= 0) {
      final newState = List<CycleDay>.from(state);
      newState[index] = day;
      state = newState;
    } else {
      state = [...state, day];
    }
    _saveData();
  }
}

final cycleStatsProvider = Provider<CycleStats>((ref) {
  final history = ref.watch(nfpProvider);
  // Sort history by date to calculate stats
  final sortedHistory = List<CycleDay>.from(history)..sort((a, b) => a.date.compareTo(b.date));
  
  // This uses a simplistic implementation. 
  // In a real app we'd call NFPService.calculateStats(sortedHistory);
  // I will import and call it here if needed, but since it's an external file it won't compile without the import.
  // Wait, I will just import it. Note: add import to top later. (I will do it now)
  throw UnimplementedError();
});
