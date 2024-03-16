import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 8,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 800),
  );

  @override
  void initState() {
    tabController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TabBarScreen"),
      ),
      body: Column(
        children: [
          _tabBar(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              tabController.index = 2;
            },
            child: const Text("이동"),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              tabController.animateTo(5);
            },
            child: const Text("이동 animateTo"),
          ),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      color: Colors.grey,
      child: TabBar(
        controller: tabController,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.white,
        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
        ),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        isScrollable: true,
        onTap: (index) {},
        tabs: const [
          Tab(text: "Tab 1"),
          Tab(text: "Tab 2"),
          Tab(text: "Tab 3"),
          Tab(text: "Tab 4"),
          Tab(text: "Tab 5"),
          Tab(text: "Tab 6"),
          Tab(text: "Tab 7"),
          Tab(text: "Tab 8"),
        ],
      ),
    );
  }
}
