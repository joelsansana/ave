import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final days = List.generate(30, (i) {
      final day = i + 1;
      return _DayData(
        day: day,
        completed: (i * 3) % 7 == 0,
        streak: (i % 10) < 5,
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendário'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {},
                ),
                Text(
                  'Fevereiro 2026',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatCard(
                  title: 'Sequência Atual',
                  value: '7',
                  icon: Icons.local_fire_department,
                  color: Colors.orange,
                ),
                _StatCard(
                  title: 'Melhor Sequência',
                  value: '21',
                  icon: Icons.emoji_events,
                  color: Colors.amber,
                ),
                _StatCard(
                  title: 'Este Mês',
                  value: '85%',
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                ),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final day = days[index];
                  return _DayCell(data: day);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DayData {
  final int day;
  final bool completed;
  final bool streak;

  _DayData({
    required this.day,
    required this.completed,
    required this.streak,
  });
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
        ),
      ],
    );
  }
}

class _DayCell extends StatelessWidget {
  final _DayData data;

  const _DayCell({required this.data});

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.transparent;
    Color textColor = Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    
    if (data.completed) {
      bgColor = Colors.green.shade100;
    } else if (data.streak) {
      bgColor = Colors.orange.shade50;
    }

    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          '${data.day}',
          style: TextStyle(
            color: textColor,
            fontWeight: data.completed ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }
}
