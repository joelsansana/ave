import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/habit.dart';
import '../data/habit_repository.dart';
import '../data/habit_service.dart';

// Provider for SharedPreferences (must be overridden in main)
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

// Provider for Repository
final habitRepositoryProvider = Provider<HabitRepository>((ref) {
  return HabitRepository(ref.watch(sharedPreferencesProvider));
});

// Provider for Notifier
final habitsProvider = StateNotifierProvider<HabitsNotifier, List<Habit>>((ref) {
  return HabitsNotifier(ref.watch(habitRepositoryProvider));
});

class HabitsNotifier extends StateNotifier<List<Habit>> {
  final HabitRepository _repository;

  HabitsNotifier(this._repository) : super([]) {
    _loadHabits();
  }

  void _loadHabits() {
    final habits = _repository.getHabits();
    if (habits.isEmpty) {
      // Initialize with default habits
      final defaultHabits = HabitService.getDefaultHabits();
      state = defaultHabits;
      _repository.saveHabits(defaultHabits);
    } else {
      state = habits;
    }
  }

  void toggleHabitCompletion(String habitId, DateTime date) {
    final dateKey = DateTime(date.year, date.month, date.day);
    state = state.map((habit) {
      if (habit.id == habitId) {
        final List<DateTime> newDates = List.from(habit.completedDates);
        // Remove completion if it exists for this day, or add it
        final existingIndex = newDates.indexWhere((d) => 
          d.year == dateKey.year && d.month == dateKey.month && d.day == dateKey.day);
          
        if (existingIndex >= 0) {
          newDates.removeAt(existingIndex);
        } else {
          newDates.add(dateKey);
        }
        return habit.copyWith(completedDates: newDates);
      }
      return habit;
    }).toList();
    
    _repository.saveHabits(state);
  }
}
