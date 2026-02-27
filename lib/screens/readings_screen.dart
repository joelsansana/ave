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
        title: const Text('Ler'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Diário'),
            Tab(text: 'Lectio'),
            Tab(text: 'Orações'),
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
            '27 de Fevereiro de 2026',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          
          _ReadingCard(
            title: 'Primeira Leitura',
            reference: 'Génesis 22:1-18',
            text: 'Deus Put Abraham à prova e disse-lhe: "Toma o teu filho, o teu filho único Isaac, a quem amas, e vai para a terra de Moriah, e oferece-o ali em sacrifício..."',
          ),
          const SizedBox(height: 12),
          
          _ReadingCard(
            title: 'Salmo Responsorial',
            reference: 'Salmo 116',
            text: 'Andarei na presença do Senhor, na terra dos vivos.',
          ),
          const SizedBox(height: 12),
          
          _ReadingCard(
            title: 'Evangelho',
            reference: 'Marcos 9:2-10',
            text: 'E uma nuvem os cobriu, e veio uma voz da nuvem: "Este é o meu Filho amado; escutai-o."',
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
                    'Uma forma lenta e orante de ler a Escritura',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          _LectioStep(
            step: '1',
            title: 'Lectio (Leitura)',
            description: 'Lê o trecho lentamente. Que palavras ou frases se destacam?',
            color: Colors.blue,
          ),
          _LectioStep(
            step: '2',
            title: 'Meditatio (Meditação)',
            description: 'Reflecte sobre o que Deus te está a dizer. O que isto significa para a tua vida?',
            color: Colors.green,
          ),
          _LectioStep(
            step: '3',
            title: 'Oratio (Oração)',
            description: 'Responde a Deus em oração. O que diz o teu coração?',
            color: Colors.orange,
          ),
          _LectioStep(
            step: '4',
            title: 'Contemplatio (Contemplação)',
            description: 'Repousa na presença de Deus. Simplesmente está com Ele.',
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
          title: 'Oração da Manhã',
          text: 'Senhor, obrigado por este novo dia. Guia os meus passos e ajuda-me a viver para Ti.',
        ),
        _PrayerCard(
          title: 'Oração da Noite',
          text: 'Obrigado por este dia. Perdoa os meus pecados e abençoa o meu sono.',
        ),
        _PrayerCard(
          title: 'Oração a São Miguel',
          text: 'São Miguel Arcanjo, defendei-nos na batalha...',
        ),
        _PrayerCard(
          title: 'Ave Maria',
          text: 'Ave Maria, cheia de graça, o Connosco está...',
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
