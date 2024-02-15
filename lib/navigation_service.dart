import 'package:flutter/material.dart';
import 'Home/home_main.dart';
import 'More/more_main.dart';

class NavigationService {
  static void navigateToScreen(BuildContext context, int index) {
    // BottomNavigationBar의 index에 따라 화면 전환
    switch (index) {
      // case 0:
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyScreen()));
      //   break;
      // case 1:
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen()));
      //   break;
      case 2:
        // Home 화면으로 이동
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeMain()));
        break;
      // case 3:
      //   // My 화면으로 이동
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => MyMain()));
      //   break;
      case 4:
        // More 화면으로 이동
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MoreMain()));
        break;
    }
  }
}
