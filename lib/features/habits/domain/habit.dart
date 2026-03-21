class Habit {
  final String id;
  final String name;
  final String? description;
  final String defaultTime;
  final IconType icon;
  final bool isCustom;
  final List<DateTime> completedDates;

  const Habit({
    required this.id,
    required this.name,
    this.description,
    required this.defaultTime,
    this.icon = IconType.pray,
    this.isCustom = false,
    this.completedDates = const [],
  });

  Habit copyWith({
    String? id,
    String? name,
    String? description,
    String? defaultTime,
    IconType? icon,
    bool? isCustom,
    List<DateTime>? completedDates,
  }) {
    return Habit(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      defaultTime: defaultTime ?? this.defaultTime,
      icon: icon ?? this.icon,
      isCustom: isCustom ?? this.isCustom,
      completedDates: completedDates ?? this.completedDates,
    );
  }

  /// Calculate current streak (consecutive days completed)
  int get currentStreak {
    if (completedDates.isEmpty) return 0;
    
    final sortedDates = completedDates.toList()..sort((a, b) => b.compareTo(a));
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    
    // Check if completed today or yesterday
    final mostRecent = DateTime(sortedDates.first.year, sortedDates.first.month, sortedDates.first.day);
    final daysDiff = todayOnly.difference(mostRecent).inDays;
    
    if (daysDiff > 1) return 0; // Streak broken
    
    int streak = 0;
    DateTime checkDate = daysDiff == 0 ? todayOnly : todayOnly.subtract(const Duration(days: 1));
    
    for (final date in sortedDates) {
      final dateOnly = DateTime(date.year, date.month, date.day);
      if (dateOnly == checkDate) {
        streak++;
        checkDate = checkDate.subtract(const Duration(days: 1));
      } else if (dateOnly.isBefore(checkDate)) {
        break;
      }
    }
    
    return streak;
  }

  /// Calculate longest streak ever
  int get longestStreak {
    if (completedDates.isEmpty) return 0;
    
    final sortedDates = completedDates.toList()..sort();
    int maxStreak = 1;
    int currentStreak = 1;
    
    for (int i = 1; i < sortedDates.length; i++) {
      final prevDate = DateTime(sortedDates[i-1].year, sortedDates[i-1].month, sortedDates[i-1].day);
      final currDate = DateTime(sortedDates[i].year, sortedDates[i].month, sortedDates[i].day);
      final diff = currDate.difference(prevDate).inDays;
      
      if (diff == 1) {
        currentStreak++;
        maxStreak = currentStreak > maxStreak ? currentStreak : maxStreak;
      } else if (diff > 1) {
        currentStreak = 1;
      }
    }
    
    return maxStreak;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'defaultTime': defaultTime,
      'icon': icon.name,
      'isCustom': isCustom,
      'completedDates': completedDates.map((d) => d.toIso8601String()).toList(),
    };
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      defaultTime: json['defaultTime'] as String,
      icon: IconType.values.firstWhere(
        (e) => e.name == json['icon'],
        orElse: () => IconType.pray,
      ),
      isCustom: json['isCustom'] as bool? ?? false,
      completedDates: (json['completedDates'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          [],
    );
  }
}

enum IconType {
  pray,
  book,
  heart,
  church,
  star,
  sun,
}
