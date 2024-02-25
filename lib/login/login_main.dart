import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

String userName = 'Default';
String userGender = 'male'; // male or female
String userPhoneNumber = '01012345678';
int userBirthYear = 2002;
int userBirthMonth = 4;
int userBirthDay = 3;
int userAge = 23;

String userName_ = 'Default_';

void main() {
  KakaoSdk.init(nativeAppKey: '81c41de1e1e8164248f5ce3556237410');
  runApp(LoginMain());
}

class LoginMain extends StatelessWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          // leading: 제일 왼쪽 메뉴/내정보 아이콘
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
                        // 이름
                        decoration: InputDecoration(labelText: '이름'),
                        keyboardType: TextInputType.name,
                      ),
                      DropdownButtonFormField<String?>(
                        // 성별
                        decoration: InputDecoration(
                          labelText: '성별',
                          // floatingLabelBehavior: FloatingLabelBehavior.always,
                          // labelStyle: TextStyle(fontSize: 15, color: Color(0xffcfcfcf)),
                        ),
                        // underline: Container(height: 1.4, color: Color(0xffc0c0c0)),
                        onChanged: (String? newValue) {
                          print(newValue);
                        },
                        items: [null, 'M', 'F']
                            .map<DropdownMenuItem<String?>>((String? i) {
                          return DropdownMenuItem<String?>(
                            value: i,
                            child: Text({'M': '남성', 'F': '여성'}[i] ?? '비공개'),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: OutlinedButton(
                            child: const Text('로그인'),
                            style: OutlinedButton.styleFrom(),
                            onPressed: () {
                              userName = '안녕';
                              Navigator.pop(context);
                            },
                          )
                          // ElevatedButton(
                          //   child: const Text('로그인'),
                          //   onPressed: () {
                          //     userName = '안녕';
                          //     Navigator.pop(context);
                          //   },
                          // ),
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
                  Row(
                    children: [
                      // 구글 로그인
                      GestureDetector(
                        onTap: () {
                          print('ddd');
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Google_Login.png'),
                                  scale: 1),
                              //color: Colors.red,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 5.0,
                                  spreadRadius: -5.0,
                                  offset: const Offset(0, 0),
                                )
                              ]),
                        ),
                      ),
                      // 카카오 로그인
                      GestureDetector(
                        onTap: () async {
                          print('Kakao Login Button');
                          // 카카오톡 설치 여부 확인
// 카카오톡이 설치되어 있으면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
                          if (await isKakaoTalkInstalled()) {
                            try {
                              await UserApi.instance.loginWithKakaoTalk();
                              print('카카오톡으로 로그인 성공');
                            } catch (error) {
                              print('카카오톡으로 로그인 실패 $error');

                              // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
                              // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
                              if (error is PlatformException &&
                                  error.code == 'CANCELED') {
                                return;
                              }
                              // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                              try {
                                await UserApi.instance.loginWithKakaoAccount();
                                print('카카오계정으로 로그인 성공');
                              } catch (error) {
                                print('카카오계정으로 로그인 실패 $error');
                              }
                            }
                          } else {
                            try {
                              await UserApi.instance.loginWithKakaoAccount();
                              print('카카오계정으로 로그인 성공');
                            } catch (error) {
                              print('카카오계정으로 로그인 실패 $error');
                            }
                          }
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Kakao_Login.png'),
                                  scale: 1),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 5.0,
                                  spreadRadius: -5.0,
                                  offset: const Offset(0, 0),
                                )
                              ]),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      )),
    );
  }
}
