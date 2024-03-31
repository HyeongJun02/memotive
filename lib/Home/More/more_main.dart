import 'package:flutter/material.dart';
import 'package:memotive/bottom_navigation_bar.dart';
import 'package:memotive/navigation_service.dart';

class MoreMain extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '어학'),
    Tab(text: '기초과목'),
    Tab(text: '아앙'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: moreAppBar(),
        body: moreBody(),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onItemTapped: (index) {
            NavigationService.navigateToScreen(context, index);
          },
        ),
      ),
    );
  }

// appBar
  AppBar moreAppBar() {
    return AppBar(
      title: Text("더보기"),
      bottom: TabBar(
        tabs: myTabs,
      ),
    );
  }

// body
  Widget moreBody() {
    return TabBarView(
      children: myTabs.map((Tab tab) {
        final String? label = tab.text;
        return Center(
          child: Text(
            '여기는 $label 탭입니다',
            style: const TextStyle(fontSize: 15),
          ),
        );
      }).toList(),
    );
  }
}
