import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memotive/Search/Academy/addacademy.dart';
import 'package:memotive/bottom_navigation_bar.dart';
import 'package:memotive/navigation_service.dart';

class academylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      '0',
      '50',
      '100',
      '200',
      '300',
      '400',
      '500',
      '600',
      '700',
      '800',
      '900',
    ];
    final List<int> colorCodes = <int>[
      0,
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Academy list'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            padding: EdgeInsets.all(10),
            color: Colors.amber[colorCodes[index]],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('순서대로 ${entries[index]}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('학원 ${entries[index]}'),
                      Text('가격 최저 ${entries[index]} 부터')
                    ],
                  )
                ]),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(), //리스트뷰에 구분선
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Addacademy()));
          },
          child: Icon(
            Icons.add,
          ),
          backgroundColor: Colors.indigo),

      // 하단 네비게이션 바 추가
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onItemTapped: (index) {
          NavigationService.navigateToScreen(context, index);
        },
      ),
    );
  }
}
