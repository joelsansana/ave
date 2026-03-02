class Saint {
  final String id;
  final String name;
  final String feastDay;
  final String bio;
  final String? quote;
  final String? imageUrl;

  const Saint({
    required this.id,
    required this.name,
    required this.feastDay,
    required this.bio,
    this.quote,
    this.imageUrl,
  });
}
