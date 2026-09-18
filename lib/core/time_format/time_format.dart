class TimeFormat {
  static Duration nextPrey(List<String> prayTime) {
    final now = DateTime.now();

    for (final time in prayTime) {
      final parts = time.split(':');

      final prayerDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      if (prayerDateTime.isAfter(now)) {
        return prayerDateTime.difference(now);
      }
    }

    // لو كل الصلوات بتاعة النهارده عدت
    // يبقى الفجر القادم هو فجر بكرة
    final fajrParts = prayTime[0].split(':');

    final tomorrowFajr = DateTime(
      now.year,
      now.month,
      now.day + 1,
      int.parse(fajrParts[0]),
      int.parse(fajrParts[1]),
    );

    return tomorrowFajr.difference(now);
  }

  static String formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');

    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }
}
