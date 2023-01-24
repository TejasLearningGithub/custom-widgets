import 'package:flutter/material.dart';
import 'package:radio_button_ex/MyRadio/my_radio_class.dart';

class RadioImplementSecond extends StatefulWidget {
  const RadioImplementSecond({super.key});

  @override
  State<RadioImplementSecond> createState() => _RadioImplementSecondState();
}

enum Gender { male, female }

Gender? _character = Gender.male;

class _RadioImplementSecondState extends State<RadioImplementSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implementation Of Radio'),
      ),
      body: Container(
        child: Column(
          children: [
            MyRadioOption(
                value: _character,
                groupValue: Gender,
                label: 'Male',
                text: 'Male',
                onChanged: (value) {
                  setState(() {
                    _character = value as Gender;
                  });
                })
          ],
        ),
      ),
    );
  }
}
