import 'package:flutter/material.dart';
import 'package:Dubeogi/save/save.dart';
import 'package:Dubeogi/save/custom_text.dart';
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
  bool isExistBuilding(String name) => buildings.sublist(0,21).contains(name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text('동국대학교'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  // 1. 상단 안내문구/박스
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: SizedBox(
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
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Paybooc',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            controller: Controller,
                          ),
                          suggestionsCallback: (pattern) {
                            return buildings.sublist(0,21).where((building) => building
                                .toLowerCase()
                                .contains(pattern.toLowerCase()));
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: CustomText(
                                text: suggestion,
                                color: Colors.grey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
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
                            return SizedBox(
                              height: 45.0,
                              child: Center(
                                child: CustomText(
                                  text: '건물명을 정확히 입력해주세요.',
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
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
                  SizedBox(
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
                                title: CustomText(text: "경고", fontSize: 15.0,color: Colors.redAccent,),
                                content: CustomText(text: "존재하지 않는 건물입니다.",fontSize: 15.0,),
                                actions: [
                                  TextButton(
                                    child: CustomText(text: "확인",color: Colors.blueAccent,),
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
                          const Icon(
                            Icons.apartment_rounded,
                          ),
                          CustomText(
                            text: '건물 검색',
                            color: Colors.white,
                            fontSize: 8.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // end 2
                ],
              ),
              const SizedBox(height: 16.0),
              // 3. 검색창 아래 뜨는 터치할 수 있는 리스트뷰(건묾명 등)
              Expanded(
                child: ListView.builder(
                  itemCount: buildings.sublist(0,21).length,
                  itemBuilder: (context, index) {
                    final name = buildings[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          Controller.text = name;
                        });
                      },
                      child: ListTile(
                        title: CustomText(
                          text: name,
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
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
      ),
    );
  }
}
