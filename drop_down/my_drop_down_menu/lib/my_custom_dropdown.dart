import 'package:flutter/material.dart';

class MyCustomDropdown extends StatefulWidget {
  String? selectedValue;
  List<DropdownMenuItem<String>> myDropdownItem;
  MyCustomDropdown({
    super.key,
    required this.selectedValue,
    required this.myDropdownItem,
  });

  @override
  State<MyCustomDropdown> createState() => _MyCustomDropdownState();
}

class _MyCustomDropdownState extends State<MyCustomDropdown> {
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

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          //filled: true,
          //fillColor: Colors.blueAccent,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
        validator: (value) =>
            value == null || value == '' ? "Select a country" : null,
        //dropdownColor: Colors.blueAccent,
        value: widget.selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            widget.selectedValue = newValue!;
          });
        },
        items: widget.myDropdownItem);
  }
}
