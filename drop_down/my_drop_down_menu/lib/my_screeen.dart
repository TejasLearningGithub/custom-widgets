import 'package:flutter/material.dart';
import 'package:my_drop_down_menu/my_custom_dropdown.dart';

class MyScreeen extends StatefulWidget {
  const MyScreeen({super.key});

  @override
  State<MyScreeen> createState() => _MyScreeenState();
}

class _MyScreeenState extends State<MyScreeen> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text('Please Select Value'), value: ''),
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsCourse {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text('Please Select Value'), value: ''),
      DropdownMenuItem(child: Text("Course 1"), value: "c1"),
      DropdownMenuItem(child: Text("Course 2"), value: "c2"),
      DropdownMenuItem(child: Text("Course 3"), value: "c3"),
      DropdownMenuItem(child: Text("Course 4"), value: "c4"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Use of custom dropdown'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, right: 12, left: 12, bottom: 8),
              child: MyCustomDropdown(
                  selectedValue: '', myDropdownItem: dropdownItems),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, right: 12, left: 12, bottom: 8),
              child: MyCustomDropdown(
                  selectedValue: '', myDropdownItem: dropdownItemsCourse),
            )
          ],
        ),
      ),
    );
  }
}
