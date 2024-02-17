import 'package:flutter/material.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'package:memotive/Login/main_view_model.dart';
import 'package:memotive/navigation_service.dart';

import '../bottom_navigation_bar.dart';
import '../Login/login_main.dart';
import '../Login/kakao_login.dart';

var isDarkTheme = false;

// void main() {
//   KakaoSdk.init(nativeAppKey: 'b248c8d60ac3e422235ae6a0b0440545');
//   runApp(
//     MaterialApp(title: 'Navigator', initialRoute: '/', routes: {
//       '/': (context) => MainPage(),
//       '/login_main': (context) => LoginMain(),
//       '/more_main': (context) => MoreMain(),
//     }
//         //home: MyApp(),
//         ),
//   );
// }

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<HomeMain> {
  final viewModel = MainViewModel(KakaoLogin());
  List<String> citys = ['서울', '인천', '부산', '대구'];

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
        centerTitle: true, // title 중앙 정렬
        // 타이틀 로고
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/memologo_0.jpg',
            width: 40,
            height: 40,
            fit: BoxFit.fitHeight,
          ),
          // Text(
          //   style: TextStyle(
          //     fontSize: 23,
          //     color: (isDarkTheme ? Colors.white : Colors.black),
          //   ),
          //   'memotive',
          // )
        ]),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {
          //     print('search click');
          //   },
          // ),
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
            backgroundImage: AssetImage('assets/images/memologo_0.jpg'),
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
          // GridView.builder(
          //   itemCount: citys.length,
          //   itemBuilder: (context, index) {
          //     return Card(
          //         child: Column(children: [
          //       Text(citys[index]),
          //       //Image.asset('assets/images/Kakao_Login')
          //     ]));
          //   },
          //   scrollDirection: Axis.horizontal,
          //   gridDelegate:
          //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          // ),

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
      // 하단 네비게이션 바 추가
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        onItemTapped: (index) {
          NavigationService.navigateToScreen(context, index);
        },
      ),
      // bottomNavigationBar
    );
  }
}
