import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;
  final double? iconSize = 30;
  // final double? activeIconSize = 30;

  // 현재 사용 X
  static const Color bottomBarColor = Color.fromARGB(255, 255, 136, 0);

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: iconSize), // 아이콘 크기 변경
          activeIcon: Icon(Icons.home, size: iconSize), // 활성 상태 아이콘 크기 변경
          label: '홈',
          backgroundColor: bottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined, size: iconSize), // 아이콘 크기 변경
          activeIcon: Icon(Icons.search, size: iconSize), // 활성 상태 아이콘 크기 변경
          label: '검색',
          backgroundColor: bottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined, size: iconSize), // 아이콘 크기 변경
          activeIcon: Icon(Icons.message, size: iconSize), // 활성 상태 아이콘 크기 변경
          label: '커뮤니티',
          backgroundColor: bottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline, size: iconSize), // 아이콘 크기 변경
          activeIcon: Icon(Icons.favorite, size: iconSize), // 활성 상태 아이콘 크기 변경
          label: '찜 목록',
          backgroundColor: bottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined, size: iconSize), // 아이콘 크기 변경
          activeIcon: Icon(Icons.person, size: iconSize), // 활성 상태 아이콘 크기 변경
          label: '마이페이지',
          backgroundColor: bottomBarColor,
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.grey[800],
      unselectedItemColor: Colors.grey[400],
      onTap: onItemTapped,
    );
  }
}
