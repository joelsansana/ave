import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/lectio_service.dart';
import '../domain/lectio_divina.dart';

final lectioOfDayProvider = FutureProvider<LectioDivina>((ref) async {
  return LectioService.getLectioOfDay();
});

final allLectiosProvider = FutureProvider<List<LectioDivina>>((ref) async {
  return LectioService.getAll();
});

/// Current stage in the Lectio Divina flow
enum LectioStage { lectio, meditatio, oratio, contemplatio }

/// Stage provider
final lectioStageProvider = StateProvider<LectioStage>((ref) => LectioStage.lectio);
