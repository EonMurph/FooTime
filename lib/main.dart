import 'package:FooTime/pages/foundation_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
          textTheme: TextTheme(
            titleMedium: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ), 
            labelMedium: const TextStyle(
              fontSize: 25,
            ),
            labelSmall: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
          )),
      home: FoundationPage());
  }
}
