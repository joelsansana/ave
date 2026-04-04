import 'package:flutter/material.dart';
import 'package:habitos/l10n/app_localizations.dart';
import '../data/prayers_data.dart';
import '../data/rosary_mysteries.dart';

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
    _tabController = TabController(length: 5, vsync: this);
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
            Tab(text: 'Música'),
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
          _MusicTab(),
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

  String _getDayName(int weekday) {
    const days = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo'];
    return days[weekday - 1];
  }

  Color _getMysteryColor(String colorName) {
    switch (colorName) {
      case 'yellow': return Colors.yellow.shade700;
      case 'lightBlue': return Colors.lightBlue;
      case 'red': return Colors.red.shade700;
      case 'blue': return Colors.blue.shade700;
      default: return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final todaysMystery = RosaryMysteries.getTodaysMysteries();
    final dayName = _getDayName(DateTime.now().weekday);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mistérios do Dia
          Card(
            color: _getMysteryColor(todaysMystery.color).withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today, color: _getMysteryColor(todaysMystery.color)),
                      const SizedBox(width: 8),
                      Text(
                        'Mistérios de Hoje',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$dayName-feira: ${todaysMystery.title}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    todaysMystery.subtitle,
                    style: Theme.of(context).textTheme.bodySmall,
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

          // Mistérios - all mysteries with expandable content
          Text(
            'Todos os Mistérios',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),

          ...RosaryMysteries.getAll().map((mystery) => _MysteryExpandable(
            mystery: mystery,
            color: _getMysteryColor(mystery.color),
          )),
        ],
      ),
    );
  }

  String _getPrayerContent(String prayer) {
    switch (prayer) {
      case 'Sinal da Cruz':
        return '✠ Em nome do Pai e do Filho e do Espírito Santo.\n\n℟. Amen.';
      case 'Credo':
        return 'Creio em Deus, Pai todo-poderoso, Criador do Céu e da Terra;\ne em Jesus Cristo, seu único Filho, Nosso Senhor,\nque foi concebido pelo poder do Espírito Santo;\nnasceu da Virgem Maria;\npadeceu sob Pôncio Pilatos,\nfoi crucificado, morto e sepultado;\ndesceu à mansão dos mortos;\nressuscitou ao terceiro dia;\nsubiu aos Céus, onde está sentado à direita de Deus Pai todo-poderoso,\nde onde há-de vir a julgar os vivos e os mortos.\nCreio no Espírito Santo,\nna santa Igreja Católica,\nna comunhão dos Santos,\nna remissão dos pecados,\nna ressurreição da carne,\nna vida eterna. Amen.';
      case 'Pai Nosso':
        return 'Pai Nosso, que estais nos céus,\nsantificado seja o Vosso Nome,\nvenha a nós o Vosso Reino;\nseja feita a Vossa vontade assim na terra como no Céu.\n\nO pão nosso de cada dia nos dai hoje;\nperdoai-nos as nossas dívidas,\nassim como nós perdoamos aos nossos devedores;\ne não nos deixeis cair em tentação;\nmas livrai-nos do mal. Amen.';
      case 'Ave Maria':
        return 'Ave Maria, cheia de graça,\no Senhor é convosco.\nBendita sois vós entre as mulheres\ne bendito é o fruto do vosso ventre, Jesus.\n\nSanta Maria, Mãe de Deus,\nrogai por nós, pecadores,\nagora e na hora da nossa morte.\nAmén.';
      case 'Glória':
        return 'Glória ao Pai, e ao Filho e ao Espírito Santo.\nAssim como era no princípio, agora e sempre,\ne por todos os séculos dos séculos.\nAmen.';
      case 'Salve Rainha':
        return 'Salvé, Rainha, mãe de misericórdia,\nvida, doçura, esperança nossa, salve!\nA Vós bradamos, os degredados filhos de Eva.\nA Vós suspiramos, gemendo e chorando neste vale de lágrimas.\n\nEia, pois, advogada nossa,\nesses Vossos olhos misericordiosos a nós volvei.\nE, depois deste desterro, nos mostrai Jesus,\nbendito fruto do Vosso ventre.\n\nÓ clemente, ó piedosa, ó doce Virgem Maria!';
      case 'Oferecimento':
        return 'Santíssima Virgem, Mãe de Deus,\neu Vos ofereço este rosário em desagravo\ndo Santíssimo Coração de Nosso Senhor Jesus Cristo,\nVosso Filho,\ne em desagrado do Vosso Coração Imaculado;\npelas intenções que Vos apresento.\n\nSantíssima Virgem, rogai por nós.';
      default:
        return '';
    }
  }

  void _showPrayerDialog(BuildContext context, String prayer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(prayer),
        content: SingleChildScrollView(
          child: Text(_getPrayerContent(prayer)),
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

class _MysteryExpandable extends StatelessWidget {
  final RosaryMystery mystery;
  final Color color;

  const _MysteryExpandable({
    required this.mystery,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: const Icon(Icons.star, color: Colors.white, size: 20),
        ),
        title: Text(mystery.title),
        subtitle: Text(mystery.subtitle),
        children: mystery.meditations.map((m) => _MysteryMeditationTile(meditation: m, color: color)).toList(),
      ),
    );
  }
}

class _MysteryMeditationTile extends StatelessWidget {
  final MysteryMeditation meditation;
  final Color color;

  const _MysteryMeditationTile({
    required this.meditation,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showMysteryDialog(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  meditation.decade.split('º')[0],
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meditation.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    meditation.scripture,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }

  void _showMysteryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(meditation.decade),
            Text(
              meditation.scripture,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                meditation.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const Divider(),
              Text(
                meditation.meditation,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
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

class _MusicTab extends StatelessWidget {
  const _MusicTab();

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
                  Row(
                    children: [
                      const Icon(Icons.music_note, size: 28),
                      const SizedBox(width: 8),
                      Text(
                        'Música para Oração',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Cânticos gregorianos para meditação e reflexão',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // YouTube embed
          Card(
            clipBehavior: Clip.antiAlias,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.black,
                child: const Center(
                  child: Icon(
                    Icons.play_circle_fill,
                    size: 64,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          
          // Link to open in YouTube
          Card(
            child: ListTile(
              leading: const Icon(Icons.open_in_new),
              title: const Text('Abrir no YouTube'),
              subtitle: const Text('Gregorian Chant - Psalm 23'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Use url_launcher to open YouTube
              },
            ),
          ),
          const SizedBox(height: 16),
          
          // Info card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sobre este vídeo',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'O canto gregoriano é a forma de música sacra monocórdica praticada na Igreja Católica durante a Idade Média. É conhecido pela sua simplicidade, melancolia e capacidade de induzir à contemplação e oração.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
