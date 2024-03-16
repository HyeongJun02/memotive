import 'package:flutter/material.dart';
import 'package:memotive/Home/widgets_basic.dart';
import 'package:memotive/Home/widgets_language.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'package:memotive/navigation_service.dart';
// import 'academy_card.dart';

import '../bottom_navigation_bar.dart';
// import '../Login/login_main.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<HomeMain> {
  String? searchText;
  PageController _pageController = PageController();
  int _currentPage = 0;
  String selectedLanguageCategory = "영어";
  String selectedBasicCategory = "국어";
  // int selectedCategory = 0;
  String academyPic =
      'C:/Dev/Flutter/memotive-song/assets/images/example/ex_academy.jpg';

  // 과목 리스트
  // List<String> languageList = ['영어', '일본어', '중국어', '독일어'];
  // List<String> subjectList = ['국어', '수학', '과학탐구', '사회탐구'];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    selectedLanguageCategory = "영어";
    selectedBasicCategory = "국어";
    // selectedCategory = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onItemTapped: (index) {
          NavigationService.navigateToScreen(context, index);
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/memologo_0.jpg',
            width: 40,
            height: 40,
            fit: BoxFit.fitHeight,
          ),
          Text('내 주소를 설정해주세요.'),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add_alert),
          onPressed: () {
            print('add_alert button is clicked');
          },
        ),
      ],
    );
  }

// body 페이지 Widgets 생성
  Widget buildBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              buildSearchBar(), // 검색
              const SizedBox(height: 20),
              buildAdContainer(), // 광고
              const SizedBox(height: 5),
              buildPageIndicator(), // 광고 페이지 인디케이터
              const SizedBox(height: 20),
              buildCategory('어학 (Language)', 'moreNav'), // 카테고리 - 어학
              const SizedBox(height: 0),
              buildLanguageButtons(['영어', '일본어', '중국어', '독일어']), // 과목
              const SizedBox(height: 0),
              buildLanguageItems(selectedLanguageCategory), // 카드
              const SizedBox(height: 0),
              buildCategory('기초과목 (Basic)', 'moreNav'), // 카테고리 - 어학
              const SizedBox(height: 0),
              buildBasicButtons(['국어', '수학', '과학탐구', '사회탐구']), // 과목
              const SizedBox(height: 0),
              buildBasicItems(selectedBasicCategory), // 카드
              const SizedBox(height: 20),
              //buildUserInfo(),
            ],
          ),
        ),
      ],
    );
  }

// 검색창
  Widget buildSearchBar() {
    return SearchBar(
      hintText: "원하는 카테고리 검색",
      elevation: MaterialStateProperty.all(0),
      side: MaterialStateProperty.all(BorderSide(color: Colors.grey, width: 1)),
      padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(15, 0, 15, 0)),
      leading: const Icon(Icons.search),
      trailing: [
        const Icon(Icons.location_on),
        const SizedBox(width: 5),
        const Text('위치'),
      ],
      backgroundColor: MaterialStateProperty.all(Colors.white),
      onSubmitted: (value) {
        setState(() => searchText = value);
        print('Input Text = $searchText');
      },
    );
  }

// 광고창 크기
  Widget buildAdContainer() {
    return Container(
      height: 200,
      child: buildAdPageView(),
    );
  }

// 광고창
  Widget buildAdPageView() {
    return PageView.builder(
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
            // 각 광고 클릭 시 동작
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
    );
  }

// 광고 인디케이터
  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.grey : Colors.grey[300],
          ),
        );
      }),
    );
  }

// 카테고리 타이틀 및 더보기
  Widget buildCategory(String categoryName, String moreNav) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryName,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          "더보기 >",
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }

// Language 버튼
  Widget buildLanguageButtons(List<String> subjects) {
    // 버튼과 여백을 함께 담을 리스트 생성
    List<Widget> buttonsWithSpacing = [];

    // 각 과목에 대한 버튼과 여백을 추가
    for (String subject in subjects) {
      buttonsWithSpacing.add(buildLanguageButton(subject));
      buttonsWithSpacing.add(SizedBox(width: 10)); // 여분 공간을 조절할 SizedBox 추가
    }

    // 리스트를 Row로 감싸서 반환
    return Row(
      children: buttonsWithSpacing,
    );
  }

// Language 버튼 style
  ElevatedButton buildLanguageButton(String language) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedLanguageCategory = language;
          print(selectedLanguageCategory);
        });
      },
      style: buildElevatedButtonStyle(selectedLanguageCategory == language),
      child: Text(
        language,
        style: buildButtonTextStyle(selectedLanguageCategory == language),
      ),
    );
  }

// Basic 버튼
  Widget buildBasicButtons(List<String> subjects) {
    // 버튼과 여백을 함께 담을 리스트 생성
    List<Widget> buttonsWithSpacing = [];

    // 각 과목에 대한 버튼과 여백을 추가
    for (String subject in subjects) {
      buttonsWithSpacing.add(buildBasicButton(subject));
      buttonsWithSpacing.add(SizedBox(width: 10)); // 여분 공간을 조절할 SizedBox 추가
    }

    // 리스트를 Row로 감싸서 반환
    return Row(
      children: buttonsWithSpacing,
    );
  }

// Basic 버튼 style
  ElevatedButton buildBasicButton(String language) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedBasicCategory = language;
          print(selectedBasicCategory);
        });
      },
      style: buildElevatedButtonStyle(selectedBasicCategory == language),
      child: Text(
        language,
        style: buildButtonTextStyle(selectedBasicCategory == language),
      ),
    );
  }

//   Widget buildUserInfo() {
//     return Column(
//       children: [
//         Text.rich(
//           TextSpan(
//             text: userName,
//             style: TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
//             children: [
//               TextSpan(
//                 text: ' 님 안녕하세요.',
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.black),
//               ),
//             ],
//           ),
//         ),
//         Text('성별 : $userGender'),
//         Text('생년월일 : $userBirthYear년 $userBirthMonth월 $userBirthDay일'),
//         Text('나이 : $userAge살'),
//       ],
//     );
//   }
}

// 과목 버튼 스타일
ButtonStyle buildElevatedButtonStyle(bool isSelected) {
  return ElevatedButton.styleFrom(
    elevation: 0,
    side: BorderSide(
      color: Colors.grey,
      width: 1.0,
    ),
    minimumSize: Size(50, 10),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    backgroundColor: isSelected ? Colors.grey : Colors.white,
  );
}

// 과목 버튼 글자 스타일
TextStyle buildButtonTextStyle(bool isSelected) {
  return TextStyle(
    fontSize: 12,
    color: isSelected ? Colors.white : Colors.grey,
  );
}
