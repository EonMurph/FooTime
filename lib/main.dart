import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foo_time/pages/foundation_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FooTime',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            fontFamily: 'Roboto',
            textTheme: const TextTheme(
              titleMedium: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: TextStyle(
                fontSize: 16,
              ),
              labelMedium: TextStyle(
                fontSize: 25,
              ),
              labelSmall: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            )),
        home: const FoundationPage());
  }
}
