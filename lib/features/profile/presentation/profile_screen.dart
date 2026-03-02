import 'package:flutter/material.dart';
import 'package:habitos/l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profileTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            Text(
              'Joel',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Membro desde Fevereiro 2026',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ProfileStat(label: AppLocalizations.of(context)!.profileHabitsCount, value: '6'),
                _ProfileStat(label: AppLocalizations.of(context)!.profileStreakDays, value: '7'),
                _ProfileStat(label: AppLocalizations.of(context)!.profileTotalDays, value: '45'),
              ],
            ),
            const SizedBox(height: 32),

            _MenuItem(
              icon: Icons.notifications,
              title: 'Notificações',
              onTap: () {},
            ),
            _MenuItem(
              icon: Icons.star,
              title: 'Subscrição',
              subtitle: 'Plano Gratuito',
              onTap: () {},
            ),
            _MenuItem(
              icon: Icons.family_restroom,
              title: 'Família',
              onTap: () {},
            ),
            _MenuItem(
              icon: Icons.help,
              title: 'Ajuda e Suporte',
              onTap: () {},
            ),
            _MenuItem(
              icon: Icons.info,
              title: 'Sobre',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
