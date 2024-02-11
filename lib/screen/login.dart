import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton( // leading: 제일 왼쪽 메뉴/내정보 아이콘
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            print('arrow_back click');
          },
        ),
      ),
      // backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(100, 75, 0, 0),
              //color: Colors.red,
              child: Text(
                '내 삶에 원동력을 더하다.',
                style: TextStyle(
                  fontFamily: "Open Sans",
                  //fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(100, 0, 0, 0),
              child: Text(
                'MEMOTIVE',
                style: TextStyle(
                fontFamily: "Open Sans",
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.teal,
                ),
              ),
            ),
            Form(
              child: Theme(
                data: ThemeData(
                    primaryColor: Colors.grey,
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.teal, fontSize: 15.0))),
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  // 키보드가 올라와서 만약 스크린 영역을 차지하는 경우 스크롤이 되도록
                  // SingleChildScrollView으로 감싸 줌
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: '아이디 입력'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextField(
                          decoration:
                          InputDecoration(labelText: '비밀번호 입력'),
                          keyboardType: TextInputType.text,
                          obscureText: true, // 비밀번호 안보이도록 하는 것
                        ),
                        SizedBox(height: 40.0,),
                        ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                            child: ElevatedButton(
                              child: const Text('로그인'),

                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                      ],
                    ),
                  )),
                )),
            Row(
              //spaceEvenly: 요소들을 균등하게 배치하는 속성
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset('../assets/googleLoginLogo.png'),
                    Text('구글'),
                  ],
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}