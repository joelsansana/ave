import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'lectio_providers.dart';
import '../../../l10n/app_localizations.dart';

class LectioScreen extends ConsumerWidget {
  const LectioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lectioAsync = ref.watch(lectioOfDayProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lectio Divina'),
        centerTitle: true,
      ),
      body: lectioAsync.when(
        data: (lectio) => _LectioContent(lectio: lectio),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
      ),
    );
  }
}

class _LectioContent extends ConsumerWidget {
  final dynamic lectio;

  const _LectioContent({required this.lectio});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stage = ref.watch(lectioStageProvider);

    return Column(
      children: [
        // Stage indicator
        _StageIndicator(stage: stage),
        // Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title card
                Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          lectio.title,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          lectio.reference,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.8),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          lectio.introduction,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Stage content
                _StageContent(stage: stage, lectio: lectio),
              ],
            ),
          ),
        ),
        // Navigation buttons
        _NavigationButtons(stage: stage, ref: ref),
      ],
    );
  }
}

class _StageIndicator extends StatelessWidget {
  final LectioStage stage;

  const _StageIndicator({required this.stage});

  @override
  Widget build(BuildContext context) {
    final stages = [
      (LectioStage.lectio, 'Lectio', Icons.menu_book),
      (LectioStage.meditatio, 'Meditatio', Icons.psychology),
      (LectioStage.oratio, 'Oratio', Icons.favorite),
      (LectioStage.contemplatio, 'Contemplatio', Icons.spa),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: stages.map((s) {
          final isActive = stage == s.$1;
          final isPast = stage.index > s.$1.index;
          return _StageDot(
            label: s.$2,
            icon: s.$3,
            isActive: isActive,
            isPast: isPast,
          );
        }).toList(),
      ),
    );
  }
}

class _StageDot extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final bool isPast;

  const _StageDot({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.isPast,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? Theme.of(context).colorScheme.primary
        : isPast
            ? Theme.of(context).colorScheme.secondary
            : Colors.grey;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : isPast
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey.shade300,
          ),
          child: Icon(
            icon,
            size: 18,
            color: isActive || isPast ? Colors.white : Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _StageContent extends StatelessWidget {
  final LectioStage stage;
  final dynamic lectio;

  const _StageContent({required this.stage, required this.lectio});

  @override
  Widget build(BuildContext context) {
    switch (stage) {
      case LectioStage.lectio:
        return _LectioStage(lectio: lectio);
      case LectioStage.meditatio:
        return _MeditatioStage(lectio: lectio);
      case LectioStage.oratio:
        return _OratioStage(lectio: lectio);
      case LectioStage.contemplatio:
        return _ContemplatioStage(lectio: lectio);
    }
  }
}

class _LectioStage extends StatelessWidget {
  final dynamic lectio;

  const _LectioStage({required this.lectio});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StageHeader(
          icon: Icons.menu_book,
          title: 'Lectio — Leitura',
          subtitle: 'Leia lentamente o texto sagrado',
          color: Colors.blue,
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              lectio.lectioText,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                height: 1.8,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _ReflectionCard(
          icon: Icons.help_outline,
          title: 'Para Reflexão',
          text: lectio.lectioQuestion,
          color: Colors.blue,
        ),
      ],
    );
  }
}

class _MeditatioStage extends StatelessWidget {
  final dynamic lectio;

  const _MeditatioStage({required this.lectio});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StageHeader(
          icon: Icons.psychology,
          title: 'Meditatio — Meditação',
          subtitle: 'Reflicta sobre o que Deus lhe diz',
          color: Colors.orange,
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              lectio.meditatioText,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                height: 1.7,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _ReflectionCard(
          icon: Icons.help_outline,
          title: 'Para Reflexão',
          text: lectio.meditatioQuestion,
          color: Colors.orange,
        ),
      ],
    );
  }
}

class _OratioStage extends StatelessWidget {
  final dynamic lectio;

  const _OratioStage({required this.lectio});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StageHeader(
          icon: Icons.favorite,
          title: 'Oratio — Oração',
          subtitle: 'Responda a Deus em oração',
          color: Colors.red,
        ),
        const SizedBox(height: 16),
        Card(
          color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              lectio.oratioText,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                height: 1.7,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _ReflectionCard(
          icon: Icons.edit_note,
          title: 'Momento de Oração',
          text: lectio.oratioPrompt,
          color: Colors.red,
        ),
        const SizedBox(height: 16),
        // Prayer text field
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Escreva a sua resposta a Deus:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Deixe aqui os seus pensamentos, agradecimentos ou pedidos...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ContemplatioStage extends StatelessWidget {
  final dynamic lectio;

  const _ContemplatioStage({required this.lectio});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StageHeader(
          icon: Icons.spa,
          title: 'Contemplatio — Contemplação',
          subtitle: 'Descanse na presença de Deus',
          color: Colors.green,
        ),
        const SizedBox(height: 16),
        Card(
          color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(
                  Icons.self_improvement,
                  size: 48,
                  color: Colors.green,
                ),
                const SizedBox(height: 16),
                Text(
                  lectio.contemplatioText,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    height: 1.7,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        _ReflectionCard(
          icon: Icons.lightbulb_outline,
          title: 'Para Interiorizar',
          text: lectio.contemplatioPrompt,
          color: Colors.green,
        ),
        const SizedBox(height: 16),
        Card(
          color: Colors.green.shade50,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  '🙏',
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 12),
                Text(
                  'Que esta Lectio Divina vos aproxime de Deus.\n\nGuarde no coração a palavra ou frase que mais o tocou.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StageHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _StageHeader({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReflectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  final Color color;

  const _ReflectionCard({
    required this.icon,
    required this.title,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationButtons extends StatelessWidget {
  final LectioStage stage;
  final WidgetRef ref;

  const _NavigationButtons({required this.stage, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (stage != LectioStage.lectio)
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  ref.read(lectioStageProvider.notifier).state =
                      LectioStage.values[stage.index - 1];
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Anterior'),
              ),
            ),
          if (stage != LectioStage.lectio) const SizedBox(width: 12),
          Expanded(
            child: FilledButton.icon(
              onPressed: () {
                if (stage == LectioStage.contemplatio) {
                  // Reset to beginning
                  ref.read(lectioStageProvider.notifier).state = LectioStage.lectio;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Lectio Divina concluída. Que Deus vos abençoe!'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  ref.read(lectioStageProvider.notifier).state =
                      LectioStage.values[stage.index + 1];
                }
              },
              icon: Icon(
                stage == LectioStage.contemplatio ? Icons.refresh : Icons.arrow_forward,
              ),
              label: Text(
                stage == LectioStage.contemplatio ? 'Recomeçar' : 'Seguinte',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
