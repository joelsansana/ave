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

  CycleDay copyWith({
    String? id,
    DateTime? date,
    int? dayOfCycle,
    CyclePhase? phase,
    bool? isPeriodDay,
    int? flowIntensity,
    double? temperature,
    MucusType? mucusType,
    int? mucusAmount,
    CervicalPosition? cervicalPosition,
    bool? ovulationTestPositive,
    Mood? mood,
    List<Symptom>? symptoms,
    String? notes,
  }) {
    return CycleDay(
      id: id ?? this.id,
      date: date ?? this.date,
      dayOfCycle: dayOfCycle ?? this.dayOfCycle,
      phase: phase ?? this.phase,
      isPeriodDay: isPeriodDay ?? this.isPeriodDay,
      flowIntensity: flowIntensity ?? this.flowIntensity,
      temperature: temperature ?? this.temperature,
      mucusType: mucusType ?? this.mucusType,
      mucusAmount: mucusAmount ?? this.mucusAmount,
      cervicalPosition: cervicalPosition ?? this.cervicalPosition,
      ovulationTestPositive: ovulationTestPositive ?? this.ovulationTestPositive,
      mood: mood ?? this.mood,
      symptoms: symptoms ?? this.symptoms,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'dayOfCycle': dayOfCycle,
      'phase': phase.name,
      'isPeriodDay': isPeriodDay,
      'flowIntensity': flowIntensity,
      'temperature': temperature,
      'mucusType': mucusType?.name,
      'mucusAmount': mucusAmount,
      'cervicalPosition': cervicalPosition?.name,
      'ovulationTestPositive': ovulationTestPositive,
      'mood': mood?.name,
      'symptoms': symptoms.map((e) => e.name).toList(),
      'notes': notes,
    };
  }

  factory CycleDay.fromJson(Map<String, dynamic> json) {
    return CycleDay(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      dayOfCycle: json['dayOfCycle'] as int,
      phase: CyclePhase.values.firstWhere((e) => e.name == json['phase'], orElse: () => CyclePhase.follicular),
      isPeriodDay: json['isPeriodDay'] as bool? ?? false,
      flowIntensity: json['flowIntensity'] as int?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      mucusType: json['mucusType'] != null ? MucusType.values.firstWhere((e) => e.name == json['mucusType'], orElse: () => MucusType.dry) : null,
      mucusAmount: json['mucusAmount'] as int?,
      cervicalPosition: json['cervicalPosition'] != null ? CervicalPosition.values.firstWhere((e) => e.name == json['cervicalPosition'], orElse: () => CervicalPosition.low) : null,
      ovulationTestPositive: json['ovulationTestPositive'] as bool?,
      mood: json['mood'] != null ? Mood.values.firstWhere((e) => e.name == json['mood'], orElse: () => Mood.calm) : null,
      symptoms: (json['symptoms'] as List<dynamic>?)?.map((e) => Symptom.values.firstWhere((s) => s.name == e)).toList() ?? [],
      notes: json['notes'] as String?,
    );
  }
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
