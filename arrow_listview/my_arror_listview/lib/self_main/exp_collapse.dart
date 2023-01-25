import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpCollapse extends StatefulWidget {
  const ExpCollapse({super.key});

  @override
  State<ExpCollapse> createState() => _ExpCollapseState();
}

class _ExpCollapseState extends State<ExpCollapse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Self Work On Exapanded and Collapse'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyFirstWidget(),
            MyFirstWidget(),
            MyFirstWidget(),
          ],
        ),
      ),
    );
  }
}

class MyFirstWidget extends StatefulWidget {
  const MyFirstWidget({super.key});

  @override
  State<MyFirstWidget> createState() => _MyFirstWidgetState();
}

class _MyFirstWidgetState extends State<MyFirstWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            child: Card(
              child: Column(
                children: [Text('Overdue')],
              ),
            ),
          ),
          // CommonListCard(
          //     '1',
          //     'myLeadStatus',
          //     'parentName',
          //     'childName',
          //     'gender',
          //     IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          //     '1',
          //     Colors.blue),
          ScrollOnExpand(
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),
              header: Row(
                children: const [
                  Text('see data'),
                ],
              ),
              collapsed: Container(
                child: Text('Collapsed View'),
              ),
              expanded: Container(
                  width: double.maxFinite,
                  //height: double.maxFinite,
                  child: MyTextListWidget()),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: ExpandableThemeData(
                    crossFadePoint: 0,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget MyTextListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return CommonListCard(
          '${index + 1}',
          'Warm',
          'Abc',
          'Child Name',
          'Male',
          IconButton(onPressed: () {}, icon: Icon(Icons.star)),
          '15',
          Colors.blue,
        );
      },
    );
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
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                myLeadStatus,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
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
                          child: Text('Child:',
                              style: TextStyle(color: Colors.amber)),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${childName}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${gender}',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '$childAge',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
