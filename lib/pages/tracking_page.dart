import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foo_time/pages/tracker_pages/how_long_page.dart';
import 'package:foo_time/pages/tracker_pages/who_what_page.dart';
import 'package:foo_time/providers/riverpod_providers.dart';
import 'package:foo_time/utils/activity.dart';
import 'package:foo_time/utils/person.dart';
import 'package:flutter/material.dart';

class TrackingPage extends ConsumerStatefulWidget {
  const TrackingPage({super.key});

  @override
  ConsumerState<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends ConsumerState<TrackingPage> {
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
      Activity(id: 2, name: 'Reading', icon: Icons.book),
      Activity(id: 3, name: 'Running', icon: Icons.directions_run),
      Activity(id: 4, name: 'Cooking', icon: Icons.kitchen),
      Activity(id: 5, name: 'Gaming', icon: Icons.videogame_asset),
      Activity(id: 6, name: 'Sleeping', icon: Icons.bed),
    ];
    final List<Person> people = const [
      Person(id: 1, name: 'John', icon: Icons.person),
      Person(id: 2, name: 'Jane', icon: Icons.person_outline),
      Person(id: 3, name: 'Alice', icon: Icons.person_add),
      Person(id: 4, name: 'Bob', icon: Icons.person_pin),
    ];
    final selectedActivities = ref.watch(trackerProvider).selectedActivities;
    final selectedPeople = ref.watch(trackerProvider).selectedPeople;
    final sliderValues = ref.watch(trackerProvider).sliderValues;
    final elapsedTime = ref.watch(trackerProvider).elapsedTime;
    double allocatedTime = sliderValues.isNotEmpty
        ? sliderValues.values.reduce((sum, element) => sum + element)
        : 0;

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
        physics: const NeverScrollableScrollPhysics(),
        children: [
          WhoWhatPage(
            items: people,
            heading: 'People:',
            body: 'Who are you with?',
            type: 'people',
          ),
          WhoWhatPage(
            items: activities,
            heading: 'Activity:',
            body: 'What activity are you doing?',
            type: 'activities',
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
                  ? elapsedTime != allocatedTime
                      ? null
                      : () {
                          ref.read(trackerProvider).submit();
                          Navigator.of(context).pop();
                        }
                  : (currentPage == 0 && selectedPeople.isNotEmpty) ||
                          (currentPage == 1 && selectedActivities.isNotEmpty)
                      ? () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeIn);
                        }
                      : null,
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
