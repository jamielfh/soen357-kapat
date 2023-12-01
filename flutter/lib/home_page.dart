import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:soen357_project/analytics/analytics.dart';
import 'package:soen357_project/budget/budget.dart';
import 'package:soen357_project/education/education.dart';
import 'package:soen357_project/goalsetting/goal_setting.dart';
import 'package:soen357_project/usersupport/user_support.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Food', 40),
      _ChartData('Transport', 30),
      _ChartData('Retail', 20),
      _ChartData('Others', 10)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
                "Dashboard",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
        actions: <Widget>[
          IconButton(
                icon: const Icon(
                  Icons.settings,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserSupportPage()),
                  );
                },
              ),
            ]
      ),
      body: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                // User welcome message
                const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text(
                      "Welcome back, user!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    )),

                // Card to show budget overall statistics
                GestureDetector(
                  child: Card(
                    elevation: 10,
                    color: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.9),
                    child: SizedBox(
                      height: 160,
                      width: MediaQuery.of(context).size.width - 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 15, 6, 15),
                                  child: Text(
                                    "\$50.00",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold
                                    ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 25, 15, 15),
                                  child: Text(
                                    "left",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),),
                                ),
                          ]),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            child: GFProgressBar(
                              percentage: 0.9,
                              backgroundColor: Colors.pink.shade50,
                              progressBarColor: Colors.pinkAccent,
                              lineHeight: 25,
                              child: const Text('90%', 
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16),
                                  ),
                          )),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                              child: Text(
                                "\$450.00 of \$500.00 spent",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic
                                ),),),
                        ],
                      )
                    )
                  ),
                  onTap: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const BudgetPage()
                              )
                      );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 10),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Card(
                        elevation: 10,
                        color: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.4),
                        child: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width / 2 - 28,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Text(
                                "Savings Goal",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),),),
                              SizedBox(
                                height: 100,
                                child: GFProgressBar(
                                    percentage: 0.7,
                                    radius: 90,
                                    circleWidth: 10,
                                    type: GFProgressType.circular,
                                    backgroundColor: Colors.grey,
                                    progressBarColor: Colors.pinkAccent,
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Text('70%', textAlign: TextAlign.end,
                                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                            ),
                                      ),
                                ),
                              ),
                              const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                              child: Text(
                                "\$450.00 of \$500.00 saved",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic
                                ),),),
                            ],
                          )
                        )
                      ),
                      onTap:() {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const GoalSettingPage()
                                  )
                          );
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        elevation: 10,
                        color: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.4),
                        child: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width / 2 - 28,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Text(
                                "Top Expenses",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),),),
                              SizedBox(
                                height: 155,
                                child: SfCircularChart(
                                    tooltipBehavior: _tooltip,
                                    series: <CircularSeries<dynamic, dynamic>>[
                                      DoughnutSeries<_ChartData, String>(
                                          dataSource: data,
                                          xValueMapper: (_ChartData data, _) => data.x,
                                          yValueMapper: (_ChartData data, _) => data.y,
                                          dataLabelMapper: (_ChartData data, _) => data.x,
                                          name: 'Gold',
                                          dataLabelSettings: const DataLabelSettings(
                                            isVisible: true,
                                        ))
                                    ])
                              )
                            ]
                          ))
                      ),
                      onTap:() {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const AnalyticsPage()
                                  )
                          );
                      },
                    ),
                  ],
                  ),
                ),
                // Card to show education tips
                GestureDetector(
                  child: Card(
                    color: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.4),
                    child: SizedBox(
                      height: 280,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                                  padding: EdgeInsets.fromLTRB(15, 15, 6, 6),
                                  child: Text(
                                    "Tips For You",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),),
                                ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                            child: Card(
                              elevation: 4,
                              child: SizedBox(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              child: Text(
                                                  "Education text here",
                                                  style: TextStyle(
                                                      fontSize: 15, color: Colors.black)))
                                        ]
                                  ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                            child: Card(
                              elevation: 4,
                              child: SizedBox(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              child: Text(
                                                  "Education text here",
                                                  style: TextStyle(
                                                      fontSize: 15, color: Colors.black)))
                                        ]
                                  ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                            child: Card(
                              elevation: 4,
                              child: SizedBox(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              child: Text(
                                                  "Education text here",
                                                  style: TextStyle(
                                                      fontSize: 15, color: Colors.black)))
                                        ]
                                  ))),
                          ),
                        ],
                      )
                    )
                  ),
                  onTap: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const EducationPage()
                              )
                      );
                  },
                ),
      ]// This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
 
  final String x;
  final double y;
}