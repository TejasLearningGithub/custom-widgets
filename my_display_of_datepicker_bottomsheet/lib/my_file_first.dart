import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFileFirst extends StatefulWidget {
  const MyFileFirst({super.key});

  @override
  State<MyFileFirst> createState() => _MyFileFirstState();
}

class _MyFileFirstState extends State<MyFileFirst> {
  DateTime dateTime = DateTime.now();
  var myDay = 0;
  var myYear = 0;
  var myMonth = 0;
  var myController = TextEditingController();
  var myDate = 'Please select date';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController.text = myDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Of Datepicker in Bottom Sheet'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Text('${DateTime.now().day}'),
                // TextFormField(
                //   controller: myController,
                // ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => Container(
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (DateTime date) {
                              //dateTime = date;
                              if (mounted) {
                                print("Your Selected Date: ${date.day}");
                                print("your Selected Month: ${date.month}");
                                print("Your Selected Year : ${date.year}");
                                setState(() {
                                  dateTime = date;
                                  myDay = date.day;
                                  myMonth = date.month;
                                  myYear = date.year;
                                  myDate = ('$myDay' '$myMonth' '$myYear');
                                  myDate = '$myDay -' ' $myMonth -' ' $myYear';
                                  myController.text = myDate;
                                });
                              }
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'close bottom sheet',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text(
                'Select Date',
              ),
            ),
            TextFormField(
              controller: myController,
            ),
          ],
        ),
      ),
    );
  }
}
