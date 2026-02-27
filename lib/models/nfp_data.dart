class CycleDay {
  final String id;
  final DateTime date;
  final int dayOfCycle;
  final CyclePhase phase;
  
  // Period
  final bool isPeriodDay;
  final int? flowIntensity; // 1-3 (light, medium, heavy)
  
  // Temperature
  final double? temperature;
  
  // Cervical mucus
  final MucusType? mucusType;
  final int? mucusAmount; // 1-3
  
  // Cervical position
  final CervicalPosition? cervicalPosition;
  
  // Ovulation test
  final bool? ovulationTestPositive;
  
  // Mood & Symptoms
  final Mood? mood;
  final List<Symptom> symptoms;
  
  // Notes
  final String? notes;

  const CycleDay({
    required this.id,
    required this.date,
    required this.dayOfCycle,
    required this.phase,
    this.isPeriodDay = false,
    this.flowIntensity,
    this.temperature,
    this.mucusType,
    this.mucusAmount,
    this.cervicalPosition,
    this.ovulationTestPositive,
    this.mood,
    this.symptoms = const [],
    this.notes,
  });
}

enum CyclePhase {
  menstruation,
  follicular,
  ovulation,
  luteal,
}

enum MucusType {
  dry,
  sticky,
  creamy,
  stretchy,
  wet,
}

enum CervicalPosition {
  low,
  medium,
  high,
}

enum Mood {
  happy,
  calm,
  tired,
  emotional,
  energetic,
  sad,
  anxious,
}

enum Symptom {
  cramps,
  headache,
  bloating,
  breastTenderness,
  acne,
  backPain,
  nausea,
  cravings,
}

class CycleStats {
  final int averageCycleLength;
  final int averagePeriodLength;
  final DateTime? lastPeriodStart;
  final DateTime? predictedOvulation;
  final DateTime? predictedNextPeriod;
  final FertilityStatus fertilityStatus;

  const CycleStats({
    required this.averageCycleLength,
    required this.averagePeriodLength,
    this.lastPeriodStart,
    this.predictedOvulation,
    this.predictedNextPeriod,
    required this.fertilityStatus,
  });
}

enum FertilityStatus {
  fertile,
  possiblyFertile,
  infertile,
}
