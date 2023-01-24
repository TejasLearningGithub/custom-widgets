import 'package:flutter/material.dart';

enum Gender { male, female }

Gender? _character = Gender.male;

class MyRadioOption<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final String label;
  final String text;
  final ValueChanged<T?> onChanged;

  const MyRadioOption({
    required this.value,
    required this.groupValue,
    required this.label,
    required this.text,
    required this.onChanged,
  });

  @override
  State<MyRadioOption<T>> createState() => _MyRadioOptionState<T>();
}

class _MyRadioOptionState<T> extends State<MyRadioOption<T>> {
  Widget _buildLabel() {
    final bool isSelected = widget.value == widget.groupValue;

    return RadioListTile(
      value: 'my Value',
      groupValue: widget.groupValue,
      title: 'My Title' as Widget,
      onChanged: (val) {
        setState(() {
          _character = val as Gender;
        });
      },
      tileColor: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => widget.onChanged(widget.value),
        splashColor: Colors.cyan.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              //   _buildLabel(),
              //  const SizedBox(width: 10),
              //  _buildText(),
            ],
          ),
        ),
      ),
    );
  }
}
