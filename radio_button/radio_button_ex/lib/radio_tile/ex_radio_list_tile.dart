import 'package:flutter/material.dart';

class ExRadioListTile extends StatefulWidget {
  const ExRadioListTile({super.key});

  @override
  State<ExRadioListTile> createState() => _ExRadioListTileState();
}

class _ExRadioListTileState extends State<ExRadioListTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Radio'),
      ),
      body: Container(
        child: Column(
          children: const [
            MyRadioListTile(),
          ],
        ),
      ),
    );
  }
}

class MyRadioListTile extends StatefulWidget {
  const MyRadioListTile({super.key});

  @override
  State<MyRadioListTile> createState() => _MyRadioListTileState();
}

enum RadioGender { Male, Female }

class _MyRadioListTileState extends State<MyRadioListTile> {
  var groupValue = 'Male';
  var selected = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          value: 'Male',
          groupValue: groupValue,
          title: Text('First Radio List Tile'),
          onChanged: (val) {
            setState(() {
              groupValue = val.toString();
              //selected = 'Male Active';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '$val Active',
                  ),
                ),
              );
            });
          },
        ),
        RadioListTile(
          value: 'Female',
          groupValue: groupValue,
          title: Text('Second Radio List Tile'),
          onChanged: (val) {
            setState(() {
              groupValue = val.toString();
              selected = 'Female Active';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '$val Active',
                  ),
                ),
              );
            });
          },
        ),
      ],
    );
  }
}
