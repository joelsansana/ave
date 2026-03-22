import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:habitos/l10n/app_localizations.dart';

// Notification preferences provider
final notificationPreferencesProvider = StateNotifierProvider<NotificationPreferencesNotifier, NotificationPreferences>((ref) {
  return NotificationPreferencesNotifier();
});

class NotificationPreferences {
  final bool notificationsEnabled;
  final bool dailyReminderEnabled;
  final int dailyReminderHour;
  final int dailyReminderMinute;
  final bool habitRemindersEnabled;
  final bool nfpRemindersEnabled;

  const NotificationPreferences({
    this.notificationsEnabled = true,
    this.dailyReminderEnabled = true,
    this.dailyReminderHour = 8,
    this.dailyReminderMinute = 0,
    this.habitRemindersEnabled = true,
    this.nfpRemindersEnabled = true,
  });

  NotificationPreferences copyWith({
    bool? notificationsEnabled,
    bool? dailyReminderEnabled,
    int? dailyReminderHour,
    int? dailyReminderMinute,
    bool? habitRemindersEnabled,
    bool? nfpRemindersEnabled,
  }) {
    return NotificationPreferences(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      dailyReminderEnabled: dailyReminderEnabled ?? this.dailyReminderEnabled,
      dailyReminderHour: dailyReminderHour ?? this.dailyReminderHour,
      dailyReminderMinute: dailyReminderMinute ?? this.dailyReminderMinute,
      habitRemindersEnabled: habitRemindersEnabled ?? this.habitRemindersEnabled,
      nfpRemindersEnabled: nfpRemindersEnabled ?? this.nfpRemindersEnabled,
    );
  }

  Map<String, dynamic> toJson() => {
    'notificationsEnabled': notificationsEnabled,
    'dailyReminderEnabled': dailyReminderEnabled,
    'dailyReminderHour': dailyReminderHour,
    'dailyReminderMinute': dailyReminderMinute,
    'habitRemindersEnabled': habitRemindersEnabled,
    'nfpRemindersEnabled': nfpRemindersEnabled,
  };

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) {
    return NotificationPreferences(
      notificationsEnabled: json['notificationsEnabled'] ?? true,
      dailyReminderEnabled: json['dailyReminderEnabled'] ?? true,
      dailyReminderHour: json['dailyReminderHour'] ?? 8,
      dailyReminderMinute: json['dailyReminderMinute'] ?? 0,
      habitRemindersEnabled: json['habitRemindersEnabled'] ?? true,
      nfpRemindersEnabled: json['nfpRemindersEnabled'] ?? true,
    );
  }
}

class NotificationPreferencesNotifier extends StateNotifier<NotificationPreferences> {
  NotificationPreferencesNotifier() : super(const NotificationPreferences()) {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('notification_preferences');
    if (data != null) {
      try {
        // Simple parsing without dart:convert import issues
        final Map<String, dynamic> json = {};
        final parts = data.split(',');
        for (final part in parts) {
          final kv = part.split(':');
          if (kv.length == 2) {
            final key = kv[0].trim();
            final value = kv[1].trim();
            if (value == 'true') {
              json[key] = true;
            } else if (value == 'false') {
              json[key] = false;
            } else {
              json[key] = int.tryParse(value) ?? value;
            }
          }
        }
        state = NotificationPreferences.fromJson(json);
      } catch (_) {
        // Use defaults if parsing fails
      }
    }
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final data = [
      'notificationsEnabled:${state.notificationsEnabled}',
      'dailyReminderEnabled:${state.dailyReminderEnabled}',
      'dailyReminderHour:${state.dailyReminderHour}',
      'dailyReminderMinute:${state.dailyReminderMinute}',
      'habitRemindersEnabled:${state.habitRemindersEnabled}',
      'nfpRemindersEnabled:${state.nfpRemindersEnabled}',
    ].join(',');
    await prefs.setString('notification_preferences', data);
  }

