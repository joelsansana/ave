import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationSettings {
  bool morningPrayerReminder = true;
  bool eveningPrayerReminder = true;
  bool rosaryReminder = true;
  bool dailyReadingReminder = false;
  int morningReminderHour = 7;
  int morningReminderMinute = 0;
  int eveningReminderHour = 21;
  int eveningReminderMinute = 0;
}

final notificationSettingsProvider = 
    StateNotifierProvider<NotificationSettingsNotifier, NotificationSettings>((ref) {
  return NotificationSettingsNotifier();
});

class NotificationSettingsNotifier extends StateNotifier<NotificationSettings> {
  NotificationSettingsNotifier() : super(NotificationSettings());

  void toggleMorningReminder(bool value) {
    state.morningPrayerReminder = value;
    state = state;
  }

  void toggleEveningReminder(bool value) {
    state.eveningPrayerReminder = value;
    state = state;
  }

  void toggleRosaryReminder(bool value) {
    state.rosaryReminder = value;
    state = state;
  }

  void toggleDailyReadingReminder(bool value) {
    state.dailyReadingReminder = value;
    state = state;
  }

  void setMorningTime(TimeOfDay time) {
    state.morningReminderHour = time.hour;
    state.morningReminderMinute = time.minute;
    state = state;
  }

  void setEveningTime(TimeOfDay time) {
    state.eveningReminderHour = time.hour;
    state.eveningReminderMinute = time.minute;
    state = state;
  }
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(notificationSettingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Definições'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Notifications Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Notificações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          
          // Morning Prayer Reminder
          SwitchListTile(
            title: const Text('Lembrete de Oração da Manhã'),
            subtitle: Text(
              settings.morningPrayerReminder 
                  ? '${settings.morningReminderHour.toString().padLeft(2, '0')}:${settings.morningReminderMinute.toString().padLeft(2, '0')}'
                  : 'Desativado'
            ),
            value: settings.morningPrayerReminder,
            onChanged: (value) {
              ref.read(notificationSettingsProvider.notifier).toggleMorningReminder(value);
            },
          ),
          
          // Evening Prayer Reminder
          SwitchListTile(
            title: const Text('Lembrete de Oração da Noite'),
            subtitle: Text(
              settings.eveningPrayerReminder
                  ? '${settings.eveningReminderHour.toString().padLeft(2, '0')}:${settings.eveningReminderMinute.toString().padLeft(2, '0')}'
                  : 'Desativado'
            ),
            value: settings.eveningPrayerReminder,
            onChanged: (value) {
              ref.read(notificationSettingsProvider.notifier).toggleEveningReminder(value);
            },
          ),
          
          // Rosary Reminder
          SwitchListTile(
            title: const Text('Lembrete do Rosário'),
            subtitle: const Text('20:00'),
            value: settings.rosaryReminder,
            onChanged: (value) {
              ref.read(notificationSettingsProvider.notifier).toggleRosaryReminder(value);
            },
          ),
          
          // Daily Reading Reminder
          SwitchListTile(
            title: const Text('Lembrete de Leituras Diárias'),
            subtitle: const Text('08:00'),
            value: settings.dailyReadingReminder,
            onChanged: (value) {
              ref.read(notificationSettingsProvider.notifier).toggleDailyReadingReminder(value);
            },
          ),
          
          const Divider(),
          
          // Account Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Conta',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          
          ListTile(
            leading: const Icon(Icons.cloud_sync),
            title: const Text('Sincronizar dados'),
            subtitle: const Text('Guardar na cloud'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Implement sync
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Em desenvolvimento...')),
              );
            },
          ),
          
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Iniciar sessão'),
            subtitle: const Text('Google ou email'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Implement login
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Em desenvolvimento...')),
              );
            },
          ),
          
          const Divider(),
          
          // About Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Sobre',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Versão'),
            subtitle: const Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}
