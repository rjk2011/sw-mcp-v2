import 'package:flutter/material.dart';

import 'casualty_detail/casualty_detail_home.dart';


class CasualtyButtonScreen extends StatelessWidget {

  final String casualtyId; // Add casualtyId as a final field

  // Constructor to accept casualtyId
  CasualtyButtonScreen({required this.casualtyId});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Casualty Button Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to CasualtyDetailHome and pass casualtyId
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CasualtyDetailHome(casualtyId: '12345'), // Pass a casualtyId
              ),
            );
          },
          child: Text('Go to Casualty Detail Home'),
        ),
      ),
    );
  }
}
