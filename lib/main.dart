import 'package:flutter/material.dart';
import 'package:practice/screen/login.dart';

var isDarkTheme = false;

void main() => runApp(
  MaterialApp(
    title: 'Navigator',
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/login': (context) => LoginScreen(),
      '/': (context) => MyApp()
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
          backgroundColor: ( isDarkTheme? Colors.black : Colors.white ),
          leading: IconButton( // leading: 제일 왼쪽 메뉴/내정보 아이콘
            icon: const Icon(Icons.menu),
            tooltip: '메뉴',
            onPressed: () {
              print('menu click');
            },
          ),
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
              tooltip: '검색',
              onPressed: () {
                print('search click');
              },
            ),
            IconButton(
              icon: const Icon(Icons.person_outline),
              tooltip: '내 정보',
              onPressed: () {
                Navigator.pushNamed(context, '/login');
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const TestScreen())
                // );
                print('login click');
              },
            ),
          ],
        ),

        body: SizedBox( // 중단
          child: Column(
            children: [
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
          child: SizedBox(
            //height: 200,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.calendar_month),
                    tooltip: '1',
                    onPressed: () {
                      print('1');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.alarm),
                    tooltip: '2',
                    onPressed: () {
                      print('2');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.home),
                    iconSize: 40,
                    tooltip: '3',
                    onPressed: () {
                      print('3');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    tooltip: '4',
                    onPressed: () {
                      print('4');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    tooltip: '5',
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
