import 'package:flutter/material.dart';
import 'package:my_drop_down_menu/my_custom_dropdown.dart';
import 'package:my_drop_down_menu/my_drop_down.dart';
import 'package:my_drop_down_menu/my_screeen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyScreeen());
  }
}
