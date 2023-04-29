import 'package:flutter/material.dart';
import 'package:Dubeogi/component/appbar.dart';

class Pressinput extends StatefulWidget {
  const Pressinput({Key? key}) : super(key: key);

  @override
  State<Pressinput> createState() => _PressinputState();
}

class _PressinputState extends State<Pressinput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '동국대학교',
      ),
      body: Center(
        child: Text('입력 값을 구현할 곳입니다.'),
      ),
    );
  }
}
