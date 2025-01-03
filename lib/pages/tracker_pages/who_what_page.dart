import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:foo_time/providers/riverpod_providers.dart";
import "package:foo_time/utils/activity.dart";
import "package:foo_time/utils/person.dart";
import "package:flutter/material.dart";

class WhoWhatPage extends ConsumerWidget {
  final List<dynamic> items;
  final String heading;
  final String body;
  final String type;

  const WhoWhatPage({
    super.key,
    required this.items,
    required this.heading,
    required this.body,
    required this.type,
  }) : assert(items is List<Activity> || items is List<Person>);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedButtons = type == "people"
        ? ref.watch(trackerProvider).selectedPeople
        : ref.watch(trackerProvider).selectedActivities;
    ref.watch(trackerProvider);
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double iconWidth = 150; // TODO: Change to enum
    final double iconSize = 50; // TODO; Change to enum
    final TextStyle labelStyle =
        Theme.of(context).textTheme.labelMedium!; // TODO: Change to enum

    return Column(
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          body,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth ~/ iconWidth,
            childAspectRatio: 1,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: iconWidth,
                child: OutlinedButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      selectedButtons.containsKey(items[index].id)
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surface,
                    ),
                    iconColor: WidgetStatePropertyAll(
                      selectedButtons.containsKey(items[index].id)
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  onPressed: () {
                    int id = items[index].id;
                    if (selectedButtons.containsKey(id)) {
                      ref.read(trackerProvider).remove(id, selectedButtons);
                    } else {
                      ref.read(trackerProvider).add(items[index], selectedButtons);
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(items[index].icon, size: iconSize),
                      Text(
                        items[index].name,
                        style: labelStyle.copyWith(
                          color: selectedButtons.containsKey(items[index].id)
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
