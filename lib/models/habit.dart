class Habit {
  final String id;
  final String name;
  final String? description;
  final String defaultTime;
  final IconType icon;
  final bool isCustom;

  const Habit({
    required this.id,
    required this.name,
    this.description,
    required this.defaultTime,
    this.icon = IconType.pray,
    this.isCustom = false,
  });

  Habit copyWith({
    String? id,
    String? name,
    String? description,
    String? defaultTime,
    IconType? icon,
    bool? isCustom,
  }) {
    return Habit(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      defaultTime: defaultTime ?? this.defaultTime,
      icon: icon ?? this.icon,
      isCustom: isCustom ?? this.isCustom,
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
