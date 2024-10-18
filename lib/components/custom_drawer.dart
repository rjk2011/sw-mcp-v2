import 'package:flutter/material.dart';
import 'package:uitest/screens/casualty/mobile/casualty_batdokview_screen.dart';

import '../screens/casualty/caualty_main_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current theme's scaffold background color
    Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Drawer(
      child: Container(
        color: backgroundColor,  // Use theme-based background color
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,  // You can customize this or use the theme
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.asset(
                  //   'assets/logo.png', // Your logo path
                  //   height: 50,
                  // ),
                  SizedBox(height: 20),
                  Text(
                    'SIMWERX', // Brand name or title
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to Home Page
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Casualty'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CasualtyScreen()),  // Push CasualtyScreen
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.insights),
              title: Text('Insights'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to Insights Page
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Reports'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to Reports Page
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('BATDOK '),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CasualtyScreenBatdok()),  // Push CasualtyScreen
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to Settings Page
              },
            ),
          ],
        ),
      ),
    );
  }
}
