import "package:foo_time/widgets/day_details.dart";
import "package:foo_time/widgets/month_selector.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final days = [
      for (int i = 0; i < 10; i++)
        DateFormat.yMMMMEEEEd()
            .format(DateTime.now().subtract(Duration(days: i)))
    ];
    return Scaffold(
      appBar: AppBar(
        title: const MonthSelector(),
      ),
      body: SizedBox(
        height: double.infinity,
        child: ListView.builder(
          // shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: days.length,
          itemBuilder: (context, index) {
            return DayDetails(date: days[index]);
          },
        ),
      ),
    );
  }
}
