import 'package:flutter/material.dart';

class ViewWidget extends StatefulWidget {
  @override
  ViewWidgetState createState() => ViewWidgetState();
}

class ViewWidgetState extends State {
  bool viewVisible = true;
  bool isVisible = true;
  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  void showAnotherWidget() {
    setState(() {
      isVisible = true;
    });
  }

  void hideAnotherWidget() {
    setState(() {
      isVisible = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show hide widget'),
      ),
      body: Column(
        children: <Widget>[
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: viewVisible,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.green,
              margin: const EdgeInsets.only(top: 50, bottom: 30),
              child: const Center(
                child: Text(
                  'Show Hide Text View Widget in Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: isVisible,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              margin: const EdgeInsets.only(top: 50, bottom: 30),
              child: const Center(
                child: Text(
                  'Show Hide Text View Widget in Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            child: Text('Hide Widget on Button Click'),
            onPressed: hideWidget,
          ),
          TextButton(
            child: Text('Show Widget on Button Click'),
            onPressed: showWidget,
          ),
          TextButton(
            child: Text('Hide another Click'),
            onPressed: hideAnotherWidget,
          ),
          TextButton(
            child: Text('Show another Click'),
            onPressed: showAnotherWidget,
          ),
        ],
      ),
    );
  }
}
