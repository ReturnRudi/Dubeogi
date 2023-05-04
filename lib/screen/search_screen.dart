import 'package:flutter/material.dart';
import 'package:Dubeogi/component/appbar.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
  int selectOption = 1;

  final List<String> buildings = [
    '다향관',
    '명진관',
    '과학관',
    '대운동장앞',
    '법학관',
    '혜화관',
    '경영관',
    '사회과학관',
    '문화관',
    '학술관',
    '중앙도서관',
    '만해광장',
    '상록원',
    '원흥관',
    '신공학관',
    '정보문화관p',
    '정보문화관q',
    '체육관',
    '학림관',
    '정각원',
    '학생회관'
  ];

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
                      if(selectOption != 1)
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 80,
                          child: Stack(
                            children: [
                              Center(
                                child: Text('최단',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Paybooc',
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(
                                  onTap:(){
                                    setState(() {
                                      selectOption = 1;
                                    });
                                  }
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      if(selectOption == 1)
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 80,
                          child: Stack(
                            children: [
                              Center(
                                child: Text('최단',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Paybooc',
                                    color: Colors.orange,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(
                                  onTap:(){
                                    setState(() {
                                      selectOption = 1;
                                    });
                                  }
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      SizedBox(
                        width: 20,
                      ),
                      if(selectOption != 2)
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 80,
                          child: Stack(
                            children: [
                              Center(
                                child: Text('최적',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Paybooc',
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(
                                  onTap:(){
                                    setState(() {
                                      selectOption = 2;
                                    });
                                  }
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      if(selectOption == 2)
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 80,
                          child: Stack(
                            children: [
                              Center(
                                child: Text('최적',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Paybooc',
                                    color: Colors.orange,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(
                                  onTap:(){
                                    setState(() {
                                      selectOption = 2;
                                    });
                                  }
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      SizedBox(
                        width: 20,
                      ),
                      if(selectOption != 3)
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 80,
                          child: Stack(
                            children: [
                              Center(
                                child: Text('차도',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Paybooc',
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(
                                  onTap:(){
                                    setState(() {
                                      selectOption = 3;
                                    });
                                  }
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      if(selectOption == 3)
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 80,
                          child: Stack(
                            children: [
                              Center(
                                child: Text('차도',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Paybooc',
                                    color: Colors.orange,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(
                                  onTap:(){
                                    setState(() {
                                      selectOption = 3;
                                    });
                                  }
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
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        decoration: BoxDecoration(
                          color: Color(0xFFF8D4A8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                          children: [
                            TypeAheadField(
                              textFieldConfiguration: TextFieldConfiguration(
                                controller: firstController,
                                focusNode: firstFocus,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                  hintText: '출발 지점을 입력하세요',
                                  filled: true,
                                  fillColor: const Color(0xffF9D5A8),
                                ),
                              ),
                              suggestionsCallback: (pattern) {
                                return buildings.where((text) => text
                                    .toLowerCase()
                                    .contains(pattern.toLowerCase()));
                              },
                              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                  color: const Color(0xffF9D5A8)
                              ),
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  title: Text(suggestion),
                                );
                              },
                              onSuggestionSelected: (suggestion) {
                                setState(() {
                                  firstController.text = suggestion;
                                });
                              },
                              noItemsFoundBuilder: (context) {
                                return Container(
                                  height: 45.0,
                                  child: Center(
                                    child: Text(
                                      '건물명을 정확히 입력해주세요.',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                    ),
                    Container(
                      height: 2,
                      color: Colors.orange,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        decoration: BoxDecoration(
                          color: Color(0xFFF8D4A8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                          children: [
                            TypeAheadField(
                              textFieldConfiguration: TextFieldConfiguration(
                                controller: secondController,
                                focusNode: secondFocus,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: '도착 지점을 입력하세요',
                                  filled: true,
                                  fillColor: const Color(0xffF9D5A8),
                                ),
                              ),
                              suggestionsCallback: (pattern) {
                                return buildings.where((text) => text
                                    .toLowerCase()
                                    .contains(pattern.toLowerCase()));
                              },
                              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                  color: const Color(0xffF9D5A8)
                              ),
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  title: Text(suggestion),
                                );
                              },
                              onSuggestionSelected: (suggestion) {
                                setState(() {
                                  secondController.text = suggestion;
                                });
                              },
                              noItemsFoundBuilder: (context) {
                                return Container(
                                  height: 45.0,
                                  child: Center(
                                    child: Text(
                                      '건물명을 정확히 입력해주세요.',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
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