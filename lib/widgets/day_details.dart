import "package:foo_time/utils/activity.dart";
import "package:foo_time/widgets/activity_widget.dart";
import "package:foo_time/widgets/new_activity_widget.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class DayDetails extends StatelessWidget {
  final String date;
  const DayDetails({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final activities = const [
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
    ];
    final today = date == DateFormat.yMMMMEEEEd().format(DateTime.now());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            today ? 'Today' : date,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (today) ...const [
            NewActivityWidget(),
            SizedBox(height: 10),
          ],
          ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];

                return Column(
                  children: [
                    ActivityWidget(activity: activity),
                    const SizedBox(height: 10)
                  ],
                );
              }),
        ],
      ),
    );
  }
}
