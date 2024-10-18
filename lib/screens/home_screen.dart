import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;

  HomeScreen({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MedicCopilot'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: toggleTheme,
          child: Text(
            'Toggle Light/Dark Mode',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),

      drawer: CustomDrawer(),  // Use the CustomDrawer widget

    );
  }
}
