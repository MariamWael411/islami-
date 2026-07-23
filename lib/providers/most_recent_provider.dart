import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostRecentList = prefs
        .getStringList('most_recent')!
        .map((e) => int.parse(e))
        .toList();
    notifyListeners();
  }
}
