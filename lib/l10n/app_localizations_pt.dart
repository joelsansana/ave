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
  String get readingsTab => 'Devocional';

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
  String get readingsTitle => 'Devocional';

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

  @override
  String get notificationsTitle => 'Notificações';

  @override
  String get notificationsEnabled => 'Ativar Notificações';

  @override
  String get notificationsEnabledDesc => 'Receba lembretes e atualizações';

  @override
  String get notificationsDailyReminder => 'Lembrete Diário';

  @override
  String get notificationsDailyReminderEnabled => 'Lembrete Diário';

  @override
  String get notificationsDailyReminderDesc =>
      'Receba um lembrete diário para os seus hábitos';

  @override
  String get notificationsDailyReminderTime => 'Hora do Lembrete';

  @override
  String get notificationsTypes => 'Tipos de Notificação';

  @override
  String get notificationsHabitReminders => 'Lembretes de Hábitos';

  @override
  String get notificationsHabitRemindersDesc =>
      'Notificações sobre os seus hábitos';

  @override
  String get notificationsNfpReminders => 'Lembretes de PNF';

  @override
  String get notificationsNfpRemindersDesc =>
      'Lembretes para registar sintomas';

  @override
  String get notificationsInfoNote =>
      'As notificações push requerem configuração adicional do Firebase Cloud Messaging.';
}
