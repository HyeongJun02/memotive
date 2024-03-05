import 'package:flutter/material.dart';
import 'package:memotive/bottom_navigation_bar.dart';
import 'package:memotive/navigation_service.dart';

class CommunityMain extends StatelessWidget {
  const CommunityMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CommunityMain'),
      ),
      body: Center(
        child: Text('CommunityMain Content'),
      ),
      // 하단 네비게이션 바 추가
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        onItemTapped: (index) {
          NavigationService.navigateToScreen(context, index);
        },
      ),
    );
  }
}
