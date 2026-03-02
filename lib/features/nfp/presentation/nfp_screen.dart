import 'package:flutter/material.dart';
import 'package:habitos/l10n/app_localizations.dart';
import '../domain/nfp_data.dart';
import '../data/nfp_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'nfp_providers.dart';

class NFPScreen extends ConsumerStatefulWidget {
  const NFPScreen({super.key});

  @override
  ConsumerState<NFPScreen> createState() => _NFPScreenState();
}

class _NFPScreenState extends ConsumerState<NFPScreen> with SingleTickerProviderStateMixin {
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
    final today = DateTime.now();
    final cycleDays = ref.watch(nfpProvider);
    final stats = NFPService.calculateStats(cycleDays);
    
    final cycleDay = stats.lastPeriodStart != null 
        ? NFPService.getCycleDay(today, stats.lastPeriodStart!) 
        : 1;
    final phase = NFPService.getPhase(cycleDay, stats.averageCycleLength);
    final fertilityStatus = NFPService.getFertilityStatus(cycleDay, stats.averageCycleLength);
    
    final todayData = cycleDays.where((d) => 
        d.date.year == today.year && 
        d.date.month == today.month && 
        d.date.day == today.day).firstOrNull;

    void updateDayData({
      bool? isPeriodDay,
      double? temperature,
      bool clearTemperature = false,
      MucusType? mucusType,
      bool clearMucus = false,
      Mood? mood,
      bool clearMood = false,
      List<Symptom>? symptoms,
    }) {
      final currentDay = todayData ?? CycleDay(
        id: today.toIso8601String(),
        date: today,
        dayOfCycle: cycleDay,
        phase: phase,
      );
      
      final updatedDay = currentDay.copyWith(
        isPeriodDay: isPeriodDay ?? currentDay.isPeriodDay,
        temperature: clearTemperature ? null : (temperature ?? currentDay.temperature),
        mucusType: clearMucus ? null : (mucusType ?? currentDay.mucusType),
        mood: clearMood ? null : (mood ?? currentDay.mood),
        symptoms: symptoms ?? currentDay.symptoms,
      );
      
      ref.read(nfpProvider.notifier).updateDay(updatedDay);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.nfpCycleTab),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Hoje'),
            Tab(text: 'Gráfico'),
            Tab(text: 'Histórico'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _TodayTab(
            cycleDay: cycleDay,
            phase: phase,
            fertilityStatus: fertilityStatus,
            stats: stats,
            lastPeriodStart: stats.lastPeriodStart ?? today,
            isPeriodDay: todayData?.isPeriodDay ?? false,
            temperature: todayData?.temperature,
            mucusType: todayData?.mucusType,
            mood: todayData?.mood,
            symptoms: todayData?.symptoms ?? [],
            onPeriodChanged: (value) => updateDayData(isPeriodDay: value),
            onTemperatureChanged: (value) => updateDayData(temperature: value),
            onMucusChanged: (value) => updateDayData(mucusType: value, clearMucus: value == null),
            onMoodChanged: (value) => updateDayData(mood: value, clearMood: value == null),
            onSymptomToggle: (symptom) {
              final currentSymptoms = List<Symptom>.from(todayData?.symptoms ?? []);
              if (currentSymptoms.contains(symptom)) {
                currentSymptoms.remove(symptom);
              } else {
                currentSymptoms.add(symptom);
              }
              updateDayData(symptoms: currentSymptoms);
            },
          ),
          _ChartTab(cycleDay: cycleDay),
          _HistoryTab(),
        ],
      ),
    );
  }
}

class _TodayTab extends StatelessWidget {
  final int cycleDay;
  final CyclePhase phase;
  final FertilityStatus fertilityStatus;
  final CycleStats stats;
  final DateTime lastPeriodStart;
  final bool isPeriodDay;
  final double? temperature;
  final MucusType? mucusType;
  final Mood? mood;
  final List<Symptom> symptoms;
  final ValueChanged<bool> onPeriodChanged;
  final ValueChanged<double?> onTemperatureChanged;
  final ValueChanged<MucusType?> onMucusChanged;
  final ValueChanged<Mood?> onMoodChanged;
  final ValueChanged<Symptom> onSymptomToggle;

