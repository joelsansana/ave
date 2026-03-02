import 'package:flutter/material.dart';
import 'package:habitos/l10n/app_localizations.dart';
import '../data/prayers_data.dart';

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
    _tabController = TabController(length: 4, vsync: this);
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
        title: Text(AppLocalizations.of(context)!.readingsTitle),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Diário'),
            Tab(text: 'Rosário'),
            Tab(text: 'Via Sacra'),
            Tab(text: 'Orações'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _DailyReadingsTab(),
          _RosarioTab(),
          _ViaSacraTab(),
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

class _RosarioTab extends StatelessWidget {
  const _RosarioTab();

  @override
  Widget build(BuildContext context) {
    final rosario = PrayersData.Rosario;
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mistérios do Dia
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mistérios de Hoje',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Quarta-feira: Mistérios Gloriosos',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Lista de orações
          ...['Sinal da Cruz', 'Credo', 'Oferecimento', 'Pai Nosso', 'Ave Maria', 'Glória', 'Salve Rainha'].map((prayer) => 
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: const Icon(Icons.church),
                title: Text(prayer),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showPrayerDialog(context, prayer),
              ),
            ),
          ),

          const SizedBox(height: 16),
          
          // Mistérios
          Text(
            'Mistérios',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          
          _MysteriosSection(
            title: 'Mistérios Gozosos',
            subtitle: 'Segunda e Quinta',
            color: Colors.yellow,
          ),
          _MysteriosSection(
            title: 'Mistérios Dolorosos',
            subtitle: 'Terça e Sexta',
            color: Colors.red,
          ),
          _MysteriosSection(
            title: 'Mistérios Gloriosos',
            subtitle: 'Quarta, Sábado e Domingo',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  void _showPrayerDialog(BuildContext context, String prayer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(prayer),
        content: SingleChildScrollView(
          child: Text(AppLocalizations.of(context)!.readingsRosaryContent),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.close),
          ),
        ],
      ),
    );
  }
}

class _MysteriosSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const _MysteriosSection({
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: const Icon(Icons.star, color: Colors.white, size: 20),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}

class _ViaSacraTab extends StatelessWidget {
  const _ViaSacraTab();

  @override
  Widget build(BuildContext context) {
    final viaSacra = PrayersData.ViaSacra;
    
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
                    'Via Sacra',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '14 estações de meditação',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Lista das estações
          ...List.generate(14, (index) => 
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red.shade700,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(AppLocalizations.of(context)!.readingsStationX((index + 1).toString())),
                subtitle: Text(AppLocalizations.of(context)!.readingsTapToMeditate),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrayersTab extends StatelessWidget {
  const _PrayersTab();

  @override
  Widget build(context) {
    final prayers = PrayersData.oracoesDiarias;
    
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: prayers.length,
      itemBuilder: (context, index) {
        final prayer = prayers[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ExpansionTile(
            title: Text(prayer['title']!),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(prayer['text']!),
              ),
            ],
          ),
        );
      },
    );
  }
}
