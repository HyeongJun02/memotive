import 'package:flutter/material.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'package:memotive/navigation_service.dart';

import '../bottom_navigation_bar.dart';
import '../Login/login_main.dart';

var isDarkTheme = false;

// 과목
class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white, // Title의 텍스트 색상을 원하는 대로 지정하세요.
          ),
        ),
      ),
    );
  }
}

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<HomeMain> {
  String? searchText;

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
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              // 검색
              SearchBar(
                padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(20, 0, 20, 0),
                ),
                trailing: [Icon(Icons.search)],
                backgroundColor: MaterialStateProperty.all(Colors.white),
                onSubmitted: (value) {
                  setState(() => searchText = value);
                  print('Input Text = $searchText');
                },
              ),

              Container(height: 20),

              //광고
              Container(
                height: 100,
                width: 400,
                color: Colors.amber,
              ),

              Container(height: 20),

              // 기초과목
              Container(
                  child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("   기초과목   ",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                    Text("   더보기   ",
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
                Container(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(title: '국어', color: Colors.grey),
                    CategoryItem(title: '영어', color: Colors.grey),
                    CategoryItem(title: '수학', color: Colors.grey),
                    CategoryItem(title: '사회탐구', color: Colors.grey),
                    CategoryItem(title: '과학탐구', color: Colors.grey),
                  ],
                ),
              ])),

              Container(height: 20),

              // 어학
              Container(
                  child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("   어학   ",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                    Text("   더보기   ",
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
                Container(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(title: '한국어', color: Colors.grey),
                    CategoryItem(title: '영어', color: Colors.grey),
                    CategoryItem(title: '일본어', color: Colors.grey),
                    CategoryItem(title: '프랑스어', color: Colors.grey),
                    CategoryItem(title: '러시아어', color: Colors.grey),
                  ],
                ),
              ])),

              Container(height: 20),

              // 예술
              Container(
                  child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("   예술   ",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                    Text("   더보기   ",
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
                Container(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(title: '개발', color: Colors.grey),
                    CategoryItem(title: '디자인', color: Colors.grey),
                    CategoryItem(title: '마케팅', color: Colors.grey),
                    CategoryItem(title: '회계', color: Colors.grey),
                    CategoryItem(title: '기획', color: Colors.grey),
                  ],
                ),
              ])),

              Container(height: 20),

              Text.rich(TextSpan(
                  text: userName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ' 님 안녕하세요.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    )
                  ])),
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
                      Container(
                          color: Colors.tealAccent, child: Text('안양시 호계동')),
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
      ]),

      // ============================================================================================== 하단
      // 하단 네비게이션 바 추가
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onItemTapped: (index) {
          NavigationService.navigateToScreen(context, index);
        },
      ),
      // bottomNavigationBar
    );
  }
}
