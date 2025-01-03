import 'package:foo_time/pages/tracking_page.dart';
import 'package:flutter/material.dart';

class NewActivityWidget extends StatelessWidget {
  const NewActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final elapsedTime = '15 minutes';
    return GestureDetector(
      onTap: () {
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
              elapsedTime,
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}
