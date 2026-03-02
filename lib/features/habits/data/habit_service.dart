import '../domain/habit.dart';

class HabitService {
  static List<Habit> getDefaultHabits() {
    return const [
      Habit(
        id: 'morning_prayer',
        name: 'Oração da Manhã',
        description: 'Começa o teu dia com Deus',
        defaultTime: '07:00',
        icon: IconType.sun,
      ),
      Habit(
        id: 'rosary',
        name: 'Rosário',
        description: 'Reza o rosário diário',
        defaultTime: '20:00',
        icon: IconType.pray,
      ),
      Habit(
        id: 'bible_reading',
        name: 'Leitura Bíblica',
        description: 'Lê a Escritura do dia',
        defaultTime: '09:00',
        icon: IconType.book,
      ),
      Habit(
        id: 'evening_prayer',
        name: 'Oração da Noite',
        description: 'Termina o dia com gratidão',
        defaultTime: '22:00',
        icon: IconType.star,
      ),
      Habit(
        id: 'chaplet',
        name: 'Terço da Misericórdia',
        description: 'Reza o terço às 15:00',
        defaultTime: '15:00',
        icon: IconType.heart,
      ),
      Habit(
        id: 'mass',
        name: 'Missa Semanal',
        description: 'Assiste à Missa dominical',
        defaultTime: 'Domingo',
        icon: IconType.church,
      ),
    ];
  }
}
