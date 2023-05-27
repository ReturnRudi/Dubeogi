import 'package:flutter/material.dart';
import 'package:Dubeogi/save/save.dart';
import 'package:Dubeogi/save/building_info.dart';
import 'package:Dubeogi/screen/building_info_screen.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

// 검색창을 누르면 나오는 스크린.
class FindScreen extends StatefulWidget {
  const FindScreen({Key? key}) : super(key: key);

  @override
  State<FindScreen> createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  final Controller = TextEditingController();
  String result = '';
  dynamic getdata;

  // 해당 건물이 존재하는지 확인
  bool isExistBuilding(String name) => buildings.contains(name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('동국대학교'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                // 1. 상단 안내문구/박스
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: 200.0,
                      child: TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                            hintText: '검색하거나 아래 목록을 터치하세요',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Paybooc',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          controller: Controller,
                        ),
                        suggestionsCallback: (pattern) {
                          return buildings.where((building) => building
                              .toLowerCase()
                              .contains(pattern.toLowerCase()));
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion,
                              style: TextStyle(
                              fontFamily: 'Paybooc',
                              fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          print(suggestion);
                          setState(() {
                            Controller.text = suggestion;
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
                    ),
                  ),
                ),
                // end 1

                // 2. 건물 검색 버튼
                Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      result = Controller.text; // 박스 안의 텍스트
                      if (isExistBuilding(result) == true) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => BuildingInfoScreen(
                              title: result,
                            ),
                          ),
                        );
                      }
                      else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Alert"),
                              content: Text("Content"),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.apartment_rounded,
                        ),
                        Text(
                          '건물 검색',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // end 2
              ],
            ),
            SizedBox(height: 16.0),
            // 3. 검색창 아래 뜨는 터치할 수 있는 리스트뷰(건묾명 등)
            Expanded(
              child: ListView.builder(
                itemCount: buildings.length,
                itemBuilder: (context, index) {
                  final name = buildings[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Controller.text = name;
                      });
                    },
                    child: ListTile(
                      title: Text(name,
                        style: TextStyle(
                          fontFamily: 'Paybooc',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // end 3
          ],
        ),
      ),
    );
  }
}
