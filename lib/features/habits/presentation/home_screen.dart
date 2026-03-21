import 'package:flutter/material.dart';
import 'package:habitos/l10n/app_localizations.dart';
import '../domain/habit.dart';
import '../../readings/domain/saint.dart';
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
  bool _isLoadingSaint = true;
  String? _saintError;

  @override
  void initState() {
    super.initState();
    _loadSaintOfDay();
  }

  Future<void> _loadSaintOfDay() async {
    setState(() {
      _isLoadingSaint = true;
      _saintError = null;
    });
    
    try {
      final saint = await SaintService.getSaintOfDay();
      if (mounted) {
        setState(() {
          _saintOfDay = saint;
          _isLoadingSaint = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _saintError = e.toString();
          _isLoadingSaint = false;
        });
      }
    }
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
            _LiturgicalCard(
              season: liturgicalSeason,
              color: _getLiturgicalColor(liturgicalSeason),
              colorName: _getLiturgicalColorName(liturgicalSeason),
            ),
            const SizedBox(height: 16),

            // Saint of the Day
            if (_saintError != null)
              _ErrorCard(
                title: 'Santo do Dia',
                message: 'Não foi possível carregar',
                onRetry: _loadSaintOfDay,
              )
            else if (_isLoadingSaint)
              const _LoadingCard(title: 'Santo do Dia')
            else if (_saintOfDay != null)
              _SaintCard(saint: _saintOfDay!)
            else
              const _ErrorCard(
                title: 'Santo do Dia',
                message: 'Dados não disponíveis',
                onRetry: null,
              ),
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

  // Liturgical colors based on season
  Color _getLiturgicalColor(String season) {
    switch (season) {
      case 'Advento':
        return const Color(0xFF6B4E71); // Violet/Purple
      case 'Quaresma':
        return const Color(0xFF8B4513); // Brown/Purple
      case 'Páscoa':
        return const Color(0xFFFFD700); // Gold/White
      case 'Tempo Comum':
        return const Color(0xFF228B22); // Green
      default:
        return const Color(0xFF228B22); // Green
    }
  }

  String _getLiturgicalColorName(String season) {
    switch (season) {
      case 'Advento':
        return 'Roxo';
      case 'Quaresma':
        return 'Roxo/Marrom';
      case 'Páscoa':
        return 'Dourado/Branco';
      case 'Tempo Comum':
        return 'Verde';
      default:
        return 'Verde';
    }
  }
}

class _LiturgicalCard extends StatelessWidget {
  final String season;
  final Color color;
  final String colorName;

  const _LiturgicalCard({
    required this.season,
    required this.color,
    required this.colorName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.church, size: 24, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  season,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    Text(
                      'Tempo Litúrgico',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        colorName,
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ],
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

class _ErrorCard extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;

  const _ErrorCard({
    required this.title,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Tentar novamente'),
              ),
            ],
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
    final streak = habit.currentStreak;

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
            color: isCompleted ? Colors.grey : null,
          ),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.access_time,
              size: 14,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 4),
            Text(
              habit.defaultTime,
              style: TextStyle(color: Colors.grey[600]),
            ),
            if (streak > 0) ...[
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.local_fire_department, size: 14, color: Colors.orange[700]),
                    const SizedBox(width: 2),
                    Text(
                      '$streak dia${streak > 1 ? 's' : ''}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {
            _showReminderDialog(context, ref);
          },
        ),
      ),
    );
  }

  void _showReminderDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Lembrete: ${habit.name}'),
        content: Text('Lembrete diário às ${habit.defaultTime}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement notification scheduling
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Lembrete configurado para ${habit.defaultTime}')),
              );
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}
