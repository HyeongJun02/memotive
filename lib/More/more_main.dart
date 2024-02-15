import 'package:flutter/material.dart';
import 'package:memotive/bottom_navigation_bar.dart';
import 'package:memotive/navigation_service.dart';

import '../Login/login_main.dart';

class MoreMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Main'),
      ),
      body: Center(
        child: Text('Menu Main Content'),
      ),
      // 하단 네비게이션 바 추가
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4,
        onItemTapped: (index) {
          NavigationService.navigateToScreen(context, index);
        },
      ),
    );
  }
}
