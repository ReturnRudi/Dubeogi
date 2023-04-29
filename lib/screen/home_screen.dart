import 'package:flutter/material.dart';
import 'package:Dubeogi/component/appbar.dart';
import 'package:Dubeogi/component/load_map.dart';
import 'package:Dubeogi/screen/search_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final firstFocus = FocusNode();
  final secondFocus = FocusNode();
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: '동국대학교',
        ),
        body: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: 200.0,
                    child: TextFormField(
                      focusNode: firstFocus,
                      controller: firstController,
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).requestFocus(secondFocus);
                      },
                      decoration: InputDecoration(
                        hintText: '출발 지점을 입력하세요',
                      ),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    child: TextFormField(
                      focusNode: secondFocus,
                      controller: secondController,
                      decoration: InputDecoration(hintText: '도착 지점을 입력하세요'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      handleInput();
                    },
                    child: Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Colors.white,
                      size: 90.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void handleInput() {
    String firstValue = firstController.text;
    String secondValue = secondController.text;

    Navigator.of(context as BuildContext).push(
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen(
          start: firstValue,
          end: secondValue,
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String start;
  final String end;

  const HomeScreen({
    Key? key,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '동국대학교',
      ),
      body: Stack(
        children: [
          ImageDrawing(), // 지도 화면
          Positioned(
            // 버튼
            bottom: 50,
            right: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // 버튼 모서리 둥글기 정도
                ),
              ),
              child: Text('길찾기'),
            ),
          ),
        ],
      ),
    );
  }
}



