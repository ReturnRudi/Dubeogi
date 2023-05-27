import 'package:flutter/material.dart';
// 안내 종료 버튼을 누를 때 뜨는 경고창.
// 실수로 눌렀을 경우를 방지하는 역할도 제공

class EndAlert extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onOption1Pressed;
  final VoidCallback? onOption2Pressed;

  const EndAlert({
    Key? key,
    required this.title,
    required this.message,
    this.onOption1Pressed,
    this.onOption2Pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        if (onOption1Pressed != null)
          TextButton(
            onPressed: onOption1Pressed,
            child: Text('네'),
          ),
        if (onOption2Pressed != null)
          TextButton(
            onPressed: onOption2Pressed,
            child: Text('아니요'),
          ),
      ],
    );
  }
}
