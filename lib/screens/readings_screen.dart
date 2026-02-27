import 'package:flutter/material.dart';

class ReadingsScreen extends StatefulWidget {
  const ReadingsScreen({super.key});

  @override
  State<ReadingsScreen> createState() => _ReadingsScreenState();
}

class _ReadingsScreenState extends State<ReadingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Daily'),
            Tab(text: 'Lectio'),
            Tab(text: 'Prayers'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _DailyReadingsTab(),
          _LectioDivinaTab(),
          _PrayersTab(),
        ],
      ),
    );
  }
}

class _DailyReadingsTab extends StatelessWidget {
  const _DailyReadingsTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'February 27, 2026',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          
          _ReadingCard(
            title: 'First Reading',
            reference: 'Genesis 22:1-18',
            text: 'God tested Abraham and said to him, "Take your son, your only son Isaac, whom you love, and go to the land of Moriah, and offer him there as a burnt offering..."',
          ),
          const SizedBox(height: 12),
          
          _ReadingCard(
            title: 'Responsorial Psalm',
            reference: 'Psalm 116',
            text: 'I will walk in the presence of the Lord, in the land of the living.',
          ),
          const SizedBox(height: 12),
          
          _ReadingCard(
            title: 'Gospel',
            reference: 'Mark 9:2-10',
            text: 'And a cloud overshadowed them, and a voice came out of the cloud, "This is my beloved Son; listen to him."',
          ),
        ],
      ),
    );
  }
}

class _ReadingCard extends StatelessWidget {
  final String title;
  final String reference;
  final String text;

  const _ReadingCard({
    required this.title,
    required this.reference,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              reference,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class _LectioDivinaTab extends StatelessWidget {
  const _LectioDivinaTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lectio Divina',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A slow, prayerful way to read Scripture',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          _LectioStep(
            step: '1',
            title: 'Lectio (Reading)',
            description: 'Read the passage slowly. What words or phrases stand out?',
            color: Colors.blue,
          ),
          _LectioStep(
            step: '2',
            title: 'Meditatio (Meditation)',
            description: 'Reflect on what God is saying to you. What does this mean for your life?',
            color: Colors.green,
          ),
          _LectioStep(
            step: '3',
            title: 'Oratio (Prayer)',
            description: 'Respond to God in prayer. What is your heart saying?',
            color: Colors.orange,
          ),
          _LectioStep(
            step: '4',
            title: 'Contemplatio (Contemplation)',
            description: 'Rest in God\'s presence. Simply be with Him.',
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class _LectioStep extends StatelessWidget {
  final String step;
  final String title;
  final String description;
  final Color color;

  const _LectioStep({
    required this.step,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Text(step, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrayersTab extends StatelessWidget {
  const _PrayersTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _PrayerCard(
          title: 'Morning Prayer',
          text: 'Lord, thank you for this new day. Guide my steps and help me live for you.',
        ),
        _PrayerCard(
          title: 'Evening Prayer',
          text: 'Thank you for this day. Forgive my sins and bless my sleep.',
        ),
        _PrayerCard(
          title: 'St. Michael Prayer',
          text: 'St. Michael the Archangel, defend us in battle...',
        ),
        _PrayerCard(
          title: 'Hail Mary',
          text: 'Hail Mary, full of grace, the Lord is with thee...',
        ),
      ],
    );
  }
}

class _PrayerCard extends StatelessWidget {
  final String title;
  final String text;

  const _PrayerCard({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: Text(title),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
