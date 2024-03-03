import 'package:Dubeogi/save/custom_text.dart';
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
      title: CustomText(text: title, color: Colors.red, fontSize: 15.0,),
      content: CustomText(text: message, color: Colors.black, fontSize: 13.0,),
      actions: [
        if (onOption1Pressed != null)
          TextButton(
            onPressed: onOption1Pressed,
            child: const Text('아니오',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        if (onOption2Pressed != null)
          TextButton(
            onPressed: onOption2Pressed,
            child: const Text('네',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
      ],
    );
  }
}


