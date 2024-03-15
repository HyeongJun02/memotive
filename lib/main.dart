import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:memotive/Search/search_main.dart';
import 'Login/login_main.dart';
import 'Home/home_main.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'Search/Academy/DBlist/DBtest.dart';

void main() async {
  dbConnector(); //SQL 연결
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
      clientId: 'b37g6fxls3',
      onAuthFailed: (ex) {
        print("********* 네이버맵 인증오류 : $ex *********");
      });
  KakaoSdk.init(nativeAppKey: 'b248c8d60ac3e422235ae6a0b0440545');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeMain(),
        '/home_main': (context) => HomeMain(),
        '/search_main': (context) => SearchMain(),
        '/login_main': (context) => LoginMain(),
      },
    );
  }
}
