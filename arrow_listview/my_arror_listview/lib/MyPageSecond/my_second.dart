import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MySecond extends StatefulWidget {
  const MySecond({super.key});

  @override
  State<MySecond> createState() => _MySecondState();
}

enum leadScreeStatus { Lost, Warm, YTC, ENROLLED }

class _MySecondState extends State<MySecond> {
  bool viewVisible = true;
  bool viewVisibleSecond = true;
  DateTime currentTime = DateTime.now();
  String? mstatus;
  var myColor = Colors.yellow;
  //var mydate = formatDate(DateTime.now(), [dd, '/', mm, '/', yyyy]);
  var myColorOfContainer;
  var formattedDate =
      DateFormat('dd MMM yyyy').format(DateTime.now()).toString();
  List<bool> isFav = [];
  List<bool> myFav = [];
  List<bool> myStarFav = [];
  leadScreeStatus? myLeadStatus;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFav = [];
    myStarFav = [];
    for (var i = 0; i < 15; i++) {
      myFav.add(false);
    }

    for (var i = 0; i < 15; i++) {
      myStarFav.add(false);
    }
  }

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

  void showSecondWidget() {
    setState(() {
      viewVisibleSecond = true;
    });
  }

  void hideSecondWidget() {
    setState(() {
      viewVisibleSecond = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('show/hide Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              child: Container(
                color: Colors.green,
                height: 60,
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Upcoming'),
                    Icon(
                      viewVisible ? Icons.arrow_forward : Icons.arrow_downward,
                    ),
                  ],
                ),
              ),
              onTap: () {
                print('=====Tapped=====');
                setState(() {
                  viewVisible = !viewVisible;
                });
              },
            ),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: viewVisible,
              child: Container(
                height: 250,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CommonListCard(
                          'LD003171',
                          //leadScreeStatus.ENROLLED.toString(),
                          myFunc(leadScreeStatus.Warm),
                          'Renu Pathak',
                          'Rahil',
                          '(M)',
                          IconButton(
                            onPressed: () {
                              setState(() {
                                myFav[index] = !myFav[index];
                              });
                            },
                            icon: Icon(
                              myFav[index] ? Icons.star : Icons.star_border,
                              color: Colors.amber.shade500,
                            ),
                          ),
                          '4 years 11 months',
                          myColor = myColorFunction(leadScreeStatus.ENROLLED)
                              as MaterialColor,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              child: Container(
                color: Colors.green,
                height: 60,
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Upcoming'),
                    Icon(
                      viewVisibleSecond
                          ? Icons.arrow_forward
                          : Icons.arrow_downward,
                    ),
                  ],
                ),
              ),
              onTap: () {
                print('=====Tapped=====');
                setState(() {
                  viewVisibleSecond = !viewVisibleSecond;
                });
              },
            ),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: viewVisibleSecond,
              child: Container(
                height: 250,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CommonListCard(
                          'LD003171',
                          //leadScreeStatus.ENROLLED.toString(),
                          myFunc(leadScreeStatus.Warm),
                          'Renu Pathak',
                          'Rahil',
                          '(M)',
                          IconButton(
                            onPressed: () {
                              setState(() {
                                myStarFav[index] = !myStarFav[index];
                              });
                            },
                            icon: Icon(
                              myStarFav[index] ? Icons.star : Icons.star_border,
                              color: Colors.amber.shade500,
                            ),
                          ),
                          '4 years 11 months',
                          myColor = myColorFunction(leadScreeStatus.ENROLLED)
                              as MaterialColor,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }

  Color myColorFunction([leadScreeStatus? enrolled]) {
    switch (enrolled) {
      case leadScreeStatus.ENROLLED:
        myColorOfContainer = Colors.green;
        break;
      case leadScreeStatus.Lost:
        myColorOfContainer = Colors.red;
        break;
      case leadScreeStatus.YTC:
        myColorOfContainer = Colors.blueGrey;
        break;
      case leadScreeStatus.Warm:
        myColorOfContainer = Colors.brown;
        break;
      default:
        myColorOfContainer = Colors.white;
    }
    return myColorOfContainer;
  }

  myFunc([leadScreeStatus? enrolled]) {
    if (leadScreeStatus.ENROLLED == enrolled) {
      return 'Enrolled';
    } else if (leadScreeStatus.Lost == enrolled) {
      return 'Lost';
    } else if (leadScreeStatus.Warm == enrolled) {
      return 'Warm';
    } else if (leadScreeStatus.YTC == enrolled) {
      return 'YTC';
    }
  }
}

class CommonListCard extends StatelessWidget {
  String leadId;
  String myLeadStatus;
  String parentName;
  String childName;
  String childAge;
  String gender;
  IconButton iconButton;
  Color myColor;

  CommonListCard(
      this.leadId,
      this.myLeadStatus,
      this.parentName,
      this.childName,
      this.gender,
      this.iconButton,
      this.childAge,
      this.myColor);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 9,
            left: 9,
            bottom: 2,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height / 7.4,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(100, 221, 221, 221),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 7,
                    left: 0,
                    right: 0,
                    bottom: 1,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8.3,
                    width: 6,
                    decoration: BoxDecoration(
                      color: myColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  top: 10,
                                  right: 8,
                                  bottom: 0,
                                ),
                                child: Text(
                                  leadId,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  myLeadStatus,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  top: 10,
                                ),
                                child: iconButton),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 1,
                          left: 12,
                        ),
                        child: Text(
                          '$parentName',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            'Child:',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${childName}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${gender}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '$childAge',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
