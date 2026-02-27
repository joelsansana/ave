import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../models/saint.dart';
import '../services/habit_service.dart';
import '../services/saint_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Habit> _habits = HabitService.getDefaultHabits();
  Saint? _saintOfDay;

  @override
  void initState() {
    super.initState();
    _loadSaintOfDay();
  }

  Future<void> _loadSaintDay() async {
    final saint = await SaintService.getSaintOfDay();
    setState(() {
      _saintOfDay = saint;
    });
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final liturgicalSeason = _getLiturgicalSeason(today);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ave'),
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
              const _LoadingCard(title: 'Saint of the Day'),
            const SizedBox(height: 16),

            // Today's Habits
            Text(
              'Today\'s Habits',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            ..._habits.map((habit) => _HabitTile(habit: habit)),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          // Navigate to different screens
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(Icons.book_outlined),
            selectedIcon: Icon(Icons.book),
            label: 'Read',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  String _getLiturgicalSeason(DateTime date) {
    // Simple season detection
    final month = date.month;
    if (month >= 1 && month <= 2 || month == 12) {
      return 'Advent';
    } else if (month >= 3 && month <= 5) {
      return 'Lent';
    } else if (month == 6) {
      return 'Ordinary Time';
    } else {
      return 'Ordinary Time';
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
                  'Liturgical Season',
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
                  'Saint of the Day',
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
              'Feast: ${saint.feastDay}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Text(saint.bio),
            const SizedBox(height: 8),
            Text(
              '"${saint.quote}"',
              style: Theme.of(context).textTheme.bodyMedium?.italic,
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

class _HabitTile extends StatefulWidget {
  final Habit habit;

  const _HabitTile({required this.habit});

  @override
  State<_HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<_HabitTile> {
  bool _completed = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Checkbox(
          value: _completed,
          onChanged: (value) {
            setState(() {
              _completed = value ?? false;
            });
          },
        ),
        title: Text(
          widget.habit.name,
          style: TextStyle(
            decoration: _completed ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(widget.habit.defaultTime),
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
