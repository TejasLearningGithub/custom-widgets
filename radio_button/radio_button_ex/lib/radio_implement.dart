import 'package:flutter/material.dart';
import 'package:radio_button_ex/radio_class.dart';

class RadioImplement extends StatefulWidget {
  const RadioImplement({super.key});

  @override
  State<RadioImplement> createState() => _RadioImplementState();
}

enum GroupGender { male, female }

class _RadioImplementState extends State<RadioImplement> {
  String? _groupValue;
  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() {
          _groupValue = value;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implementing dynamic Radio Widget'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                MyRadioOption(
                  value: 'male',
                  groupValue: _groupValue,
                  label: '1',
                  text: 'Male',
                  onChanged: _valueChangedHandler(),
                ),
                MyRadioOption(
                  value: 'female',
                  groupValue: _groupValue,
                  label: '2',
                  text: 'Female',
                  onChanged: _valueChangedHandler(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
