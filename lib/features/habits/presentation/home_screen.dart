import 'package:flutter/material.dart';
import 'package:habitos/l10n/app_localizations.dart';
import '../domain/habit.dart';
import '../../readings/domain/saint.dart';
import '../data/habit_service.dart';
import '../../readings/data/saint_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'habit_providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Saint? _saintOfDay;

  @override
  void initState() {
    super.initState();
    _loadSaintOfDay();
  }

  Future<void> _loadSaintOfDay() async {
    final saint = await SaintService.getSaintOfDay();
    setState(() {
      _saintOfDay = saint;
    });
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final liturgicalSeason = _getLiturgicalSeason(today);
    final habits = ref.watch(habitsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.habitsTitle),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Liturgical Season Card
            _LiturgicalCard(season: liturgicalSeason),
            const SizedBox(height: 16),

            // Saint of the Day
            if (_saintOfDay != null)
              _SaintCard(saint: _saintOfDay!)
            else
              const _LoadingCard(title: 'Santo do Dia'),
            const SizedBox(height: 16),

            // Today's Habits
            Text(
              'Hábitos de Hoje',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            ...habits.map((habit) => _HabitTile(habit: habit)),
          ],
        ),
      ),
    );
  }

  String _getLiturgicalSeason(DateTime date) {
    final month = date.month;
    if (month >= 1 && month <= 2 || month == 12) {
      return 'Advento';
    } else if (month >= 3 && month <= 5) {
      return 'Quaresma';
    } else if (month == 6) {
      return 'Tempo Comum';
    } else {
      return 'Tempo Comum';
    }
  }
}

class _LiturgicalCard extends StatelessWidget {
  final String season;

  const _LiturgicalCard({required this.season});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.church, size: 40),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  season,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Tempo Litúrgico',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SaintCard extends StatelessWidget {
  final Saint saint;

  const _SaintCard({required this.saint});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 8),
                Text(
                  'Santo do Dia',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              saint.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Festividade: ${saint.feastDay}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Text(saint.bio),
            const SizedBox(height: 8),
            Text(
              '"${saint.quote}"',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  final String title;

  const _LoadingCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}

class _HabitTile extends ConsumerWidget {
  final Habit habit;

  const _HabitTile({required this.habit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateTime.now();
    final isCompleted = habit.completedDates.any((d) => 
      d.year == today.year && d.month == today.month && d.day == today.day);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Checkbox(
          value: isCompleted,
          onChanged: (value) {
            ref.read(habitsProvider.notifier).toggleHabitCompletion(habit.id, today);
          },
        ),
        title: Text(
          habit.name,
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(habit.defaultTime),
        trailing: IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {
            // Set reminder
          },
        ),
      ),
    );
  }
}
