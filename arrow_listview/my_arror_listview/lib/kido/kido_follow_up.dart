import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:my_arror_listview/self_main/exp_collapse.dart';

class KidoFollowUp extends StatefulWidget {
  const KidoFollowUp({super.key});

  @override
  State<KidoFollowUp> createState() => _KidoFollowUpState();
}

class _KidoFollowUpState extends State<KidoFollowUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('kids follow up'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [MyFirstWidget()],
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
  List<bool> isVisible = [];
  var count = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isVisible = [];
    for (var i = 0; i < 10; i++) {
      isVisible.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Column(
        children: [
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
                //expandIcon: Icons.arrow_downward,
                //collapseIcon: Icons.arrow_forward_ios,
                //hasIcon: false,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),

              // header: Card(
              //   child: Row(
              //     children: const [
              //       Text('see data'),
              //       //Icon(Icons.arrow_downward)
              //     ],
              //   ),
              // ),
              collapsed: Card(
                elevation: 10,
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  // decoration: BoxDecoration(color: Colors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Overdue',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('$count'),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 21,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // expanded: Container(
              //     width: double.maxFinite,
              //     height: double.maxFinite,
              //     child: MyTextListWidget()),
              expanded: Column(
                children: [
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Overdue',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('$count'),
                            const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 33,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  for (var i in Iterable.generate(5))
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CommonListCard(
                        '${i + 1}',
                        'Warm',
                        'Abc',
                        'Child Name',
                        'Male',
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.star_border_rounded)),
                        '15',
                        Colors.blue,
                      ),
                    ),
                ],
              ),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(
                    crossFadePoint: 0,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Text(
            'Second Overdue',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
            ),
          ),
          ScrollOnExpand(
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                //expandIcon: Icons.arrow_downward,
                //collapseIcon: Icons.arrow_forward_ios,
                //hasIcon: false,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),

              // header: Card(
              //   child: Row(
              //     children: const [
              //       Text('see data'),
              //       //Icon(Icons.arrow_downward)
              //     ],
              //   ),
              // ),
              collapsed: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Row(
                    //   children: const [
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     Text(
                    //       'Overdue',
                    //       style: TextStyle(
                    //         color: Colors.red,
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text('$count'),
                    //     const SizedBox(
                    //       width: 8,
                    //     ),
                    //     const Icon(
                    //       Icons.arrow_forward_ios,
                    //       size: 21,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              // expanded: Container(
              //     width: double.maxFinite,
              //     height: double.maxFinite,
              //     child: MyTextListWidget()),
              expanded: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Yesterday-Overdue',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('$count'),
                          const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 33,
                          )
                        ],
                      ),
                    ],
                  ),
                  for (var i in Iterable.generate(5))
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CommonListCard(
                        '${i + 1}',
                        'Warm',
                        'Abc',
                        'Child Name',
                        'Male',
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible[i] = !isVisible[i];
                              });
                            },
                            icon: Icon(
                              isVisible[i]
                                  ? Icons.star_rate_sharp
                                  : Icons.star_border,
                            )),
                        '15',
                        Colors.blue,
                      ),
                    ),
                ],
              ),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(
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
