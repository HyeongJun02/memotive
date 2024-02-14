import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:memotive/screen/calendar.dart';
import 'package:memotive/screen/login.dart';
import 'package:memotive/screen/main_view_model.dart';
import 'package:memotive/screen/my_home.dart';

import 'login/kakao_login.dart';

var isDarkTheme = false;

void main() {
  KakaoSdk.init(nativeAppKey: 'b248c8d60ac3e422235ae6a0b0440545');
  runApp(
    MaterialApp(title: 'Navigator', initialRoute: '/', routes: {
      '/': (context) => MainPage(),
      '/my_home': (context) => MyHome(),
      '/login': (context) => Login(),
      '/calendar': (context) => Calendar(),
    }
        //home: MyApp(),
        ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<MainPage> {
  final viewModel = MainViewModel(KakaoLogin());
  //MyApp({Key? key}) : super(key: key); // const 제거
  @override
  Widget build(BuildContext context) {
    // MaterialApp : Material 테마 (+ Custom)
    return MaterialApp(
        home: Scaffold(
      // 상중하로 나눔

      appBar: AppBar(
        // 상단
        elevation: 0.0,
        backgroundColor: (isDarkTheme ? Colors.black : Colors.white),
        // leading: IconButton( // leading: 제일 왼쪽 메뉴/내정보 아이콘
        //   icon: const Icon(Icons.menu),
        //   tooltip: '메뉴',
        //   onPressed: () {
        //     print('menu click');
        //   },
        // ),
        title: Row(children: [
          Image.asset(
            'assets/memologo_0.jpg',
            width: 40,
            height: 40,
            fit: BoxFit.fitHeight,
          ),
          Text(
            style: TextStyle(
              fontSize: 23,
              color: (isDarkTheme ? Colors.white : Colors.black),
            ),
            'memotive',
          )
        ]),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('search click');
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/my_home');
              print('login click');
            },
          ),
        ],
      ),
      drawer: Drawer(
          // 좌측 상단 메뉴
          child: ListView(children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xff68C6DF),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/memologo_0.jpg'),
          ),
          accountName: Text('미모티브'),
          accountEmail: Text('memotivedev@gmail.com'),
          onDetailsPressed: () {},
        ),
        ListTile(
          leading: Icon(Icons.person),
          iconColor: Color(0xffF0F1A9),
          title: Text('프로필'),
          onTap: () {},
          trailing: Icon(Icons.navigate_next),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          iconColor: Color(0xffF0F1A9),
          title: Text('설정'),
          onTap: () {},
          trailing: Icon(Icons.navigate_next),
        ),
      ])),

      body: SizedBox(
          // 중단
          child: Column(children: [
        Image.network(
            viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
        Text('${viewModel.isLogined}'),
        ElevatedButton(
          onPressed: () async {
            await viewModel.login();
            setState(() {});
          },
          child: Text('Login'),
        ),
        ElevatedButton(
          onPressed: () async {
            await viewModel.logout();
            setState(() {});
          },
          child: Text('Logout'),
        ),

        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: userName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' 님 안녕하세요.',
              ),
            ],
          ),
        ),
        Text('성별 : $userGender'),
        Text('생년월일 : $userBirthYear년 $userBirthMonth월 $userBirthDay일'),
        Text('나이 : $userAge살'),
        // ListView(
        //   children: [
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //     Text('아아'),
        //   ]
        // ),
        Row(children: [
          Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.all(20),
              color: Colors.red),
          Container(
              color: Colors.grey,
              child: Column(children: [
                Container(
                    color: Colors.deepPurpleAccent, child: Text('우산 팔아요\n아아')),
                Container(color: Colors.tealAccent, child: Text('안양시 호계동')),
                Container(color: Colors.teal, child: Text('120,000원')),
                Container(
                    color: Colors.yellow,
                    child: Row(children: [
                      Container(child: Icon(Icons.favorite_border)),
                      Container(child: Text('10')),
                    ])),
              ])),
          Spacer(),
          Column(
            children: [
              Icon(Icons.menu),
            ],
          )
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                print('글자 클릭');
              },
              style: ButtonStyle(),
              child: Text('글자')),
          ElevatedButton(
              onPressed: () {
                print('글자 클릭');
              },
              style: ButtonStyle(),
              child: Text('글자')),
        ])
      ])),

      bottomNavigationBar: BottomAppBar(
          // 하단
          color: Colors.black,
          child: SizedBox(
              //height: 200,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                IconButton(
                  icon: const Icon(Icons.calendar_month),
                  color: Color(0xff68C6DF),
                  onPressed: () {
                    print('1');
                    Navigator.pushNamed(context, '/calendar');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.alarm),
                  color: Color(0xff68C6DF),
                  onPressed: () {
                    print('2');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.home),
                  color: Color(0xff68C6DF),
                  iconSize: 40,
                  onPressed: () {
                    print('3');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  color: Color(0xff68C6DF),
                  onPressed: () {
                    print('4');
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  color: Color(0xff68C6DF),
                  onPressed: () {
                    print('5');
                  },
                ),
              ]))),
    ));
  }
}
