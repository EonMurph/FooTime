import "package:flutter/foundation.dart";
import "package:foo_time/utils/activity.dart";
import "package:foo_time/utils/person.dart";
import "package:flutter/material.dart";

class WhoWhatPage extends StatefulWidget {
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
  State<WhoWhatPage> createState() => _WhoWhatPageState();
}

class _WhoWhatPageState extends State<WhoWhatPage> {
  Map<int, dynamic> selectedButtons = {};

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double iconWidth = 150; // TODO: Change to enum
    final double iconSize = 50; // TODO; Change to enum
    final TextStyle labelStyle =
        Theme.of(context).textTheme.labelMedium!; // TODO: Change to enum

    return Column(
      children: [
        Text(
          widget.heading,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          widget.body,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth ~/ iconWidth,
            childAspectRatio: 1,
          ),
          itemCount: widget.items.length,
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
                      selectedButtons.containsKey(widget.items[index].id)
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surface,
                    ),
                    iconColor: WidgetStatePropertyAll(
                      selectedButtons.containsKey(widget.items[index].id)
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  onPressed: () {
                    int id = widget.items[index].id;
                    setState(() {
                      if (selectedButtons.containsKey(id)) {
                        selectedButtons.remove(id);
                      } else {
                        selectedButtons[id] = widget.items[index];
                      }
                    });
                    if (kDebugMode) debugPrint(selectedButtons.toString());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(widget.items[index].icon, size: iconSize),
                      Text(
                        widget.items[index].name,
                        style: labelStyle.copyWith(
                          color: selectedButtons.containsKey(widget.items[index].id)
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
