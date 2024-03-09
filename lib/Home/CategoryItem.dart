import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String? imagePath; // 이미지 경로
  final String? navigateTo; // 클릭 시 이동할 페이지의 경로

  const CategoryItem({
    required this.title,
    this.imagePath,
    this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navigateTo != null) {
          // 클릭 시 다른 페이지로 이동하는 로직 추가
          Navigator.pushNamed(context, navigateTo!);
        }
      },
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            // 이미지 표시 부분
            if (imagePath != null)
              Positioned.fill(
                child: Image.asset(
                  imagePath!,
                  fit: BoxFit.cover,
                ),
              ),
            // 텍스트 표시 부분
            if (imagePath == null)
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            // 작은 텍스트 표시 부분
            Positioned(
              bottom: 2,
              right: 2,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
