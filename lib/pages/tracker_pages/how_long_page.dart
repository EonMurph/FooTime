import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:foo_time/providers/riverpod_providers.dart";
import "package:foo_time/utils/activity.dart";
import "package:intl/intl.dart";

class HowLongPage extends ConsumerStatefulWidget {
  const HowLongPage({super.key});

  @override
  ConsumerState<HowLongPage> createState() => _HowLongPageState();
}

class _HowLongPageState extends ConsumerState<HowLongPage> {
  final DateTime currentTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final Map<int, Activity> selectedActivities =
        ref.watch(trackerProvider).selectedActivities;
    final Map<int, double> sliderValues =
        ref.watch(trackerProvider).sliderValues;
    final DateTime lastTime = ref.watch(trackerProvider).lastTrackedTime;
    final double elapsed =
        currentTime.difference(lastTime).inMinutes.toDouble();
    double selectedTime = sliderValues.isNotEmpty
        ? sliderValues.values.reduce((sum, element) => sum + element)
        : 0;
    debugPrint(elapsed.toString());
    debugPrint(selectedTime.toString());

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(30),
      itemCount: selectedActivities.length,
      itemBuilder: (context, index) {
        final selectedActivitiesIDs = selectedActivities.keys.toList();
        final id = selectedActivitiesIDs[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selectedActivities[id]!.icon,
              size: 50,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        selectedActivities[id]!.name,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        '${sliderValues[id]?.round() ?? 0} mins',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(elapsed.toString())
                    ],
                  ),
                  Slider(
                    value: sliderValues[id] ?? 0,
                    min: 0,
                    max: elapsed,
                    divisions: (elapsed).toInt(),
                    label: sliderValues[id]?.toString() ?? '0',
                    onChanged: (double value) {
                      if (elapsed - selectedTime > 0) {
                        setState(() {
                          ref.read(trackerProvider).sliderValues[id] =
                              value.roundToDouble();
                          selectedTime = sliderValues.values
                              .reduce((sum, element) => sum + element);
                        });
                      } else if (elapsed - selectedTime == 0) {
                        if (sliderValues.containsKey(id) &&
                            value < sliderValues[id]!) {
                          setState(() {
                            ref.read(trackerProvider).sliderValues[id] =
                                value.roundToDouble();
                            selectedTime = sliderValues.values
                                .reduce((sum, element) => sum + element);
                          });
                        } else if (!sliderValues.containsKey(id)) {
                          ref.read(trackerProvider).sliderValues[id] = 0;
                        }
                      }
                    },
                  ),
                  Row(children: [
                    Text(DateFormat.Hm().format(lastTime)),
                    const Spacer(),
                    Text(DateFormat.Hm().format(currentTime)),
                  ])
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
