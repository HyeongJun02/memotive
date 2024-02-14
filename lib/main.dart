import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'package:memotive/Login/main_view_model.dart';

import 'package:memotive/Login/login_main.dart';
import 'package:memotive/More/more_main.dart';

import 'Login/kakao_login.dart';

var isDarkTheme = false;

void main() {
  KakaoSdk.init(nativeAppKey: 'b248c8d60ac3e422235ae6a0b0440545');
  runApp(
    MaterialApp(title: 'Navigator', initialRoute: '/', routes: {
      '/': (context) => MainPage(),
      '/login_main': (context) => LoginMain(),
      '/more_main': (context) => MoreMain(),
    }
        //home: MyApp(),
        ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 2;
  List<Widget> _WidgetOptions = <Widget>[
    Text(
      'First Screen',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      'Second Screen',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      'Third Screen',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      'Fourth Screen',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      'Fifth Screen',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final viewModel = MainViewModel(KakaoLogin());
  //MyApp({Key? key}) : super(key: key); // const 제거
  @override
  Widget build(BuildContext context) {
    // MaterialApp : Material 테마 (+ Custom)
    return Scaffold(
        // 상중하로 나눔

        // ============================================================================================== 상단
        appBar: AppBar(
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
                Navigator.pushNamed(context, '/login_main');
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

        // ============================================================================================== 중단
        body: ListView(children: [
          Column(children: [
            // Text(
            //   '내 주변 학원 추천',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),

            // Image.network(
            //     viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
            Text('카카오 로그인 여부: ${viewModel.isLogined}'),
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
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: ' 님 안녕하세요.',
                    style: TextStyle(
                      // fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Text('성별 : $userGender'),
            Text('생년월일 : $userBirthYear년 $userBirthMonth월 $userBirthDay일'),
            Text('나이 : $userAge살'),
            Text('아아'),
            Text('아아'),
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
                        color: Colors.deepPurpleAccent,
                        child: Text('우산 팔아요\n아아')),
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
          ])
        ]),

        // ============================================================================================== 하단
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined),
                label: 'My',
                backgroundColor: Colors.lightGreen),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                label: 'My',
                backgroundColor: Colors.lightGreen),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                backgroundColor: Colors.lightGreen),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'My',
                backgroundColor: Colors.lightGreen),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_outlined),
                label: 'Menu',
                backgroundColor: Colors.lightGreen),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        )
/*
      bottomNavigationBar: BottomAppBar(
          // ============================================================================================== 하단
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
                    print('Home Click');
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  color: Color(0xff68C6DF),
                  onPressed: () {
                    print('My Click');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  color: Color(0xff68C6DF),
                  onPressed: () {
                    print('More Click');
                    Navigator.pushNamed(context, '/more_main');
                  },
                ),
              ]))),
              */
        );
  }
}
