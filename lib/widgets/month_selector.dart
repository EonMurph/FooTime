import 'package:flutter/material.dart';

class MonthSelector extends StatefulWidget {
  const MonthSelector({super.key});

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 15,
      children: [
        IconButton(
          onPressed: () {
            // TODO: Implement month selector
            debugPrint("Not implemented");
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        const Text('Month Here'),
        IconButton(
          onPressed: () {
            // TODO: Implement month selector here too
            debugPrint("Not implemented");
          },
          icon: const Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}
