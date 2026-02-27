import '../models/saint.dart';

class SaintService {
  // Demo data - in production, fetch from API
  static final List<Saint> _saints = [
    const Saint(
      id: '1',
      name: 'St. Francis of Assisi',
      feastDay: 'October 4',
      bio: 'Founder of the Franciscan Order. Known for his love of nature and poverty.',
      quote: 'Start by doing what\'s necessary; then do what\'s possible; and suddenly you are doing the impossible.',
    ),
    const Saint(
      id: '2',
      name: 'St. Teresa of Avila',
      feastDay: 'October 15',
      bio: 'Spanish mystic and Carmelite reformer. First woman to be named a Doctor of the Church.',
      quote: 'God, give me the grace to be recollected. Let me have the humility to be under all.',
    ),
    const Saint(
      id: '3',
      name: 'St. Josemaría Escrivá',
      feastDay: 'October 26',
      bio: 'Founder of Opus Dei. Saint of the ordinary work.',
      quote: 'Holiness is not a question of feeling. It is a question of action.',
    ),
    const Saint(
      id: '4',
      name: 'St. John Paul II',
      feastDay: 'October 22',
      bio: 'Pope who helped end communism and promote religious freedom.',
      quote: 'Do not be afraid. Open wide the doors to Christ.',
    ),
    const Saint(
      id: '5',
      name: 'St. Augustine',
      feastDay: 'August 28',
      bio: 'One of the most influential Church Fathers. Wrote Confessions.',
      quote: 'Our hearts are restless until they rest in You.',
    ),
  ];

  static Future<Saint> getSaintOfDay() async {
    // In production, fetch from API based on date
    // For demo, return random saint
    await Future.delayed(const Duration(milliseconds: 100));
    final dayOfYear = DateTime.now().difference(DateTime(DateTime.now().year, 1, 1)).inDays;
    return _saints[dayOfYear % _saints.length];
  }

  static Future<List<Saint>> getAllSaints() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _saints;
  }
}
