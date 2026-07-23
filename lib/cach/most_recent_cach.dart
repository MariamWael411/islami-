import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData(int lastSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecent = prefs.getStringList('most_recent') ?? [];
  if (mostRecent.contains('$lastSuraIndex')) {
    mostRecent.remove('$lastSuraIndex');
    mostRecent.insert(0, '$lastSuraIndex');
  } else {
    mostRecent.insert(0, '$lastSuraIndex');
  }
  if (mostRecent.length > 5) {
    mostRecent.removeLast();
  }
  prefs.setStringList('most_recent', mostRecent);
}
