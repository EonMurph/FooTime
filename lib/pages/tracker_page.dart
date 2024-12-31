import 'dart:math';

import 'package:FooTime/pages/tracker_pages/how_long_page.dart';
import 'package:FooTime/pages/tracker_pages/who_what_page.dart';
import 'package:FooTime/utils/activity.dart';
import 'package:FooTime/utils/person.dart';
import 'package:flutter/material.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final List<Activity> activities = const [
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
      Activity(id: 1, name: 'Coding', icon: Icons.cloud),
    ];
    final List<Person> people = const [
      Person(id: 1, name: 'John', icon: Icons.person),
      Person(id: 1, name: 'John', icon: Icons.person),
      Person(id: 1, name: 'John', icon: Icons.person),
      Person(id: 1, name: 'John', icon: Icons.person),
      Person(id: 1, name: 'John', icon: Icons.person),
      Person(id: 1, name: 'John', icon: Icons.person),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Track Activity'),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: currentPage,
        children: [
          WhoWhatPage(items: people),
          WhoWhatPage(items: activities),
          const HowLongPage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                disabledBackgroundColor: Colors.grey,
              ),
              onPressed: currentPage == 0
                  ? null
                  : () {
                      setState(() => currentPage = max(--currentPage, 0));
                    },
              child: Text(
                'Back',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TextButton(
              onPressed: currentPage == 2
                  ? () {
                      // TODO: Implement submit button
                      debugPrint('Not implemented');
                    }
                  : () {
                      setState(() => currentPage = min(++currentPage, 2));
                    },
              child: Text(
                currentPage == 2 ? 'Submit' : 'Next',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
