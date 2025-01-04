import 'package:flutter/material.dart';
import 'package:foo_time/utils/activity.dart';
import 'package:foo_time/utils/person.dart';

DateTime roundDateTime() {
  final DateTime now = DateTime.now();
  return DateTime(now.year, now.month, now.day, now.hour, now.minute);
}

class WhoWhatModel extends ChangeNotifier {
  final Map<int, Person> selectedPeople;
  final Map<int, Activity> selectedActivities;
  final Map<int, double> sliderValues;
  WhoWhatModel({
    this.selectedPeople = const {},
    this.selectedActivities = const {},
    this.sliderValues = const {},
  });

  DateTime currentTime = roundDateTime();
  DateTime lastTrackedTime = roundDateTime();

  void updateTime() {
    currentTime = roundDateTime();
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
    notifyListeners();
    debugPrint('Data submitted');
  }
}
