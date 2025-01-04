import "package:foo_time/utils/activity.dart";
import "package:flutter/material.dart";

class ActivityWidget extends StatelessWidget {
  final Activity activity;
  const ActivityWidget({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // TODO: Implement activity details tap
        debugPrint('Not yet implemented');
      },
      child: SizedBox(
        width: double.infinity,
        child: Row(
          spacing: 20,
          children: [
            Icon(activity.icon),
            Text(
              activity.name,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const Spacer(),
            Text(
              '12:45 - 13:35',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
