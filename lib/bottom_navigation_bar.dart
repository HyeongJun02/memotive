import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'My',
          backgroundColor: Colors.lightGreen,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: 'My',
          backgroundColor: Colors.lightGreen,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          backgroundColor: Colors.lightGreen,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'My',
          backgroundColor: Colors.lightGreen,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_outlined),
          label: 'Menu',
          backgroundColor: Colors.lightGreen,
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      onTap: onItemTapped,
    );
  }
}