  const _TodayTab({
    required this.cycleDay,
    required this.phase,
    required this.fertilityStatus,
    required this.stats,
    required this.lastPeriodStart,
    required this.isPeriodDay,
    required this.temperature,
    required this.mucusType,
    required this.mood,
    required this.symptoms,
    required this.onPeriodChanged,
    required this.onTemperatureChanged,
    required this.onMucusChanged,
    required this.onMoodChanged,
    required this.onSymptomToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cycle day card
          _CycleDayCard(
            cycleDay: cycleDay,
            phase: phase,
            fertilityStatus: fertilityStatus,
          ),
          const SizedBox(height: 16),

          // Predictions
          if (stats.predictedOvulation != null || stats.predictedNextPeriod != null)
            _PredictionsCard(stats: stats),
          const SizedBox(height: 16),

          // Data entry
          Text(
            'Registar Hoje',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),

          // Period
          SwitchListTile(
            title: Text(AppLocalizations.of(context)!.nfpPeriod),
            subtitle: Text(AppLocalizations.of(context)!.nfpFirstDayOfPeriod),
            value: isPeriodDay,
            onChanged: onPeriodChanged,
          ),
          const SizedBox(height: 8),

          // Temperature
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.nfpBasalTemp),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                          value: temperature ?? 36.5,
                          min: 35.0,
                          max: 38.0,
                          divisions: 30,
                          label: '${(temperature ?? 36.5).toStringAsFixed(1)}°C',
                          onChanged: onTemperatureChanged,
                        ),
                      ),
                      Text('${(temperature ?? 36.5).toStringAsFixed(1)}°C'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Mucus
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.nfpCervicalMucus),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: MucusType.values.map((type) {
                      return ChoiceChip(
                        label: Text(NFPService.getMucusDescription(type)),
                        selected: mucusType == type,
                        onSelected: (selected) {
                          onMucusChanged(selected ? type : null);
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Mood
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.nfpMood),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: Mood.values.map((m) {
                      return ChoiceChip(
                        label: Text(NFPService.getMoodDescription(m)),
                        selected: mood == m,
                        onSelected: (selected) {
                          onMoodChanged(selected ? m : null);
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Symptoms
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.nfpSymptoms),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: Symptom.values.map((s) {
                      return FilterChip(
                        label: Text(NFPService.getSymptomDescription(s)),
                        selected: symptoms.contains(s),
                        onSelected: (_) => onSymptomToggle(s),
                      );
                    }).toList(),
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

class _CycleDayCard extends StatelessWidget {
  final int cycleDay;
  final CyclePhase phase;
  final FertilityStatus fertilityStatus;

  const _CycleDayCard({
    required this.cycleDay,
    required this.phase,
    required this.fertilityStatus,
  });

  Color get _phaseColor {
    switch (phase) {
      case CyclePhase.menstruation:
        return Colors.red;
      case CyclePhase.follicular:
        return Colors.blue;
      case CyclePhase.ovulation:
        return Colors.green;
      case CyclePhase.luteal:
        return Colors.purple;
    }
  }

  String get _phaseName {
    switch (phase) {
      case CyclePhase.menstruation:
        return 'Menstruação';
      case CyclePhase.follicular:
        return 'Fase Folicular';
      case CyclePhase.ovulation:
        return 'Ovulação';
      case CyclePhase.luteal:
        return 'Fase Luteal';
    }
  }

  String get _fertilityText {
    switch (fertilityStatus) {
      case FertilityStatus.fertile:
        return '🌸 Fertilidade máxima';
      case FertilityStatus.possiblyFertile:
        return '🌱 Possivelmente fértil';
      case FertilityStatus.infertile:
        return '⭕ Infertilidade';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _phaseColor.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Dia $cycleDay',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: _phaseColor,
              ),
            ),
            Text(
              _phaseName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _phaseColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _fertilityText,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PredictionsCard extends StatelessWidget {
  final CycleStats stats;

  const _PredictionsCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Previsões',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            if (stats.predictedOvulation != null)
              ListTile(
                leading: const Icon(Icons.egg, color: Colors.green),
                title: Text(AppLocalizations.of(context)!.nfpPredictedOvulation),
                subtitle: Text('${stats.predictedOvulation!.day}/${stats.predictedOvulation!.month}'),
              ),
            if (stats.predictedNextPeriod != null)
              ListTile(
                leading: const Icon(Icons.event, color: Colors.red),
                title: Text(AppLocalizations.of(context)!.nfpNextPeriod),
                subtitle: Text('${stats.predictedNextPeriod!.day}/${stats.predictedNextPeriod!.month}'),
              ),
          ],
        ),
      ),
    );
  }
}

class _ChartTab extends StatelessWidget {
  final int cycleDay;

  const _ChartTab({required this.cycleDay});

  @override
  Widget build(BuildContext context) {
    // Placeholder for chart - would use fl_chart
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.show_chart, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'Gráfico de Temperatura',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Em desenvolvimento...',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _HistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.history),
            title: Text(AppLocalizations.of(context)!.nfpPreviousCycles),
            subtitle: Text(AppLocalizations.of(context)!.nfpInDevelopment),
          ),
        ),
      ],
    );
  }
}
