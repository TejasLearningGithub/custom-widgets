/*
  This source file shows time format in 12 hrs with am/pm
  11:24 23-jan-2023
*/

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class MyExampleTime extends StatefulWidget {
  const MyExampleTime({super.key});

  @override
  State<MyExampleTime> createState() => _MyExampleTimeState();
}

class _MyExampleTimeState extends State<MyExampleTime> {
  TextEditingController _timeController = TextEditingController();

  TimeOfDay? _selectedTime;
  DateTime? tempDate;
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? timePicked = await showTimePicker(
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
    if (timePicked != null)
      setState(() {
        _selectedTime = timePicked;
      });
    // Conversion logic starts here
    tempDate = DateFormat("hh:mm").parse(_selectedTime!.hour.toString() +
        ":" +
        _selectedTime!.minute.toString());
    var dateFormat = DateFormat("h:mm a"); // you can change the format here
    print(dateFormat.format(tempDate!));
    setState(() {
      _timeController.text = dateFormat.format(tempDate!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time in 12 hrs format'),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child: Text('Show Time Picker'),
            ),
            TextFormField(
              keyboardType: TextInputType.none,
              controller: _timeController,
              onTap: () {
                _selectTime(context);
              },
            ),
            //Text(DateFormat("h:mm a").format(tempDate!)),
          ],
        ),
      ),
    );
  }
}
