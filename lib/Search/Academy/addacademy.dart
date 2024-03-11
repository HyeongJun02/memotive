import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memotive/bottom_navigation_bar.dart';
import 'package:memotive/navigation_service.dart';
import 'customacademy.dart';

class Addacademy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomInset =
        MediaQuery.of(context).viewInsets.bottom; //키보드에 내용들 가려지지 않게
    return Scaffold(
      appBar: AppBar(
        title: Text('Add academy'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height + bottomInset,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomAcademy(label: '아이디(넘버)'),
            ),
            SizedBox(height: 15),

            Expanded(
              child: CustomAcademy(label: '학원명'),
            ),
            SizedBox(height: 15),

            Expanded(
              child: CustomAcademy(label: '위치'),
            ),
            SizedBox(height: 15),

            Expanded(
              child: CustomAcademy(label: '전화번호'),
            ),
            SizedBox(height: 15),

            Expanded(
              child: CustomAcademy(label: '가격'),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSavePressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                child: Text('저장'),
              ),
            ),
            SizedBox(height: 80), // 버튼 아래에 충분한 공간을 주기 위해 추가
          ],
        ),
      ),
      // 하단 네비게이션 바 추가
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onItemTapped: (index) {
          NavigationService.navigateToScreen(context, index);
        },
      ),
    );
  }

  void onSavePressed() {}
}
