import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _data1 = <double, double>{1: 9, 2: 12, 3: 10, 4: 20, 5: 14, 6: 18};
final _data2 = <double, double>{1: 8, 2: 15, 3: 17, 4: 11, 5: 13, 6: 20};

class FlBarChartExample extends StatefulWidget {
  const FlBarChartExample({Key key}) : super(key: key);

  @override
  _FlBarChartExampleState createState() => _FlBarChartExampleState();
}

class _FlBarChartExampleState extends State<FlBarChartExample> {
  bool _showBorder = true;
  bool _showGrid = false;

  @override
  Widget build(BuildContext context) {
    final barGroups = <BarChartGroupData>[
      for (final entry in _data1.entries)
        BarChartGroupData(
          x: entry.key.toInt(),
          barRods: [
            BarChartRodData(y: entry.value, colors: [Colors.blue]),
            BarChartRodData(y: _data2[entry.key], colors: [Colors.red]),
          ],
        ),
    ];

    final barChartData = BarChartData(
      maxY: 25,
      barGroups: barGroups,
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey,
        ),
      ),
      borderData: FlBorderData(show: _showBorder),
      gridData: FlGridData(show: _showGrid),
      axisTitleData: FlAxisTitleData(
        show: true,
        bottomTitle: AxisTitle(titleText: 'Month', showTitle: true),
        leftTitle: AxisTitle(titleText: 'Sales', showTitle: true),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTitles: (double val) =>
              DateFormat.MMM().format(DateTime(2020, val.toInt())),
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (double val) {
            if (val.toInt() % 5 != 0) return '';
            return '${val.toInt()}';
          },
        ),
      ),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BarChart(barChartData),
      ),
      bottomNavigationBar: _buildControlWidgets(),
    );
  }

  Widget _buildControlWidgets() {
    return Container(
      height: 200,
      color: Colors.grey[200],
      child: ListView(
        children: [
          SwitchListTile(
            title: const Text('ShowBorder'),
            onChanged: (bool val) => setState(() => this._showBorder = val),
            value: this._showBorder,
          ),
          SwitchListTile(
            title: const Text('ShowGrid'),
            onChanged: (bool val) => setState(() => this._showGrid = val),
            value: this._showGrid,
          ),
        ],
      ),
    );
  }
}
