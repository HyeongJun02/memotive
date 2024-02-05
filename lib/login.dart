import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton( // leading: 제일 왼쪽 메뉴/내정보 아이콘
          icon: const Icon(Icons.arrow_back),
          tooltip: '뒤로가기',
          onPressed: () {
            Navigator.pop(context);
            print('arrow_back click');
          },
        ),
      ),
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: ElevatedButton(
          child: const Text('돌아가기'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}