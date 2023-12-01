import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:soen357_project/budget/expense.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}
class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
class _BudgetPageState extends State<BudgetPage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    data = [
      _ChartData('David', 25),
      _ChartData('Steve', 38),
      _ChartData('Jack', 34),
      _ChartData('Others', 52)
    ];
    _tooltip = TooltipBehavior(enable: true);
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('MY BUDGETING'),
    ),
    body: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // navigate to expense page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExpensePage()),
            );
          },
          child: const Text('Add New Expense',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.green,
          child: Text(
            'Great Job! You are on track with keeping to your budget',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
              children:[
                Text(
                  'Weekly budget left: \$50/250',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SfLinearGauge(
              barPointers: [LinearBarPointer(value: 20)]
          )]),
        ),

        Expanded(
          child: SfCircularChart(
  tooltipBehavior: _tooltip,
  series: <CircularSeries<dynamic, dynamic>>[
    DoughnutSeries<_ChartData, String>(
      dataSource: data,
      xValueMapper: (_ChartData data, _) => data.x,
      yValueMapper: (_ChartData data, _) => data.y,
      name: 'Gold',
      innerRadius: '80%',
    ),
  ],
  annotations: <CircularChartAnnotation>[
    CircularChartAnnotation(
      widget: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$743.20 spent this month',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            '80% spent of budget',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
    ),
  ],
),
        ),
      ],
    ),
  );
}}