  void setNotificationsEnabled(bool value) {
    state = state.copyWith(notificationsEnabled: value);
    _savePreferences();
  }

  void setDailyReminderEnabled(bool value) {
    state = state.copyWith(dailyReminderEnabled: value);
    _savePreferences();
  }

  void setDailyReminderTime(int hour, int minute) {
    state = state.copyWith(dailyReminderHour: hour, dailyReminderMinute: minute);
    _savePreferences();
  }

  void setHabitRemindersEnabled(bool value) {
    state = state.copyWith(habitRemindersEnabled: value);
    _savePreferences();
  }

  void setNfpRemindersEnabled(bool value) {
    state = state.copyWith(nfpRemindersEnabled: value);
    _savePreferences();
  }
}

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(notificationPreferencesProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notificationsTitle),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Master toggle
          SwitchListTile(
            title: Text(l10n.notificationsEnabled),
            subtitle: Text(l10n.notificationsEnabledDesc),
            value: prefs.notificationsEnabled,
            onChanged: (value) {
              ref.read(notificationPreferencesProvider.notifier).setNotificationsEnabled(value);
            },
          ),
          const Divider(),

          // Daily reminder section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              l10n.notificationsDailyReminder,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SwitchListTile(
            title: Text(l10n.notificationsDailyReminderEnabled),
            subtitle: Text(l10n.notificationsDailyReminderDesc),
            value: prefs.dailyReminderEnabled,
            onChanged: prefs.notificationsEnabled
                ? (value) {
                    ref.read(notificationPreferencesProvider.notifier).setDailyReminderEnabled(value);
                  }
                : null,
          ),
          ListTile(
            title: Text(l10n.notificationsDailyReminderTime),
            subtitle: Text(_formatTime(context, prefs.dailyReminderHour, prefs.dailyReminderMinute)),
            trailing: const Icon(Icons.chevron_right),
            enabled: prefs.notificationsEnabled && prefs.dailyReminderEnabled,
            onTap: prefs.notificationsEnabled && prefs.dailyReminderEnabled
                ? () => _showTimePicker(context, ref, prefs)
                : null,
          ),
          const Divider(),

          // Notification types section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              l10n.notificationsTypes,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SwitchListTile(
            title: Text(l10n.notificationsHabitReminders),
            subtitle: Text(l10n.notificationsHabitRemindersDesc),
            value: prefs.habitRemindersEnabled,
            onChanged: prefs.notificationsEnabled
                ? (value) {
                    ref.read(notificationPreferencesProvider.notifier).setHabitRemindersEnabled(value);
                  }
                : null,
          ),
          SwitchListTile(
            title: Text(l10n.notificationsNfpReminders),
            subtitle: Text(l10n.notificationsNfpRemindersDesc),
            value: prefs.nfpRemindersEnabled,
            onChanged: prefs.notificationsEnabled
                ? (value) {
                    ref.read(notificationPreferencesProvider.notifier).setNfpRemindersEnabled(value);
                  }
                : null,
          ),
          const SizedBox(height: 32),

          // Info note
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              l10n.notificationsInfoNote,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(BuildContext context, int hour, int minute) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, hour, minute);
    final hourFormat = MediaQuery.of(context).alwaysUse24HourFormat ? 'HH:mm' : 'h:mm a';
    // Using intl would be cleaner but keeping it simple
    if (MediaQuery.of(context).alwaysUse24HourFormat) {
      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    }
    final period = hour >= 12 ? 'PM' : 'AM';
    final h = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$h:${minute.toString().padLeft(2, '0')} $period';
  }

  Future<void> _showTimePicker(
    BuildContext context,
    WidgetRef ref,
    NotificationPreferences prefs,
  ) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: prefs.dailyReminderHour,
        minute: prefs.dailyReminderMinute,
      ),
    );
    if (picked != null) {
      ref.read(notificationPreferencesProvider.notifier).setDailyReminderTime(
        picked.hour,
        picked.minute,
      );
    }
  }
}
