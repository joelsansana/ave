// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Hábitos';

  @override
  String get homeTab => 'Início';

  @override
  String get calendarTab => 'Calendário';

  @override
  String get readingsTab => 'Ler';

  @override
  String get nfpTab => 'PNF';

  @override
  String get profileTab => 'Perfil';

  @override
  String get habitsTitle => 'Hábitos';

  @override
  String get calendarTitle => 'Calendário';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get readingsTitle => 'Ler';

  @override
  String get nfpCycleTab => 'Ciclo';

  @override
  String get nfpPeriod => 'Período';

  @override
  String get nfpFirstDayOfPeriod => 'Primeiro dia do período?';

  @override
  String get nfpBasalTemp => 'Temperatura Basal';

  @override
  String get nfpCervicalMucus => 'Muco Cervical';

  @override
  String get nfpMood => 'Humor';

  @override
  String get nfpSymptoms => 'Sintomas';

  @override
  String get nfpPredictedOvulation => 'Ovulação prevista';

  @override
  String get nfpNextPeriod => 'Próximo período';

  @override
  String get nfpPreviousCycles => 'Ciclos Anteriores';

  @override
  String get nfpInDevelopment => 'Em desenvolvimento...';

  @override
  String get readingsRosaryContent =>
      'Conteúdo completo do Rosário...\n\n(em desenvolvimento)';

  @override
  String get close => 'Fechar';

  @override
  String readingsStationX(String stationNumber) {
    return 'Estação $stationNumber';
  }

  @override
  String get readingsTapToMeditate => 'Tap para meditar';

  @override
  String get loading => 'A carregar...';

  @override
  String get error => 'Ocorreu um erro.';

  @override
  String get save => 'Guardar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get today => 'Hoje';

  @override
  String get add => 'Adicionar';

  @override
  String get profileHabitsCount => 'Hábitos';

  @override
  String get profileStreakDays => 'Dias Seguidos';

  @override
  String get profileTotalDays => 'Total Dias';
}
