import 'package:flutter/material.dart';
import 'package:memotive/Favorite/favorite_main.dart';
import 'package:memotive/Search/search_main.dart';
import 'package:memotive/My/my_main.dart';
import 'Home/home_main.dart';
import 'Community/community_main.dart';

class NavigationService {
  static void navigateToScreen(BuildContext context, int index) {
    Widget destinationWidget;

    switch (index) {
      case 0:
        destinationWidget = HomeMain();
        break;
      case 1:
        destinationWidget = SearchMain();
        break;
      case 2:
        destinationWidget = CommunityMain();
        break;
      case 3:
        destinationWidget = FavoriteMain();
        break;
      case 4:
        destinationWidget = MyMain();
        break;
      default:
        destinationWidget = HomeMain(); // 기본값 설정
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation1,
            Animation<double> animation2) {
          return destinationWidget;
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation1,
            Animation<double> animation2, Widget child) {
          const begin = 0.0;
          const end = 1.0;
          var fadeTween = Tween<double>(begin: begin, end: end);

          var fadeAnimation = fadeTween.animate(animation1);

          return FadeTransition(
            opacity: fadeAnimation,
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 200),
      ),
    );
  }
}
