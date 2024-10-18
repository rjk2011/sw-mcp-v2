import 'package:flutter/material.dart';
import 'casualty_mobile_screen.dart';
import 'casualty_tablet_screen.dart';

class CasualtyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Determine if the device is mobile or large screen
    bool isMobile = MediaQuery.of(context).size.width < 600;

    // Return different layouts based on the device type
    return CasualtyMobileScreen();
    //return isMobile ? CasualtyMobileScreen() : CasualtyLargeScreen();
  }
}

