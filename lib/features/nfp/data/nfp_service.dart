import '../domain/nfp_data.dart';

class NFPService {
  // Default values (can be customized per user)
  static const int defaultCycleLength = 28;
  static const int defaultPeriodLength = 5;
  static const int lutealPhaseLength = 14;

  /// Calculate cycle day based on last period start
  static int getCycleDay(DateTime date, DateTime lastPeriodStart) {
    return date.difference(lastPeriodStart).inDays + 1;
  }

  /// Get cycle phase based on cycle day
  static CyclePhase getPhase(int cycleDay, int cycleLength) {
    if (cycleDay <= 5) {
      return CyclePhase.menstruation;
    } else if (cycleDay < cycleLength - lutealPhaseLength) {
      return CyclePhase.follicular;
    } else if (cycleDay < cycleLength) {
      return CyclePhase.ovulation;
    } else {
      return CyclePhase.luteal;
    }
  }

  /// Predict ovulation date
  static DateTime? predictOvulation(DateTime lastPeriodStart, int cycleLength) {
    final ovulationDay = cycleLength - lutealPhaseLength;
    return lastPeriodStart.add(Duration(days: ovulationDay - 1));
  }

  /// Predict next period
  static DateTime predictNextPeriod(DateTime lastPeriodStart, int cycleLength) {
    return lastPeriodStart.add(Duration(days: cycleLength));
  }

  /// Get fertility status based on cycle day
  static FertilityStatus getFertilityStatus(int cycleDay, int cycleLength) {
    // Fertile window: roughly days 8-19 of cycle
    if (cycleDay >= 8 && cycleDay <= 19) {
      return FertilityStatus.fertile;
    } else if (cycleDay >= 6 && cycleDay <= 7 || cycleDay >= 20 && cycleDay <= 22) {
      return FertilityStatus.possiblyFertile;
    } else {
      return FertilityStatus.infertile;
    }
  }

  /// Calculate cycle stats from history
  static CycleStats calculateStats(List<CycleDay> cycleHistory) {
    if (cycleHistory.isEmpty) {
      return const CycleStats(
        averageCycleLength: defaultCycleLength,
        averagePeriodLength: defaultPeriodLength,
        fertilityStatus: FertilityStatus.infertile,
      );
    }

    // Find period days to calculate average
    int periodDays = 0;
    DateTime? lastPeriodStart;
    
    for (final day in cycleHistory) {
      if (day.isPeriodDay) {
        periodDays++;
        if (lastPeriodStart == null || day.date.isBefore(lastPeriodStart)) {
          lastPeriodStart = day.date;
        }
      }
    }

    // Calculate average cycle length from cycle day jumps
    int totalCycles = 0;
    int totalDays = 0;
    
    // Simple average for now
    final avgCycleLength = defaultCycleLength;
    final avgPeriodLength = periodDays > 0 
        ? (periodDays / (cycleHistory.length > 0 ? 1 : 1)).round()
        : defaultPeriodLength;

    // Get latest fertility status
    final today = DateTime.now();
    final cycleDay = lastPeriodStart != null 
        ? getCycleDay(today, lastPeriodStart) 
        : 1;
    
    final fertilityStatus = getFertilityStatus(cycleDay, avgCycleLength);
    final predictedOvulation = lastPeriodStart != null 
        ? predictOvulation(lastPeriodStart, avgCycleLength) 
        : null;
    final predictedNext = lastPeriodStart != null 
        ? predictNextPeriod(lastPeriodStart, avgCycleLength) 
        : null;

    return CycleStats(
      averageCycleLength: avgCycleLength,
      averagePeriodLength: avgPeriodLength,
      lastPeriodStart: lastPeriodStart,
      predictedOvulation: predictedOvulation,
      predictedNextPeriod: predictedNext,
      fertilityStatus: fertilityStatus,
    );
  }

  /// Get mucus description
  static String getMucusDescription(MucusType? type) {
    switch (type) {
      case MucusType.dry:
        return 'Seco';
      case MucusType.sticky:
        return 'Pegajoso';
      case MucusType.creamy:
        return 'Cremoso';
      case MucusType.stretchy:
        return 'Elástico';
      case MucusType.wet:
        return 'Húmido';
      case null:
        return '-';
    }
  }

  /// Get cervical position description
  static String getCervicalPositionDescription(CervicalPosition? position) {
    switch (position) {
      case CervicalPosition.low:
        return 'Baixa';
      case CervicalPosition.medium:
        return 'Média';
      case CervicalPosition.high:
        return 'Alta';
      case null:
        return '-';
    }
  }

  /// Get mood description
  static String getMoodDescription(Mood mood) {
    switch (mood) {
      case Mood.happy:
        return 'Feliz';
      case Mood.calm:
        return 'Calmo';
      case Mood.tired:
        return 'Cansado';
      case Mood.emotional:
        return 'Emocional';
      case Mood.energetic:
        return 'Energético';
      case Mood.sad:
        return 'Triste';
      case Mood.anxious:
        return 'Ansioso';
    }
  }

  /// Get symptom description
  static String getSymptomDescription(Symptom symptom) {
    switch (symptom) {
      case Symptom.cramps:
        return 'Cólicas';
      case Symptom.headache:
        return 'Dor de cabeça';
      case Symptom.bloating:
        return 'Inchaço';
      case Symptom.breastTenderness:
        return 'Sensibilidade mamária';
      case Symptom.acne:
        return 'Acne';
      case Symptom.backPain:
        return 'Dor nas costas';
      case Symptom.nausea:
        return 'Náusea';
      case Symptom.cravings:
        return 'Fome';
    }
  }
}
