import 'package:flutter/material.dart';
import 'package:memotive/bottom_navigation_bar.dart';
import 'package:memotive/navigation_service.dart';

class SettingsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Text(
                '설정 1',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            // 그룹 1
            ListTile(
              leading: Icon(Icons.shop_outlined),
              title: Text('Item 2'),
            ),
            ListTile(
              leading: Icon(Icons.shop_outlined),
              title: Text('Item 3'),
            ),
            ListTile(
              leading: Icon(Icons.shop_outlined),
              title: Text('Item 4'),
            ),
            ListTile(
              leading: Icon(Icons.shop_outlined),
              title: Text('Item 5'),
            ),
            Divider(), // 그룹 1과 나머지 아이템 구분선
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Text(
                '설정 2',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            // 그룹 2
            ListTile(
              title: Text('Item 6'),
            ),
            ListTile(
              title: Text('Item 7'),
            ),
            ListTile(
              title: Text('Item 8'),
            ),
            ListTile(
              title: Text('Item 9'),
            ),
            ListTile(
              title: Text('Item 10'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4,
        onItemTapped: (index) {
          NavigationService.navigateToScreen(context, index);
        },
      ),
    );
  }
}
