import 'package:flutter/material.dart';
// 검색창 아래에 있는 버튼들

class FacilityButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final bool onoff;

  const FacilityButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.onoff,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          onoff ? Colors.grey.shade300 : Colors.white, // 버튼 색상 조정
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // 모서리 둥글기 조정
          ),
        ),
      ),
    );
  }
}
