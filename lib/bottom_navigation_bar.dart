import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  static const Color bottomBarColor = Color.fromARGB(255, 255, 136, 0);

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'My',
          backgroundColor: bottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: 'My',
          backgroundColor: bottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          backgroundColor: bottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'My',
          backgroundColor: bottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_outlined),
          label: 'Menu',
          backgroundColor: bottomBarColor,
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      onTap: onItemTapped,
    );
  }
}
