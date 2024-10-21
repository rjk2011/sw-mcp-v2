
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VitalsLineChart extends StatelessWidget {
  final String casualtyId;
  final Map<String, List<FlSpot>> vitalsData; // This holds the list of data points for each vital.

  VitalsLineChart({
    required this.casualtyId,
    required this.vitalsData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1.0,
                getTitlesWidget: (value, meta) {
                  return Text(
                    _getTimeLabel(value),
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: _buildLineBars(),
        ),
      ),
    );
  }

  List<LineChartBarData> _buildLineBars() {
    return vitalsData.entries.map((entry) {
      return LineChartBarData(
        spots: entry.value,
        isCurved: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        color: _getColorForVital(entry.key),
        barWidth: 2,
      );
    }).toList();
  }

  Color _getColorForVital(String vital) {
    switch (vital) {
      case 'HR':
        return Colors.red;
      case 'SpO2':
        return Colors.blue;
      case 'MAP':
        return Colors.green;
      case 'ETCO2':
        return Colors.teal;
      case 'TEMP':
        return Colors.purple;
      case 'UO':
        return Colors.orange;
      case 'PAIN':
        return Colors.pink;
      case 'SHOCK':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  // This is just a placeholder for converting x-axis values to time labels.
  String _getTimeLabel(double value) {
    // Assuming each value corresponds to a time interval in minutes
    DateTime time = DateTime(2024, 10, 21, 14, 30).add(Duration(minutes: value.toInt()));
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}
