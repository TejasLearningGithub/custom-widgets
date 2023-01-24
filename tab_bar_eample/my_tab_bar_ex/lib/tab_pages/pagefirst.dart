import 'package:flutter/material.dart';

class Pagefirst extends StatefulWidget {

  const Pagefirst({super.key});

  @override
  State<Pagefirst> createState() => _PagefirstState();
}

class _PagefirstState extends State<Pagefirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: const [
            Text('Page First')
          ],
        ),
      ),
    );
  }
}
