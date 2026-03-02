import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/nfp_data.dart';

class NfpRepository {
  static const _nfpKey = 'nfp_data';
  final SharedPreferences _prefs;

  NfpRepository(this._prefs);

  Future<void> saveCycleDays(List<CycleDay> cycleDays) async {
    final jsonList = cycleDays.map((h) => h.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString(_nfpKey, jsonString);
  }

  List<CycleDay> getCycleDays() {
    final jsonString = _prefs.getString(_nfpKey);
    if (jsonString == null) {
      return [];
    }
    
    try {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => CycleDay.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }
}
