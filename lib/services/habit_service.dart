import '../models/habit.dart';

class HabitService {
  static List<Habit> getDefaultHabits() {
    return const [
      Habit(
        id: 'morning_prayer',
        name: 'Morning Prayer',
        description: 'Start your day with God',
        defaultTime: '7:00 AM',
        icon: IconType.sun,
      ),
      Habit(
        id: 'rosary',
        name: 'Rosary',
        description: 'Daily rosary prayer',
        defaultTime: '8:00 PM',
        icon: IconType.pray,
      ),
      Habit(
        id: 'bible_reading',
        name: 'Bible Reading',
        description: 'Read the daily Scripture',
        defaultTime: '9:00 AM',
        icon: IconType.book,
      ),
      Habit(
        id: 'evening_prayer',
        name: 'Evening Prayer',
        description: 'End your day with gratitude',
        defaultTime: '10:00 PM',
        icon: IconType.star,
      ),
      Habit(
        id: 'chaplet',
        name: 'Divine Mercy Chaplet',
        description: 'Pray the chaplet at 3 PM',
        defaultTime: '3:00 PM',
        icon: IconType.heart,
      ),
      Habit(
        id: 'mass',
        name: 'Weekly Mass',
        description: 'Attend Sunday Mass',
        defaultTime: 'Sunday',
        icon: IconType.church,
      ),
    ];
  }

  // Future: Load from Firebase
  // Future: Save streaks
}
