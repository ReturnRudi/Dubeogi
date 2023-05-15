import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.orange, // 앱바 색상 설정
      centerTitle: true, // 제목을 가운데 정렬하기 위해 설정
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center, // 로고와 텍스트를 가운데 정렬하기 위해 설정
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/dgulogo.png',
            height: 32, // 로고 이미지 높이 설정
            width: 32, // 로고 이미지 너비 설정
          ),
          const SizedBox(width: 8), // 로고와 텍스트 사이 간격 조정
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
