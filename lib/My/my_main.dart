import 'package:flutter/material.dart';
import 'package:memotive/bottom_navigation_bar.dart';
import 'package:memotive/navigation_service.dart';
import 'my_favorite.dart';

class MyMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Main'),
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
              leading: Icon(Icons.favorite_outline),
              title: Text('My Favorite'),
              onTap: () {
                // Item 1을 눌렀을 때 MyFavoritePage로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyFavorite()),
                );
              },
            ),
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
        currentIndex: 3,
        onItemTapped: (index) {
          NavigationService.navigateToScreen(context, index);
        },
      ),
    );
  }
}
