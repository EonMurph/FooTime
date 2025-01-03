import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foo_time/pages/tracking_page.dart';
import 'package:flutter/material.dart';
import 'package:foo_time/providers/riverpod_providers.dart';

class NewActivityWidget extends ConsumerWidget {
  const NewActivityWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elapsedTime = ref
        .watch(trackerProvider)
        .currentTime
        .difference(ref.watch(trackerProvider).lastTrackedTime)
        .inMinutes;
    return TextButton(
      onPressed: DateTime.now()
                  .difference(ref.watch(trackerProvider).lastTrackedTime)
                  .inMinutes ==
              0
          ? null
          : () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const TrackingPage();
              }));
            },
      child: SizedBox(
        width: double.infinity,
        child: Row(
          spacing: 20,
          children: [
            const Icon(Icons.add),
            Text(
              'Track new activity:',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              '$elapsedTime mins',
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}
