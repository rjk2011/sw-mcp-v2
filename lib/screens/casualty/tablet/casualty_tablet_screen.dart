// Larger screen layout (tablet/desktop)
import 'package:flutter/material.dart';


class CasualtyLargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Casualty - Large Screen '),
      ),
      body: Center(
        child: Text(
          'This is the Large Screen Casualty Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}