import '../domain/saint.dart';

class SaintService {
  // Portuguese saints data
  static final List<Saint> _saints = [
    const Saint(
      id: '1',
      name: 'São Francisco de Assis',
      feastDay: '4 de Outubro',
      bio: 'Fundador da Ordem Franciscana. Conhecido pelo seu amor à natureza e pobreza.',
      quote: 'Começa por fazer o necessário; depois faz o que é possível; e de repente estarás a fazer o impossível.',
    ),
    const Saint(
      id: '2',
      name: 'Santa Teresa de Ávila',
      feastDay: '15 de Outubro',
      bio: 'Mística espanhola e reformadora carmelita. Primeira mulher a ser nomeada Doutora da Igreja.',
      quote: 'Deus, dá-me a graça de estar recolhora. Que eu tenha a humildade de estar sob todos.',
    ),
    const Saint(
      id: '3',
      name: 'São Josemaría Escrivá',
      feastDay: '26 de Outubro',
      bio: 'Fundador do Opus Dei. Santo do trabalho ordinário.',
      quote: 'A santidade não é uma questão de sentir. É uma questão de agir.',
    ),
    const Saint(
      id: '4',
      name: 'São João Paulo II',
      feastDay: '22 de Outubro',
      bio: 'Papa que ajudou a terminar o comunismo e promover a liberdade religiosa.',
      quote: 'Não tenhas medo. Abre bem as portas a Cristo.',
    ),
    const Saint(
      id: '5',
      name: 'Santo Agostinho',
      feastDay: '28 de Agosto',
      bio: 'Um dos Padres mais influentes da Igreja. Escreveu as Confissões.',
      quote: 'Os nossos corações estão inquietos até que descansem em Ti.',
    ),
    const Saint(
      id: '6',
      name: 'Santo António',
      feastDay: '13 de Junho',
      bio: 'Padroeiro de Portugal. Known como o Santo que encontra coisas perdidas.',
      quote: 'Se queremos servir a Deus, devemos servir os outros.',
    ),
    const Saint(
      id: '7',
      name: 'Santa Teresa de Lisieux',
      feastDay: '1 de Outubro',
      bio: ' Carmelita francesa. Doctora da Igreja pelo seu "caminho da infância espiritual".',
      quote: 'O amor é tudo. O amor é a essência de todas as vocações.',
    ),
  ];

  static Future<Saint> getSaintOfDay() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Try to find saint whose feast day matches today
    for (final saint in _saints) {
      final feastDate = _parseFeastDay(saint.feastDay, now.year);
      if (feastDate.year == today.year &&
          feastDate.month == today.month &&
          feastDate.day == today.day) {
        return saint;
      }
    }

    // Fallback: use day of month % saints.length
    return _saints[today.day % _saints.length];
  }

  static DateTime _parseFeastDay(String feastDay, int year) {
    // Parse "4 de Outubro" -> October 4
    // Parse "15 de Outubro" -> October 15
    final parts = feastDay.split(' ');
    if (parts.length < 3) return DateTime(year, 1, 1);
    final day = int.tryParse(parts[0]) ?? 1;
    final monthNames = {
      'Janeiro': 1, 'Fevereiro': 2, 'Março': 3, 'Abril': 4,
      'Maio': 5, 'Junho': 6, 'Julho': 7, 'Agosto': 8,
      'Setembro': 9, 'Outubro': 10, 'Novembro': 11, 'Dezembro': 12
    };
    final month = monthNames[parts[2]] ?? 1;
    return DateTime(year, month, day);
  }

  static Future<List<Saint>> getAllSaints() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _saints;
  }
}
