import 'package:flutter/material.dart';
import 'package:practice/screen/calendar.dart';
import 'package:practice/screen/login.dart';
import 'package:practice/screen/my_home.dart';

var isDarkTheme = false;

void main() => runApp(
  MaterialApp(
    title: 'Navigator',
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/my_home': (context) => MyHome(),
      '/login': (context) => Login(),
      '/calendar': (context) => Calendar(),
    }
    //home: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // MaterialApp : Material 테마 (+ Custom)
    return MaterialApp(
      home: Scaffold( // 상중하로 나눔

        appBar: AppBar( // 상단
          elevation: 0.0,
          backgroundColor: ( isDarkTheme? Colors.black : Colors.white ),
          // leading: IconButton( // leading: 제일 왼쪽 메뉴/내정보 아이콘
          //   icon: const Icon(Icons.menu),
          //   tooltip: '메뉴',
          //   onPressed: () {
          //     print('menu click');
          //   },
          // ),
          title: Row(
            children: [
              Image.asset(
                '../assets/memologo_0.jpg',
                width: 40,
                height: 40,
                fit: BoxFit.fitHeight,
              ),
              Text(
                style: TextStyle(
                  fontSize: 23,
                  color: ( isDarkTheme? Colors.white : Colors.black ),
                ),
                'memotive',
              )
            ]
          ),
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
        drawer: Drawer( // 좌측 상단 메뉴
          child: ListView(
            children: [
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
            ]
          )
        ),







        body: SizedBox( // 중단
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$userName',
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
              Row(
                children: [
                  Container( width: 150, height: 150, margin: EdgeInsets.all(20), color: Colors.red ),
                  Container(
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.deepPurpleAccent,
                          child: Text('우산 팔아요\n아아')
                        ),
                        Container(
                          color: Colors.tealAccent,
                          child: Text('안양시 호계동')
                        ),
                        Container(
                          color: Colors.teal,
                          child: Text('120,000원')
                        ),
                        Container(
                          color: Colors.yellow,
                          child: Row(
                            children: [
                              Container(
                                child: Icon(Icons.favorite_border)
                              ),
                              Container(
                                child: Text('10')
                              ),
                            ]
                          )
                        ),
                      ]
                    )
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Icon(Icons.menu),
                    ],
                  )
                ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  ElevatedButton(
                    child: Text('글자'),
                    onPressed: (){
                      print('글자 클릭');
                    },
                    style: ButtonStyle(

                    )
                  ),
                  ElevatedButton(
                      child: Text('글자'),
                      onPressed: (){
                        print('글자 클릭');
                      },
                      style: ButtonStyle(

                      )
                  ),
                ]
              )
            ]
          )
        ),







        bottomNavigationBar: BottomAppBar( // 하단
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
              ]
            )
          )
        ),
      )
    );
  }
}
