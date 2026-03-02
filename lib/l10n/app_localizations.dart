import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('pt')];

  /// O título principal da aplicação
  ///
  /// In pt, this message translates to:
  /// **'Hábitos'**
  String get appTitle;

  /// No description provided for @homeTab.
  ///
  /// In pt, this message translates to:
  /// **'Início'**
  String get homeTab;

  /// No description provided for @calendarTab.
  ///
  /// In pt, this message translates to:
  /// **'Calendário'**
  String get calendarTab;

  /// No description provided for @readingsTab.
  ///
  /// In pt, this message translates to:
  /// **'Ler'**
  String get readingsTab;

  /// No description provided for @nfpTab.
  ///
  /// In pt, this message translates to:
  /// **'PNF'**
  String get nfpTab;

  /// No description provided for @profileTab.
  ///
  /// In pt, this message translates to:
  /// **'Perfil'**
  String get profileTab;

  /// No description provided for @habitsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Hábitos'**
  String get habitsTitle;

  /// No description provided for @calendarTitle.
  ///
  /// In pt, this message translates to:
  /// **'Calendário'**
  String get calendarTitle;

  /// No description provided for @profileTitle.
  ///
  /// In pt, this message translates to:
  /// **'Perfil'**
  String get profileTitle;

  /// No description provided for @readingsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Ler'**
  String get readingsTitle;

  /// No description provided for @nfpCycleTab.
  ///
  /// In pt, this message translates to:
  /// **'Ciclo'**
  String get nfpCycleTab;

  /// No description provided for @nfpPeriod.
  ///
  /// In pt, this message translates to:
  /// **'Período'**
  String get nfpPeriod;

  /// No description provided for @nfpFirstDayOfPeriod.
  ///
  /// In pt, this message translates to:
  /// **'Primeiro dia do período?'**
  String get nfpFirstDayOfPeriod;

  /// No description provided for @nfpBasalTemp.
  ///
  /// In pt, this message translates to:
  /// **'Temperatura Basal'**
  String get nfpBasalTemp;

  /// No description provided for @nfpCervicalMucus.
  ///
  /// In pt, this message translates to:
  /// **'Muco Cervical'**
  String get nfpCervicalMucus;

  /// No description provided for @nfpMood.
  ///
  /// In pt, this message translates to:
  /// **'Humor'**
  String get nfpMood;

  /// No description provided for @nfpSymptoms.
  ///
  /// In pt, this message translates to:
  /// **'Sintomas'**
  String get nfpSymptoms;

  /// No description provided for @nfpPredictedOvulation.
  ///
  /// In pt, this message translates to:
  /// **'Ovulação prevista'**
  String get nfpPredictedOvulation;

  /// No description provided for @nfpNextPeriod.
  ///
  /// In pt, this message translates to:
  /// **'Próximo período'**
  String get nfpNextPeriod;

  /// No description provided for @nfpPreviousCycles.
  ///
  /// In pt, this message translates to:
  /// **'Ciclos Anteriores'**
  String get nfpPreviousCycles;

  /// No description provided for @nfpInDevelopment.
  ///
  /// In pt, this message translates to:
  /// **'Em desenvolvimento...'**
  String get nfpInDevelopment;

  /// No description provided for @readingsRosaryContent.
  ///
  /// In pt, this message translates to:
  /// **'Conteúdo completo do Rosário...\n\n(em desenvolvimento)'**
  String get readingsRosaryContent;

  /// No description provided for @close.
  ///
  /// In pt, this message translates to:
  /// **'Fechar'**
  String get close;

  /// No description provided for @readingsStationX.
  ///
  /// In pt, this message translates to:
  /// **'Estação {stationNumber}'**
  String readingsStationX(String stationNumber);

  /// No description provided for @readingsTapToMeditate.
  ///
  /// In pt, this message translates to:
  /// **'Tap para meditar'**
  String get readingsTapToMeditate;

  /// No description provided for @loading.
  ///
  /// In pt, this message translates to:
  /// **'A carregar...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In pt, this message translates to:
  /// **'Ocorreu um erro.'**
  String get error;

  /// No description provided for @save.
  ///
  /// In pt, this message translates to:
  /// **'Guardar'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In pt, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// No description provided for @today.
  ///
  /// In pt, this message translates to:
  /// **'Hoje'**
  String get today;

  /// No description provided for @add.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar'**
  String get add;

  /// No description provided for @profileHabitsCount.
  ///
  /// In pt, this message translates to:
  /// **'Hábitos'**
  String get profileHabitsCount;

  /// No description provided for @profileStreakDays.
  ///
  /// In pt, this message translates to:
  /// **'Dias Seguidos'**
  String get profileStreakDays;

  /// No description provided for @profileTotalDays.
  ///
  /// In pt, this message translates to:
  /// **'Total Dias'**
  String get profileTotalDays;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
