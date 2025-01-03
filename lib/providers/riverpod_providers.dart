import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foo_time/providers/riverpod_models.dart';

final trackerProvider = ChangeNotifierProvider<WhoWhatModel>(
  (ref) => WhoWhatModel(
    selectedPeople: {},
    selectedActivities: {},
    sliderValues: {},
    lastTrackedTime: DateTime.now().subtract(const Duration(minutes: 15)),
  ),
);
