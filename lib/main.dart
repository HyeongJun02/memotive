import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'Home/home_main.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'b248c8d60ac3e422235ae6a0b0440545');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeMain(),
      },
    );
  }
}
