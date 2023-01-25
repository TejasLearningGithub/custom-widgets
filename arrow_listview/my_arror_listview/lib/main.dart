import 'package:flutter/material.dart';
import 'package:my_arror_listview/MyPageFirst/my_first.dart';
import 'package:my_arror_listview/MyPageSecond/my_second.dart';
import 'package:my_arror_listview/expandable_collepse/first_exp_coll.dart';
import 'package:my_arror_listview/self_main/exp_collapse.dart';

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
      home: ExpCollapse(),
    );
  }
}
