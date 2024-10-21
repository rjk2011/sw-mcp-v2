import 'package:flutter/material.dart';

import '../screens/casualty_detail/casualty_detail_home.dart';

class CasualtySummaryCard extends StatelessWidget {
  final String name;
  final String lastUpdated;
  final int vitals;
  final int insights;
  final int severity;
  final String? casualtyId; // Add casualtyId as an optional parameter

  // Constructor to accept necessary parameters
  CasualtySummaryCard({
    required this.name,
    required this.lastUpdated,
    required this.vitals,
    required this.insights,
    required this.severity,
    this.casualtyId, // Include casualtyId in constructor
  });

  // Determine icon color based on severity
  Color _getSeverityColor() {
    switch (severity) {
      case 1:
        return Colors.red; // High severity
      case 2:
        return Colors.orange; // Medium severity
      case 3:
        return Colors.yellow; // Low severity
      default:
        return Colors.grey; // Unclassified
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getSeverityColor(),
          child: Icon(Icons.insights, color: Colors.white),
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Last Updated aaa: $lastUpdated'),
            Row(
              children: [
                Icon(Icons.favorite, size: 16),
                SizedBox(width: 5),
                Text('$vitals No. Vitals'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.insights, size: 16),
                SizedBox(width: 5),
                Text('$insights No. Insights'),
              ],
            ),
          ],
        ),
        // Wrap the trailing icon in an InkWell to make it clickable
        trailing: InkWell(
          onTap: () {
            if (casualtyId != null) {
              // Navigate to CasualtyDetailScreen and pass the casualtyId
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CasualtyDetailHome(casualtyId: casualtyId!),
                ),
              );
            }
          },
          child: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}

