import 'package:flutter/material.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'package:memotive/navigation_service.dart';
import 'CategoryItem.dart';

import '../bottom_navigation_bar.dart';
import '../Login/login_main.dart';

var isDarkTheme = false;

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<HomeMain> {
  String? searchText;
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String selectedLanguageCategory = '영어';

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
        ]),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.person_outline),
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/login_main');
        //       print('login click');
        //     },
        //   ),
        // ],
      ),
      // drawer: Drawer(
      //     // 좌측 상단 메뉴
      //     child: ListView(children: [
      //   UserAccountsDrawerHeader(
      //     decoration: BoxDecoration(
      //       color: Color(0xff68C6DF),
      //     ),
      //     currentAccountPicture: CircleAvatar(
      //       backgroundImage: AssetImage('assets/images/memologo_0.jpg'),
      //     ),
      //     accountName: Text('미모티브'),
      //     accountEmail: Text('memotivedev@gmail.com'),
      //     onDetailsPressed: () {},
      //   ),
      //   ListTile(
      //     leading: Icon(Icons.person),
      //     iconColor: Color(0xffF0F1A9),
      //     title: Text('프로필'),
      //     onTap: () {},
      //     trailing: Icon(Icons.navigate_next),
      //   ),
      //   ListTile(
      //     leading: Icon(Icons.settings),
      //     iconColor: Color(0xffF0F1A9),
      //     title: Text('설정'),
      //     onTap: () {},
      //     trailing: Icon(Icons.navigate_next),
      //   ),
      // ])),

      // ============================================================================================== 중단
      body: ListView(children: [
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              // 검색
              SearchBar(
                hintText: "원하는 카테고리 검색",
                elevation: MaterialStatePropertyAll(0), // 떠있는 정도
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
                padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(20, 0, 20, 0),
                ),
                leading: Icon(Icons.search),
                trailing: [
                  Icon(Icons.location_on),
                  Text(' '),
                  Text('위치'),
                ],
                backgroundColor: MaterialStateProperty.all(Colors.white),
                onSubmitted: (value) {
                  setState(() => searchText = value);
                  print('Input Text = $searchText');
                },
              ),

              Container(height: 20),

              //광고
              Container(
                height: 200,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: 4,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // 각 광고를 클릭했을 때 다른 동작을 수행하도록 설정
                            switch (index) {
                              case 0:
                                // 첫 번째 광고를 클릭했을 때의 동작
                                break;
                              case 1:
                                // 두 번째 광고를 클릭했을 때의 동작
                                break;
                              case 2:
                                // 세 번째 광고를 클릭했을 때의 동작
                                break;
                              case 3:
                                // 네 번째 광고를 클릭했을 때의 동작
                                break;
                            }
                          },
                          child: Card(
                            color: Colors.grey[200],
                            child: Center(
                              child: Text(
                                '광고 ${index + 1}',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              Container(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.grey
                          : Colors.grey[300],
                    ),
                  );
                }),
              ),

              Container(height: 20),

              // 기초과목
              Container(
                  child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("기초과목",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text("더보기 >",
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
                Container(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(
                        title: '국어',
                        imagePath: 'assets/images/memologo_0.jpg',
                        navigateTo: '/login_main'),
                    CategoryItem(
                        title: '영어',
                        imagePath: 'assets/images/memologo_0.jpg',
                        navigateTo: '/login_main'),
                    CategoryItem(
                        title: '수학',
                        imagePath: 'assets/images/memologo_0.jpg',
                        navigateTo: '/login_main'),
                    CategoryItem(
                        title: '사회탐구',
                        imagePath: 'assets/images/memologo_0.jpg',
                        navigateTo: '/login_main'),
                    CategoryItem(
                        title: '과학탐구',
                        imagePath: 'assets/images/memologo_0.jpg',
                        navigateTo: '/login_main'),
                  ],
                ),
              ])),

              Container(height: 20),
              Container(
                  child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("어학",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text("더보기 >",
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
                Container(
                  // 언어 선택 버튼
                  child: Row(
                    key: UniqueKey(),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // 선택된 언어 변경
                          setState(() {
                            selectedLanguageCategory = '영어';
                            print(selectedLanguageCategory);
                          });
                        },
                        child: Text('영어'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedLanguageCategory = '일본어';
                            print(selectedLanguageCategory);
                          });
                        },
                        child: Text('일본어'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedLanguageCategory = '중국어';
                            print(selectedLanguageCategory);
                          });
                        },
                        child: Text('중국어'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedLanguageCategory = '독일어';
                            print(selectedLanguageCategory);
                          });
                        },
                        child: Text('독일어'),
                      ),
                    ],
                  ),
                ),
                Container(height: 10),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (selectedLanguageCategory != '영어')
                      CategoryItem(
                        title: '국어',
                        imagePath: 'assets/images/memologo_0.jpg',
                        navigateTo: '/login_main',
                      ),
                    if (selectedLanguageCategory == '일본어')
                      CategoryItem(
                        title: '일본어 카테고리',
                        imagePath: 'assets/images/memologo_0.jpg',
                        navigateTo: '/login_main',
                      ),
                    if (selectedLanguageCategory == '중국어')
                      CategoryItem(
                        title: '중국어 카테고리',
                        imagePath: 'assets/images/memologo_0.jpg',
                        navigateTo: '/login_main',
                      ),
                    if (selectedLanguageCategory == '독일어')
                      CategoryItem(
                        title: '독일어 카테고리',
                        imagePath: 'assets/images/memologo_0.jpg',
                        navigateTo: '/login_main',
                      ),
                    if (selectedLanguageCategory == '영어')
                      CategoryItem(
                        title: '영어 카테고리',
                        imagePath: 'assets/images/memologo_0.jpg',
                        navigateTo: '/login_main',
                      ),
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
