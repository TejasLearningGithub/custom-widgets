import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {
  TimePicker({Key? key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final timeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextField(
        readOnly: true,
        controller: timeController,
        decoration: InputDecoration(hintText: 'Pick your Time'),
        
        onTap: () async {
          var time = await showTimePicker(
            
            initialTime: TimeOfDay.now(),
            context: context,
          );
          //timeController.text = time!.format(context);
          //timeController.text = time!.DateFormat('hh:mm a').format(DateTime.now());
          var myTime = DateFormat.jm()
              .format(DateFormat("HH:mm:ss").parse(time.toString()));

          // DateTime tempDate = DateFormat("hh:mm")
          //     .parse(time!.hour.toString() + ":" + time.minute.toString());
          // var dateFormat =
          //     DateFormat("h:mm a"); // you can change the format here
          // print(dateFormat.format(tempDate));
          // timeController.text = dateFormat.toString();
          timeController.text = myTime;
          print(timeController.text);
        },
      )),
    );
  }
}
