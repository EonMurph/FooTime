import 'package:FooTime/pages/tracker_pages/how_long_page.dart';
import 'package:FooTime/pages/tracker_pages/who_what_page.dart';
import 'package:FooTime/utils/activity.dart';
import 'package:FooTime/utils/person.dart';
import 'package:flutter/material.dart';

class TrackerPage extends StatelessWidget {
  const TrackerPage({super.key});

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
        index: 0,
        children: [
          WhoWhatPage(items: people),
          WhoWhatPage(items: activities),
          const HowLongPage(),
        ],
      ),
    );
  }
}
