import 'package:flutter/material.dart';
import 'package:uitest/screens/casualty_list/mobile/casualty_mobile_portrait_screen.dart';
import 'mobile/casualty_mobile_landscape_screen.dart';
import 'mobile/casualty_mobile_screen.dart';
import 'tablet/casualty_tablet_screen.dart';

// class CasualtyScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Determine if the device is mobile or large screen
//     bool isMobile = MediaQuery.of(context).size.width < 600;
//
//     // Return different layouts based on the device type
//     return CasualtyMobileScreen();
//     //return isMobile ? CasualtyMobileScreen() : CasualtyLargeScreen();
//   }
// }

import 'package:flutter/material.dart';
import 'mobile/casualty_mobile_portrait_screen.dart';
import 'mobile/casualty_mobile_landscape_screen.dart';
import 'tablet/casualty_tablet_screen.dart';


class CasualtyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Determine if the device is mobile or tablet based on screen width
    bool isMobile = MediaQuery.of(context).size.width < 850;
    // Determine if the device is in portrait or landscape orientation
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    // Print statements to track the layout decision process
    print('Screen width: ${MediaQuery.of(context).size.width}');
    print('Is mobile: $isMobile');
    print('Orientation: ${isPortrait ? "Portrait" : "Landscape"}');

    // Logic to return different layouts based on device type and orientation
    if (isMobile) {
      print('Displaying Mobile Layout');
      return isPortrait
          ? CasualtyMobilePortraitScreen() // Mobile portrait screen
          : CasualtyMobileLandscapeScreen(); // Mobile landscape screen
    } else {
      print('Displaying Tablet or Larger Screen Layout');
      return CasualtyLargeScreen();
      // ? CasualtyTabletScreen() // Tablet portrait screen
      // : CasualtyTabletLandscapeScreen(); // Tablet landscape screen
    }
  }
}