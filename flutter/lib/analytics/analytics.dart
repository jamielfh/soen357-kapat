import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  late List<_ChartData> data;
  late List<_ChartData> data2;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Food', 40),
      _ChartData('Transport', 30),
      _ChartData('Retail', 20),
      _ChartData('Others', 10)
    ];
    data2 = [
      _ChartData('Aug', 500),
      _ChartData('Sep', 450),
      _ChartData('Oct', 480),
      _ChartData('Nov', 400)
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
                "Analytics",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
        ),
        body: ListView(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Top Expenses",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),),
            SfCircularChart(
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
                ]),
            const Divider(),
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  "Monthly Spending",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),),
            SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(minimum: 0, maximum: 600, interval: 100),
              tooltipBehavior: _tooltip,
              series: <ChartSeries<_ChartData, String>>[
                ColumnSeries<_ChartData, String>(
                    dataSource: data2,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                )
            ])
          ]
        )
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
 
  final String x;
  final double y;
}