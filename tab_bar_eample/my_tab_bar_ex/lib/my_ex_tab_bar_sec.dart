import 'package:flutter/material.dart';

class MyTabBarEx extends StatefulWidget {
  @override
  _MyTabBarExState createState() => _MyTabBarExState();
}

class _MyTabBarExState extends State<MyTabBarEx>
    with SingleTickerProviderStateMixin {
  var firstBool = false;
  var secondBool = false;
  var thirdBool = false;
  List<bool> isVisitedTab = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  bool isVisited = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Navigation Example'),
        bottom: TabBar(
          // indicator: CustomTabIndicator(),
          //labelColor: isVisitedTab[0] == true ? Colors.black : Colors.red,
          //unselectedLabelColor: Colors.red,

          // indicatorColor: _tabController.previousIndex == true
          //     ? Colors.black
          //     : Colors.amber,
          //unselectedLabelColor: firstBool ? Colors.orange : Colors.green,
          onTap: (val) {
            if (val == 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Tab1 visited'
                  ),
                ),
              );
              Colors.accents;
            }
            if (_tabController.previousIndex == 0) {
              Colors.accents;
            }
            if (_tabController.previousIndex == 1) {}
            if (_tabController.previousIndex == 2) {}
            if (_tabController.previousIndex == 3) {}
          },
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
            Tab(text: 'Tab 4'),
            Tab(text: 'Tab 5'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Content of Tab 1')),
          Center(child: Text('Content of Tab 2')),
          Center(child: Text('Content of Tab 3')),
          Center(child: Text('Content of Tab 4')),
          Center(child: Text('Content of Tab 5')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the second tab

          // if (_tabController.index == 4) {
          //   _tabController.index = 0;
          //   _tabController.animateTo(0);
          // } else {
          //   _tabController.animateTo(_tabController.index + 1);
          //   if (_tabController.previousIndex == 0) {
          //     firstBool = true;
          //   }
          //   if (_tabController.previousIndex == 1) {
          //     secondBool = true;
          //   }
          // }

          if (_tabController.index == 0) {
            setState(() {
              isVisited = true;
              _tabController.index = 1;
              _tabController.animateTo(1);
            });
          } else if (_tabController.index == 1) {
            setState(() {
              _tabController.index = 2;
              _tabController.animateTo(2);
              isVisited = true;
            });
          } else if (_tabController.index == 2) {
            setState(() {
              _tabController.index = 3;
              _tabController.animateTo(3);
              isVisited = true;
            });
          } else if (_tabController.index == 3) {
            setState(() {
              isVisited = true;
              _tabController.index = 4;
              _tabController.animateTo(4);
              isVisited = true;
            });
          } else if (_tabController.index == 4) {
            setState(() {
              isVisited = true;
              _tabController.index = 0;
              _tabController.animateTo(0);
              isVisited = true;
            });
          } else {
            setState(() {
              isVisited = false;
            });
          }
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${_tabController.index}')));
          // _tabController.addListener(() {
          //   if (_tabController.previousIndex == 1) {}
          // });
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
