import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:uitest/components/vitals/vitals_grid.dart';
import 'package:uitest/components/vitals/vitals_line_chart.dart';

class VitalsGridAndLine extends StatelessWidget {
  final String casualtyId;

  VitalsGridAndLine({
    required this.casualtyId,
  });

  @override
  Widget build(BuildContext context) {

    // Mock data for vitals
    Map<String, List<FlSpot>> vitalsData = {
      'HR': [FlSpot(0, 75), FlSpot(1, 78), FlSpot(2, 80), FlSpot(3, 79)],
      'SpO2': [FlSpot(0, 95), FlSpot(1, 96), FlSpot(2, 97), FlSpot(3, 96)],
      'MAP': [FlSpot(0, 65), FlSpot(1, 66), FlSpot(2, 67), FlSpot(3, 65)],
      'ETCO2': [FlSpot(0, 40), FlSpot(1, 41), FlSpot(2, 42), FlSpot(3, 41)],
      'TEMP': [FlSpot(0, 36.8), FlSpot(1, 36.9), FlSpot(2, 37.0), FlSpot(3, 37.1)],
      'UO': [FlSpot(0, 500), FlSpot(1, 520), FlSpot(2, 530), FlSpot(3, 540)],
      'PAIN': [FlSpot(0, 2), FlSpot(1, 3), FlSpot(2, 4), FlSpot(3, 5)],
      'SHOCK': [FlSpot(0, 0), FlSpot(1, 0), FlSpot(2, 1), FlSpot(3, 1)],
    };



    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Render VitalGrid first
          VitalGrid(casualtyId: casualtyId),
          SizedBox(height: 16), // Add some space between the components

          // Render VitalsLineChart second
          VitalsLineChart(casualtyId: casualtyId, vitalsData: vitalsData),
        ],
      ),
    );
  }
}