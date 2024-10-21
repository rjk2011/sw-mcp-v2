import 'package:flutter/material.dart';

class VitalTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;

  const VitalTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Text(
              value,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class VitalGrid extends StatelessWidget {
  final int minTilesInFirstRow;
  final String casualtyId;

  const VitalGrid({
    Key? key,
    required this.casualtyId,  // Pass casualtyId to the grid
    this.minTilesInFirstRow = 3,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: minTilesInFirstRow, // Set number of tiles in the first row
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: [
        VitalTile(title: 'PAIN', subtitle: 'INDEX', value: '6'),
        VitalTile(title: 'SHOCK', subtitle: 'INDEX', value: '8'),
        VitalTile(title: 'HR', subtitle: 'BPM', value: '90'),
        VitalTile(title: 'MAP', subtitle: 'mmHG', value: '-'),
        VitalTile(title: 'RP', subtitle: 'RPM', value: '90'),
        VitalTile(title: 'SP02', subtitle: '%', value: '78'),
        VitalTile(title: 'ETC02', subtitle: '%', value: '90'),
        VitalTile(title: 'TEMP', subtitle: '0C', value: '29.6'),
        VitalTile(title: 'UO', subtitle: 'm/hr', value: '90'),
      ],
    );
  }
}
