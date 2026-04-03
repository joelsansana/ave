import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../readings/data/saint_service.dart';
import '../../readings/domain/saint.dart';

final saintOfDayProvider = FutureProvider<Saint>((ref) async {
  return SaintService.getSaintOfDay();
});

final allSaintsProvider = FutureProvider<List<Saint>>((ref) async {
  return SaintService.getAllSaints();
});
