import 'dart:math';

class Utils {
  static DateTime getRandomDate(int pastDays) {
    final random = Random();
    final now = DateTime.now();
    final randomNumberOfDays = random.nextInt(pastDays);
    final randomHour = random.nextInt(24);
    final randomMinute = random.nextInt(60);
    final randomSecond = random.nextInt(60);
    final randomMillisecond = random.nextInt(1000);

    return now.subtract(
      Duration(
        days: randomNumberOfDays,
        hours: randomHour,
        minutes: randomMinute,
        seconds: randomSecond,
        milliseconds: randomMillisecond,
      ),
    );
  }
}
