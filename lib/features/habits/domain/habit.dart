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
