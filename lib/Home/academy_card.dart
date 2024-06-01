import 'package:flutter/material.dart';

class AcademyCard extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? imagePath; // 이미지 경로
  final String? navigateTo; // 클릭 시 이동할 페이지의 경로
  final double? sizeOfImage = 120; // 이미지 크기

  const AcademyCard({
    required this.title,
    this.subTitle,
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
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: sizeOfImage,
                height: sizeOfImage, // 높이 조정
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    // 이미지 표시 부분
                    if (imagePath != null)
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            imagePath!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    // 찜 아이콘 표시 부분
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              // 텍스트 표시 부분
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      if (subTitle != null)
                        Text(
                          subTitle!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(width: 15)
        ],
      ),
    );
  }
}
