import 'package:flutter/material.dart';

class SeverityCardWidget extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  // Constructor to accept label, count, and color
  SeverityCardWidget({
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: 100,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(color: color),
            ),
            SizedBox(height: 5),
            Text(
              count.toString(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
