import 'package:flutter/material.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';
import 'package:heatmap_calendar/time_utils.dart';

class HeatmapCalendarExample extends StatelessWidget {
  const HeatmapCalendarExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final today = TimeUtils.removeTime(DateTime.now());
    return Column(
      children: [
        Text(
          'Heatmap calendar',
          style: Theme.of(context).textTheme.headline4,
        ),
        HeatMapCalendar(
          input: {
            today.subtract(const Duration(days: 1)): 40,
            today.subtract(const Duration(days: 2)): 30,
            today.subtract(const Duration(days: 3)): 10,
            today.subtract(const Duration(days: 5)): 30,
            today.subtract(const Duration(days: 7)): 15,
            today.subtract(const Duration(days: 10)): 5,
            today.subtract(const Duration(days: 14)): 10,
            today.subtract(const Duration(days: 28)): 5,
          },
          colorThresholds: {
            1: Colors.green[100],
            10: Colors.green[300],
            30: Colors.green[500],
          },
          squareSize: 18,
          textOpacity: 0.3,
          labelTextColor: Colors.blueGrey,
          dayTextColor: Colors.blue[500],
        ),
        const Text('(Double tap to toggle dates text)'),
      ],
    );
  }
}
