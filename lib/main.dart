import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foo_time/pages/foundation_page.dart';
import 'package:flutter/material.dart';
import 'package:foo_time/providers/riverpod_providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    Timer.periodic(const Duration(seconds: 30),
        (timer) async => await ref.read(trackerProvider).updateTime());
    return MaterialApp(
        title: 'FooTime',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledBackgroundColor: Colors.grey,
              ),
            ),
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
