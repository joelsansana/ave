import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/habit.dart';

class HabitRepository {
  static const _habitsKey = 'habits_data';
  final SharedPreferences _prefs;

  HabitRepository(this._prefs);

  Future<void> saveHabits(List<Habit> habits) async {
    final jsonList = habits.map((h) => h.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString(_habitsKey, jsonString);
  }

  List<Habit> getHabits() {
    final jsonString = _prefs.getString(_habitsKey);
    if (jsonString == null) {
      return [];
    }
    
    try {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => Habit.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      // In case of error in decoding we fall back to empty
      return [];
    }
  }
}
