import 'package:flutter/material.dart';
import 'package:uitest/screens/casualty_list/mobile/casualty_batdokview_screen.dart';
import '../screens/casualty_detail/casualty_detail_home.dart';
import '../screens/casualty_detail/casualty_detail_screen.dart';
import '../screens/casualty_list/mobile/casualty_mobile_landscape_screen.dart';
import '../screens/casualty_list/mobile/casualty_mobile_portrait_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/test_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current theme's scaffold background color
    Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    // Determine if the device is in portrait or landscape mode
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

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
            // Home Option
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CasualtyDetailHome(casualtyId: "5678s",)),  // Push CasualtyPortraitScreen
                );
                // Navigate to Home Page
              },
            ),
            // Casualty Option (Single entry with dynamic behavior)
            if (isPortrait)
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Casualty'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CasualtyMobilePortraitScreen()),  // Push CasualtyPortraitScreen
                  );
                },
              )
            else
              ExpansionTile(
                leading: Icon(Icons.person),
                title: Text('Casualty'),
                children: <Widget>[
                  ListTile(
                    title: Text('Casualty Summary'),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CasualtyMobileLandscapeScreen()),  // Navigate to Casualty Summary screen
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Vitals'),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CasualtyScreenBatdok()),  // Navigate to Current Vitals screen
                      );
                    },
                  ),
                ],
              ),
            // Insights Option
            ListTile(
              leading: Icon(Icons.insights),
              title: Text('Insights'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CasualtyButtonScreen(casualtyId: '12345')),  // Navigate to Current Vitals screen
                );
              },
            ),
            // Reports Option
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Reports'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to Reports Page
              },
            ),

            Divider(),
            // Settings Option
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),  // Push CasualtyPortraitScreen
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
