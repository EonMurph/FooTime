import 'dart:math';

import 'package:foo_time/pages/tracker_pages/how_long_page.dart';
import 'package:foo_time/pages/tracker_pages/who_what_page.dart';
import 'package:foo_time/utils/activity.dart';
import 'package:foo_time/utils/person.dart';
import 'package:flutter/material.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  int currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
      body: PageView(
        onPageChanged: (value) {
          setState(() => currentPage = value);
        },
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          WhoWhatPage(
            items: people,
            heading: 'People:',
            body: 'Who are you with?',
          ),
          WhoWhatPage(
            items: activities,
            heading: 'Activity:',
            body: 'What activity are you doing?',
          ),
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
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeIn);
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
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeIn);
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
