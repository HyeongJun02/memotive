import 'package:flutter/material.dart';
import 'package:memotive/bottom_navigation_bar.dart';
import 'package:memotive/navigation_service.dart';
import 'package:mysql_client/mysql_client.dart';

Future<void> dbConnector() async {
  print("Connecting to mysql server...");

//   // MySQL 접속 설정
  final conn = await MySQLConnection.createConnection(
    host: "http://25.32.235.196",
    port: 3306,
    userName: 'root',
    password: '134340!!',
    databaseName: 'Memotive', // optional
  );

// 연결 대기
  await conn.connect();

  print("Connected");

// 종료 대기
  await conn.close();
}

class DBtest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchMain'),
      ),

      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'name',
            ),
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
}
