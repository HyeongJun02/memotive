import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  // 현재 사용 X
  static const Color bottomBarColor = Color.fromARGB(255, 255, 136, 0);

  const CustomBottomNavigationBar({super.key, 
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: '홈',
          backgroundColor: bottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          activeIcon: Icon(Icons.search),
          label: '검색',
          backgroundColor: bottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          activeIcon: Icon(Icons.abc),
          label: '커뮤니티',
          backgroundColor: bottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          activeIcon: Icon(Icons.favorite),
          label: '찜 목록',
          backgroundColor: bottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          activeIcon: Icon(Icons.person),
          label: '마이페이지',
          backgroundColor: bottomBarColor,
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      onTap: onItemTapped,
    );
  }
}
