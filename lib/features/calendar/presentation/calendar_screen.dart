import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../l10n/app_localizations.dart';
import '../../habits/domain/habit.dart';
import '../../habits/presentation/habit_providers.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  late DateTime _focusedMonth;
  late DateTime _today;

  @override
  void initState() {
    super.initState();
    _today = DateTime.now();
    _focusedMonth = DateTime(_today.year, _today.month);
  }

  void _previousMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1);
    });
  }

  String _monthName(int month, AppLocalizations l) {
    const months = [
      'Janeiro', 'Fevereiro', 'Março', 'Abril',
      'Maio', 'Junho', 'Julho', 'Agosto',
      'Setembro', 'Outubro', 'Novembro', 'Dezembro'
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final habits = ref.watch(habitsProvider);
    final completedDays = _calculateCompletedDays(habits);

    final daysInMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1, 0).day;
    final firstDayOfMonth = DateTime(_focusedMonth.year, _focusedMonth.month, 1);
    final startingWeekday = firstDayOfMonth.weekday % 7; // Sunday = 0

    // Streak calculation
    int currentStreak = 0;
    int bestStreak = 0;
    int totalCompleted = 0;

    final sortedDays = completedDays.keys.toList()..sort();
    for (final day in sortedDays) {
      if (completedDays[day] == true) {
        totalCompleted++;
        currentStreak++;
        if (currentStreak > bestStreak) bestStreak = currentStreak;
      } else {
        currentStreak = 0;
      }
    }

    final monthProgress = completedDays.isEmpty
        ? 0
        : (totalCompleted / daysInMonth * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.calendarTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Month navigation
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: _previousMonth,
                ),
                Text(
                  '${_monthName(_focusedMonth.month, AppLocalizations.of(context)!)} ${_focusedMonth.year}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: _nextMonth,
                ),
              ],
            ),
          ),

          // Stats row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatCard(
                  title: 'Sequência Atual',
                  value: '$currentStreak',
                  icon: Icons.local_fire_department,
                  color: Colors.orange,
                ),
                _StatCard(
                  title: 'Melhor Sequência',
                  value: '$bestStreak',
                  icon: Icons.emoji_events,
                  color: Colors.amber,
                ),
                _StatCard(
                  title: 'Este Mês',
                  value: '$monthProgress%',
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Weekday headers
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S']
                  .map((d) => SizedBox(
                        width: 40,
                        child: Text(
                          d,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 8),

          // Calendar grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                ),
                itemCount: startingWeekday + daysInMonth,
                itemBuilder: (context, index) {
                  if (index < startingWeekday) {
                    return const SizedBox();
                  }
                  final day = index - startingWeekday + 1;
                  final date = DateTime(_focusedMonth.year, _focusedMonth.month, day);
                  final isToday = date.year == _today.year &&
                      date.month == _today.month &&
                      date.day == _today.day;
                  final isCompleted = completedDays[date] ?? false;

                  return _DayCell(
                    day: day,
                    isToday: isToday,
                    isCompleted: isCompleted,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Map<DateTime, bool> _calculateCompletedDays(List<Habit> habits) {
    final Map<DateTime, bool> completedDays = {};
    for (final habit in habits) {
      for (final date in habit.completedDates) {
        final dateOnly = DateTime(date.year, date.month, date.day);
        completedDays[dateOnly] = true;
      }
    }
    return completedDays;
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _DayCell extends StatelessWidget {
  final int day;
  final bool isToday;
  final bool isCompleted;

  const _DayCell({
    required this.day,
    required this.isToday,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: isCompleted ? Colors.green.shade100 : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isToday
            ? Border.all(color: Theme.of(context).colorScheme.primary, width: 2)
            : null,
      ),
      child: Center(
        child: Text(
          '$day',
          style: TextStyle(
            fontWeight: isCompleted || isToday ? FontWeight.bold : null,
            color: isCompleted ? Colors.green.shade700 : null,
          ),
        ),
      ),
    );
  }
}
