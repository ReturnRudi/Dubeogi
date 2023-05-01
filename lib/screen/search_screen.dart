import 'package:flutter/material.dart';
import 'package:Dubeogi/component/appbar.dart';
import 'package:Dubeogi/screen/home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
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
      ),
    );
  }

  void handleInput(){
    setState(() {
      String firstValue = firstController.text;
      String secondValue = secondController.text;

      Navigator.pop(context, {'start':firstValue,'end':secondValue});
    });

  }
}
