class CatholicFeast {
  final String name;
  final int month;
  final int day;
  final bool isHolyDayOfObligation;

  const CatholicFeast({
    required this.name,
    required this.month,
    required this.day,
    this.isHolyDayOfObligation = false,
  });
}

class CatholicFeasts {
  static const List<CatholicFeast> feasts = [
    // January
    CatholicFeast(name: 'Solenidade de Santa Maria, Mãe de Deus', month: 1, day: 1, isHolyDayOfObligation: true),
    CatholicFeast(name: 'Epifania do Senhor', month: 1, day: 6, isHolyDayOfObligation: true),
    CatholicFeast(name: 'Batismo de Nosso Senhor Jesus Cristo', month: 1, day: 12),

    // February
    CatholicFeast(name: 'Apresentação do Senhor (Nossa Senhora da Candelária)', month: 2, day: 2),
    CatholicFeast(name: 'São Paulo Miki e Companheiros Mártires', month: 2, day: 6),
    CatholicFeast(name: 'Quinta-feira de Cinzas', month: 2, day: 18), // Approximate

    // March
    CatholicFeast(name: 'São José', month: 3, day: 19),
    CatholicFeast(name: 'Anunciação do Senhor', month: 3, day: 25),

    // April
    CatholicFeast(name: 'Domingo de Ramos', month: 4, day: 5), // Approximate
    CatholicFeast(name: 'Quinta-feira Santa', month: 4, day: 9), // Approximate
    CatholicFeast(name: 'Sexta-feira Santa', month: 4, day: 10), // Approximate
    CatholicFeast(name: 'Páscoa do Senhor', month: 4, day: 12), // Approximate
    CatholicFeast(name: 'Segunda-feira da Páscoa', month: 4, day: 13), // Approximate

    // May
    CatholicFeast(name: 'São Jorge', month: 4, day: 23),
    CatholicFeast(name: 'São Pedro e São Paulo', month: 6, day: 29), // June but moving

    // June
    CatholicFeast(name: 'Santo António', month: 6, day: 13),
    CatholicFeast(name: 'São João Batista', month: 6, day: 24),
    CatholicFeast(name: 'São Pedro e São Paulo', month: 6, day: 29, isHolyDayOfObligation: true),

    // July
    CatholicFeast(name: 'Nossa Senhora do Carmo', month: 7, day: 16),
    CatholicFeast(name: 'São Benedito', month: 7, day: 13),
    CatholicFeast(name: 'São Elias', month: 7, day: 20),

    // August
    CatholicFeast(name: 'Transfiguração do Senhor', month: 8, day: 6),
    CatholicFeast(name: 'Assunção de Nossa Senhora', month: 8, day: 15, isHolyDayOfObligation: true),
    CatholicFeast(name: 'Santo António de Lisboa', month: 8, day: 13),
    CatholicFeast(name: 'São João Eudes', month: 8, day: 19),
    CatholicFeast(name: 'Beato João José de Zamora', month: 8, day: 20),

    // September
    CatholicFeast(name: 'Natal de Nossa Senhora', month: 9, day: 8),
    CatholicFeast(name: 'Exaltação da Santa Cruz', month: 9, day: 14),
    CatholicFeast(name: 'Nossa Senhora das Dores', month: 9, day: 15),
    CatholicFeast(name: 'São Mateus', month: 9, day: 21),

    // October
    CatholicFeast(name: 'São Francisco de Assis', month: 10, day: 4),
    CatholicFeast(name: 'Nossa Senhora do Rosário', month: 10, day: 7),
    CatholicFeast(name: 'Santa Teresa de Ávila', month: 10, day: 15),
    CatholicFeast(name: 'São João Paulo II', month: 10, day: 22),
    CatholicFeast(name: 'São Josemaría Escrivá', month: 10, day: 26),

    // November
    CatholicFeast(name: 'Todos os Santos', month: 11, day: 1, isHolyDayOfObligation: true),
    CatholicFeast(name: 'Comemoração dos Fiéis Defuntos', month: 11, day: 2),
    CatholicFeast(name: 'Dedicação da Basilica de São Laterano', month: 11, day: 9),
    CatholicFeast(name: 'São Josafat', month: 11, day: 12),
    CatholicFeast(name: 'Santo Agostinho', month: 11, day: 13),
    CatholicFeast(name: 'Apresentação de Nossa Senhora', month: 11, day: 21),
    CatholicFeast(name: 'Cristo Rei', month: 11, day: 22), // Approximate

    // December
    CatholicFeast(name: 'Santo André', month: 11, day: 30),
    CatholicFeast(name: 'Imaculada Conceição', month: 12, day: 8, isHolyDayOfObligation: true),
    CatholicFeast(name: 'São João Diego', month: 12, day: 9),
    CatholicFeast(name: 'Nossa Senhora de Guadalupe', month: 12, day: 12),
    CatholicFeast(name: 'Natal do Senhor', month: 12, day: 25, isHolyDayOfObligation: true),
    CatholicFeast(name: 'Sagrada Família', month: 12, day: 27),
    CatholicFeast(name: 'Santa Maria Mãe de Deus', month: 12, day: 1),
    CatholicFeast(name: 'Epifania', month: 1, day: 6),
    CatholicFeast(name: 'Batismo do Senhor', month: 1, day: 12),
  ];

  /// Get feast for a specific date
  static CatholicFeast? getFeastForDate(DateTime date) {
    for (final feast in feasts) {
      if (feast.month == date.month && feast.day == date.day) {
        return feast;
      }
    }
    return null;
  }

  /// Get all feasts for a specific month
  static List<CatholicFeast> getFeastsForMonth(int year, int month) {
    // Adjust for moveable feasts (simplified)
    final easter = _calculateEaster(year);
    final pentecost = easter.add(const Duration(days: 49));
    final ashWednesday = easter.subtract(const Duration(days: 46));

    final List<CatholicFeast> monthFeasts = [];

    for (final feast in feasts) {
      if (feast.month == month) {
        monthFeasts.add(feast);
      }
    }

    // Add moveable feasts if they fall in this month
    if (ashWednesday.month == month) {
      monthFeasts.add(CatholicFeast(name: 'Quarta-feira de Cinzas', month: ashWednesday.month, day: ashWednesday.day));
    }
    if (easter.month == month) {
      monthFeasts.add(CatholicFeast(name: 'Páscoa do Senhor', month: easter.month, day: easter.day));
    }
    if (pentecost.month == month) {
      monthFeasts.add(CatholicFeast(name: 'Pentecostes', month: pentecost.month, day: pentecost.day));
    }

    return monthFeasts..sort((a, b) => a.day.compareTo(b.day));
  }

  /// Calculate Easter Sunday using Anonymous Gregorian algorithm
  static DateTime _calculateEaster(int year) {
    final a = year % 19;
    final b = year ~/ 100;
    final c = year % 100;
    final d = b ~/ 4;
    final e = b % 4;
    final f = (b + 8) ~/ 25;
    final g = (b - f + 1) ~/ 3;
    final h = (19 * a + b - d - g + 15) % 30;
    final i = c ~/ 4;
    final k = c % 4;
    final l = (32 + 2 * e + 2 * i - h - k) % 7;
    final m = (a + 11 * h + 22 * l) ~/ 451;
    final month = (h + l - 7 * m + 114) ~/ 31;
    final day = ((h + l - 7 * m + 114) % 31) + 1;
    return DateTime(year, month, day);
  }
}
