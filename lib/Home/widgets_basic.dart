import 'package:flutter/material.dart';
import 'academy_card.dart';

String imageLoc = 'assets/images/example/ex_academy.jpg';

// 과목 (Basic)
Widget buildBasicItems(String selectedBasicCategory) {
  return Align(
    alignment: Alignment.centerLeft,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          if (selectedBasicCategory == '국어') buildKoreanCategoryItems(),
          if (selectedBasicCategory == '수학') buildMathCategoryItems(),
          if (selectedBasicCategory == '과학탐구') buildScienceCategoryItem(),
          if (selectedBasicCategory == '사회탐구') buildSocietyCategoryItem(),
        ],
      ),
    ),
  );
}

Row buildKoreanCategoryItems() {
  return Row(
    children: [
      buildAcademyCard('국어 1', '학원의 위치', imageLoc, '/login_main'),
      buildAcademyCard('국어 2', '학원의 위치', imageLoc, '/login_main'),
      buildAcademyCard('국어 3', '학원의 위치', imageLoc, '/login_main'),
      buildAcademyCard('국어 4', '학원의 위치', imageLoc, '/login_main'),
    ],
  );
}

Row buildMathCategoryItems() {
  return Row(
    children: [
      buildAcademyCard(
          '수학 1', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
      buildAcademyCard(
          '수학 2', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
    ],
  );
}

Row buildScienceCategoryItem() {
  return Row(
    children: [
      buildAcademyCard(
          '과탐 1', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
      buildAcademyCard(
          '과탐 2', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
    ],
  );
}

Row buildSocietyCategoryItem() {
  return Row(
    children: [
      buildAcademyCard(
          '사탐 1', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
      buildAcademyCard(
          '사탐 2', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
    ],
  );
}

// 과목 카드 빌더
Widget buildAcademyCard(
    String title, String subTitle, String imagePath, String navigateTo) {
  return AcademyCard(
    title: title,
    subTitle: subTitle,
    imagePath: imagePath,
    navigateTo: navigateTo,
  );
}
