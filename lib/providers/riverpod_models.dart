import 'package:flutter/material.dart';
import 'package:foo_time/utils/activity.dart';
import 'package:foo_time/utils/person.dart';

DateTime roundDateTime() {
  final DateTime now = DateTime.now();
  return DateTime(now.year, now.month, now.day, now.hour, now.minute);
}

class TrackerModel extends ChangeNotifier {
  final Map<int, Person> selectedPeople;
  final Map<int, Activity> selectedActivities;
  final Map<int, double> sliderValues;
  TrackerModel({
    this.selectedPeople = const {},
    this.selectedActivities = const {},
    this.sliderValues = const {},
  });

  DateTime currentTime = roundDateTime();
  DateTime lastTrackedTime = roundDateTime();
  double elapsedTime = 1;

  Future<void> updateTime() async {
    currentTime = roundDateTime();
    // elapsedTime = currentTime.difference(lastTrackedTime).inMinutes.toDouble();
    elapsedTime = 1;
    notifyListeners();
  }

  void add(dynamic button, Map<int, dynamic> buttons) {
    buttons[button.id] = button;
    notifyListeners();
  }

  void remove(int id, Map<int, dynamic> buttons) {
    buttons.remove(id);
    if (sliderValues.keys.contains(id)) sliderValues.remove(id);
    notifyListeners();
  }

  void submit() {
    debugPrint('Submitting data');
    // TODO: save data to file
    selectedPeople.clear();
    selectedActivities.clear();
    sliderValues.clear();
    lastTrackedTime = roundDateTime();
    elapsedTime = 1;
    notifyListeners();
    debugPrint('Data submitted');
  }
}
