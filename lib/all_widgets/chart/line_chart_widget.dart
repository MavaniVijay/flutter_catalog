import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _data1 = <double, double>{1: 10, 2: 15, 3: 20, 4: 28, 5: 34, 6: 50};
final _data2 = <double, double>{1: 8, 2: 12, 3: 27, 4: 31, 5: 36, 6: 45};

class FlLineChartExample extends StatefulWidget {
  const FlLineChartExample({Key key}) : super(key: key);

  @override
  _FlLineChartExampleState createState() => _FlLineChartExampleState();
}

class _FlLineChartExampleState extends State<FlLineChartExample> {
  bool _showGrid = true;
  bool _isCurved = false;
  bool _showBelowArea = false;
  bool _showDot = true;
  bool _showBorder = true;

  @override
  Widget build(BuildContext context) {
    final spots1 = <FlSpot>[
      for (final entry in _data1.entries) FlSpot(entry.key, entry.value)
    ];
    final spots2 = <FlSpot>[
      for (final entry in _data2.entries) FlSpot(entry.key, entry.value)
    ];

    final lineChartData = LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: spots1,
          colors: [Colors.blue],
          barWidth: 8,
          isCurved: _isCurved,
          dotData: FlDotData(show: _showDot),
          belowBarData:
              BarAreaData(show: _showBelowArea, colors: [Colors.blue[200]]),
        ),
        LineChartBarData(
          spots: spots2,
          colors: [Colors.red],
          barWidth: 4,
          isCurved: _isCurved,
          dotData: FlDotData(show: _showDot),
          belowBarData:
              BarAreaData(show: _showBelowArea, colors: [Colors.red[200]]),
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      borderData: FlBorderData(
        show: _showBorder,
        border: const Border(
          bottom: BorderSide(color: Colors.greenAccent, width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      ),
      gridData: FlGridData(show: _showGrid),
      axisTitleData: FlAxisTitleData(
        show: true,
        bottomTitle: AxisTitle(titleText: 'Month', showTitle: true),
        leftTitle: AxisTitle(titleText: 'Value', showTitle: true),
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
        child: LineChart(lineChartData),
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
            title: const Text('Curved'),
            onChanged: (bool val) => setState(() => this._isCurved = val),
            value: this._isCurved,
          ),
          SwitchListTile(
            title: const Text('ShowGrid'),
            onChanged: (bool val) => setState(() => this._showGrid = val),
            value: this._showGrid,
          ),
          SwitchListTile(
            title: const Text('ShowBorder'),
            onChanged: (bool val) => setState(() => this._showBorder = val),
            value: this._showBorder,
          ),
          SwitchListTile(
            title: const Text('ShowBelowArea'),
            onChanged: (bool val) => setState(() => this._showBelowArea = val),
            value: this._showBelowArea,
          ),
          SwitchListTile(
            title: const Text('ShowDot'),
            onChanged: (bool val) => setState(() => this._showDot = val),
            value: this._showDot,
          ),
        ],
      ),
    );
  }
}
