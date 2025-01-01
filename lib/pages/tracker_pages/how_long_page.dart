import "package:flutter/material.dart";
import "package:foo_time/utils/activity.dart";

class HowLongPage extends StatefulWidget {
  const HowLongPage({super.key});

  @override
  State<HowLongPage> createState() => _HowLongPageState();
}

class _HowLongPageState extends State<HowLongPage> {
  final List<double> sliderValues = [0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    final activities = const [
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
    ];
    final startTime = '12:45';
    final endTime = '13:35';

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(30),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              activities[index].icon,
              size: 50,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        activities[index].name,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        '${sliderValues[index].round()} mins',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                  Slider(
                    value: sliderValues[index],
                    min: 0,
                    max: 100,
                    label: sliderValues[index].round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        sliderValues[index] = value;
                      });
                    },
                  ),
                  Row(children: [
                    Text(startTime),
                    Text(endTime),
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
