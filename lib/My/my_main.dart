import 'package:flutter/material.dart';
import 'package:memotive/Settings/settings_main.dart';
import 'package:memotive/bottom_navigation_bar.dart';
import 'package:memotive/navigation_service.dart';

class MyMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsMain()),
              );
            },
          ),
        ],
      ),
      // body: CustomScrollView(slivers: [
      //   SliverAppBar(
      //       leading: IconButton(
      //         icon: Icon(Icons.expand),
      //         onPressed: () {},
      //       ),
      //       expandedHeight: 200,
      //       floating: true,
      //       pinned: false,
      //       snap: true,
      //       elevation: 50,
      //       backgroundColor: Colors.pink,
      //       flexibleSpace: Container(
      //         decoration: BoxDecoration(
      //             image: DecorationImage(
      //                 image: AssetImage('assets/image/memologo_0.jpg'),
      //                 fit: BoxFit.fill)),
      //       ),
      //       title: Text('AppBar Title'),
      //       actions: <Widget>[
      //         IconButton(
      //           icon: const Icon(Icons.add_alert),
      //           onPressed: () {},
      //         ),
      //         IconButton(
      //           icon: const Icon(Icons.phone),
      //           onPressed: () {},
      //         ),
      //       ]),
      //   SliverFixedExtentList(
      //       delegate:
      //           SliverChildBuilderDelegate((BuildContext context, int index) {
      //         return ListTile(
      //           title: Text('Hello World Item $index'),
      //         );
      //       }),
      //       itemExtent: 50.0)
      // ]
      // body: SingleChildScrollView(child: Column()),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4,
        onItemTapped: (index) {
          NavigationService.navigateToScreen(context, index);
        },
      ),
    );
  }
}
