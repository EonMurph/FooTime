import "package:flutter/material.dart";

class HowLongPage extends StatelessWidget {
  const HowLongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Placeholder();
      },
    );
  }
}
