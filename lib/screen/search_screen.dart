import 'package:flutter/material.dart';
import 'package:Dubeogi/component/appbar.dart';

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
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    if (arguments != null) {
      firstController.text = arguments['start'] ?? '';
      secondController.text = arguments['end'] ?? '';
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: '동국대학교',
      ),
      body: Column(
        children: [
          Container(
              height: 60,
              color: Colors.orange,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 80,
                        child: Stack(
                          children: [
                            Center(
                              child: Text('최소',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 80,
                        child: Stack(
                          children: [
                            Center(
                              child: Text('최적',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 80,
                        child: Stack(
                          children: [
                            Center(
                              child: Text('큰길',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  )
                ],
              )
          ),
          Container(
            //padding: EdgeInsets.all(15),
            padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            color: Colors.orange,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      focusNode: firstFocus,
                      controller: firstController,
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).requestFocus(secondFocus);
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF8D4A8),
                        border: InputBorder.none,
                        hintText: '출발 지점을 입력하세요',
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.orange,
                    ),
                    TextFormField(
                      focusNode: secondFocus,
                      controller: secondController,
                      onFieldSubmitted: (term) {
                        FocusScope.of(context).requestFocus(secondFocus);
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF8D4A8),
                        border: InputBorder.none,
                        hintText: '도착 지점을 입력하세요',
                      ),
                    ),
                  ],
                )
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
