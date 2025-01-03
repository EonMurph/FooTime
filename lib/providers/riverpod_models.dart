import 'package:flutter/material.dart';
import 'package:foo_time/utils/activity.dart';
import 'package:foo_time/utils/person.dart';

class WhoWhatModel extends ChangeNotifier {
  final Map<int, Person> selectedPeople;
  final Map<int, Activity> selectedActivities;
  final Map<int, double> sliderValues;
  DateTime lastTrackedTime;
  WhoWhatModel({
    required this.selectedPeople,
    required this.selectedActivities,
    required this.sliderValues,
    required this.lastTrackedTime,
  });

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
    lastTrackedTime = DateTime.now();
    notifyListeners();
    debugPrint('Data submitted');
  }
}
