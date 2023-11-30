import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: Stack(
        children: [
          SfCircularChart(
            tooltipBehavior: _tooltip,
            series: <CircularSeries<dynamic, dynamic>>[
              DoughnutSeries<_ChartData, String>(
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                innerRadius: '80%',
                name: 'Gold',
              ),
            ],
          ),
          Center(
            child: Text(
              'xxxx spent this month, 80% of budget spent',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}