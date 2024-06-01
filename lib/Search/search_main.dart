import 'package:flutter/material.dart';
import 'package:memotive/Search/search_map.dart';
import 'package:memotive/bottom_navigation_bar.dart';
import 'package:memotive/navigation_service.dart';
import 'search_map_select.dart';
import 'package:memotive/Search/Address/depth/adress_depth_screen.dart';

class SearchMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchMain'),
      ),

      body: (Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '검색 메인 페이지 입니당',
              style: TextStyle(fontSize: 30),
            ),

            SizedBox(height: 15), //제목이랑 버튼 사이 간격
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //가로 간격 띄어서 정렬
              children: [
                ElevatedButton(
                  child: Text('지도 보기'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchMap()));
                  },
                ),
                ElevatedButton(
                  child: Text('지역 선택하기'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddressDepthScreen()));
                  },
                ),
              ],
            )
          ],
        )),
      )),

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
