import "package:FooTime/utils/activity.dart";
import "package:FooTime/utils/person.dart";
import "package:flutter/material.dart";

class WhoWhatPage extends StatelessWidget {
  final List<dynamic> items;
  const WhoWhatPage({super.key, required this.items})
      : assert(items is List<Activity> || items is List<Person>);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double iconWidth = 150; // TODO: Change to enum
    final double iconSize = 50; // TODO; Change to enum
    final TextStyle labelStyle =
        Theme.of(context).textTheme.labelMedium!; // TODO: Change to enum
    return GridView.builder(
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
              )),
              onPressed: () {
                // TODO: Implement activity tracker buttons
                debugPrint('Not implemented');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(items[index].icon, size: iconSize),
                  Text(
                    items[index].name,
                    style: labelStyle,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
