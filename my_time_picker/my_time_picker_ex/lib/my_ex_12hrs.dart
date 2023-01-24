import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyTimePickerEx extends StatefulWidget {
  const MyTimePickerEx({Key? key}) : super(key: key);

  @override
  State<MyTimePickerEx> createState() => _MyTimePickerExState();
}

class _MyTimePickerExState extends State<MyTimePickerEx> {
  var dateFormat = DateFormat("h:mm a");
  //String? _selectedTime;
  var _selectedTime;

  var tempDate;

  Future<void> _show() async {
    var result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 12-Hour format
                  alwaysUse24HourFormat: false),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setState(() {
        _selectedTime = result;
        //print(dateFormat.format(_selectedTime.));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Center(
        child: Column(
          children: [
            // Text(
            //   _selectedTime.toString(),
            //   style: const TextStyle(fontSize: 30),
            // ),
            Text(
              DateFormat.jm().format(DateTime.parse(_selectedTime)),
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: _show, child: const Text('Show Time Picker')),
    );
  }
}
