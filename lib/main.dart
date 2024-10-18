import 'package:flutter/material.dart';
import 'package:uitest/themes/themes.dart';
import 'screens/home_screen.dart';
import 'package:flutter/services.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  // Hide the status bar and the navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Default theme mode is light
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      // Toggle between light and dark mode
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Theme Toggle',
      theme: lightTheme,  // Use the light theme from themes.dart
      darkTheme: darkTheme,  // Use the dark theme from themes.dart
      themeMode: _themeMode,  // Toggle theme mode
      home: HomeScreen(toggleTheme: _toggleTheme),
    );
  }
}

