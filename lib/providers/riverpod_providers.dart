import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foo_time/providers/riverpod_models.dart';

final trackerProvider = ChangeNotifierProvider<TrackerModel>(
  (ref) => TrackerModel(
    selectedPeople: {},
    selectedActivities: {},
    sliderValues: {},
  ),
);
