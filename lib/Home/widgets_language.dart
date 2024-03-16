import 'package:flutter/material.dart';
import 'academy_card.dart';

// 과목 (Language)
Widget buildLanguageItems(String selectedLanguageCategory) {
  return Align(
    alignment: Alignment.centerLeft,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          if (selectedLanguageCategory == '영어') buildEnglishCategoryItems(),
          if (selectedLanguageCategory == '일본어') buildJapaneseCategoryItems(),
          if (selectedLanguageCategory == '중국어') buildChineseCategoryItem(),
          if (selectedLanguageCategory == '독일어') buildGermanCategoryItem(),
        ],
      ),
    ),
  );
}

Row buildEnglishCategoryItems() {
  return Row(
    children: [
      buildAcademyCard(
          'English 1', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
      buildAcademyCard(
          'English 2', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
      buildAcademyCard(
          'English 3', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
      buildAcademyCard(
          'English 4', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
    ],
  );
}

Row buildJapaneseCategoryItems() {
  return Row(
    children: [
      buildAcademyCard('Japanese 1', '학원의 위치', 'assets/images/memologo_0.jpg',
          '/login_main'),
      buildAcademyCard('Japanese 2', '학원의 위치', 'assets/images/memologo_0.jpg',
          '/login_main'),
    ],
  );
}

Row buildChineseCategoryItem() {
  return Row(
    children: [
      buildAcademyCard(
          'Chinese 1', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
      buildAcademyCard(
          'Chinese 2', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
    ],
  );
}

Row buildGermanCategoryItem() {
  return Row(
    children: [
      buildAcademyCard(
          'German 1', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
      buildAcademyCard(
          'German 2', '학원의 위치', 'assets/images/memologo_0.jpg', '/login_main'),
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
