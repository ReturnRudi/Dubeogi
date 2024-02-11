import 'package:Dubeogi/save/custom_text.dart';
import 'package:Dubeogi/save/save.dart';
import 'package:flutter/material.dart';
// 건물 터치 시 층 수, 시설 정보 등을 터치할 수 있는 리스트 뷰를 표시하는 floor_view.dart

class FloorView extends StatefulWidget {
  final String showButton;
  final Function onValueChanged;

  const FloorView({
    Key? key,
    required this.showButton,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  _FloorViewState createState() => _FloorViewState();
}

class _FloorViewState extends State<FloorView> {
  String defaultPath = 'assets/images/floor/';
  int selectedIndex = -1; // 선택된 항목의 인덱스, 초기값은 -1로 설정

  // 건물 이름이 '관'으로 끝나는 경우에 '관'을 떼주는 함수 processString
  // ex. "다향관" --> "다향"
/*  String processString(String input) {
    if (input.endsWith('관')) {
      return input.substring(0, input.length - 1);
    } else {
      return input;
    }
  }*/

  // 리스트의 내용인 건물 이미지 파일명 문자열을 층 수 표시로 변환해 주는 함수 replaceToBuildingInfo
  // ex. [ "시설", "기본", "다향관3.png", "다향관2.png", "다향관1.png" ] -> [ "시설", "기본", "3F", "2F", "1F" ]
  String replaceToBuildingInfo(String input) {
    if (input == '시설' || input == '기본') {
      return input;
    } 
    else {
      String floor = input.replaceAll(RegExp(r'[^0-9]'), '');
      if (input.contains('B')) {
        return 'B${int.parse(floor)}';
      } else {
        return '${int.parse(floor)}F';
      }
    }
  }

  // 리스트 뷰에서 선택한 것("시설" or "기본" or "3F" or "B1" or ...)을 파일명으로 변경
  // ex. "다향관"에서 "1F" 선택 -> "assets/images/floor/다향관1.png" 반환
  // "기본"인 경우 "다향관" 반환, "시설"인 경우 "시설" 반환
  String? floorToFilePath(String input, List<String> fileNames) {
    List<String> matchedFloors = [];
    if (input.contains('F') || input.contains('B')) {
      String floor = input.replaceAll(RegExp(r'[^0-9B]'), '');
      for (String str in fileNames) {
        if (str.contains(floor)) {
          matchedFloors.add(str);
        }
      }
      matchedFloors.sort();
      //B1의 경우 "1"과 "B1"이 모두 리스트 matchedFloors에 들어가므로 정렬 후 0번째 인덱스를 이어붙인다
      return defaultPath + matchedFloors[0];
    } else if (input == '기본') {
      return OriginalData[widget.showButton];
    } else {
      //시설 정보 입력할 때
      return input;
    }
  }

  // 리스트 뷰에서 선택한 층 수를 int로 변환해주는 함수 floorToInt
  // "1F" 선택 시 1, "B1" 선택 시 1 (반환 후 연산을 통해 -1로 바꿈), "시설" 과 "기본" 선택 시 0 반환
  int floorToInt(String input) {
    if (input.contains('F') || input.contains('B')) {
      String floor = input.replaceAll(RegExp(r'[^0-9]'), '');
      return int.parse(floor);
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> fileNames =
        allFileNames.where((name) => name.startsWith(widget.showButton)).toList();
    // assets/images/floor/ 에서 showButton으로 파일 이름 검색 후 리스트화
    // ex. showButton = "학술관" 이라면 [ "학술관B1.png", "학술관1.png", "학술관4.png" ] 반환
    // 사전식 순서로 리스트에 들어감 ( 대문자 -> 소문자 -> 숫자 순서)
    fileNames.sort((a, b) {
      String aNumber = a.replaceAll(RegExp(r'[^0-9]'), ''); // 숫자만 추출
      String bNumber = b.replaceAll(RegExp(r'[^0-9]'), ''); // 숫자만 추출

      if (aNumber.isEmpty && bNumber.isEmpty) {
        return a.compareTo(b); // 둘 다 숫자가 없는 경우 문자열 비교
      } else if (aNumber.isEmpty) {
        return -1; // a에만 숫자가 없는 경우 b를 더 큰 것으로 취급
      } else if (bNumber.isEmpty) {
        return 1; // b에만 숫자가 없는 경우 a를 더 큰 것으로 취급
      } else {
        return int.parse(aNumber).compareTo(int.parse(bNumber)); // 숫자 끼리 비교
      }
    });
    // 반환한 리스트에서 정규 표현식을 통해 숫자(층 수)만 뽑아내서 비교하여 순서를 정한다.
    // ex. [ "학술관B1.png", "학술관1.png", "학술관4.png" ]

    fileNames = fileNames.reversed.toList();
    fileNames.insert(0, "기본");
    fileNames.insert(0, "시설");
    fileNames.forEach((fileName) {
      print(fileName);
    });
    //fileNames 리스트의 순서를 반대로 뒤집고 "시설", "기본"을 추가 한다.
    //ex. [ "시설", "기본", "학술관4.png", "학술관1.png", "학술관B1.png" ]

    return Positioned(
      right: 4.5,
      bottom: 100.0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.orangeAccent.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10),
            ),
            height: fileNames.length <= 4 ? 55.0 * fileNames.length + 14.0: 220.0 + 14.0,
            width: 75.0,
          ),
          Column(
            children: [
              CustomText(
                // 리스트 뷰 상단에 현재 터치된 건물명(showButton)을 표시함
                text: widget.showButton,
                fontSize: 9.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              Container(
                height: fileNames.length <= 4 ? 55.0 * fileNames.length : 220.0,
                width: 75.0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  //위의 코드에서 만든 리스트를 기반으로 리스트 뷰를 표시
                  itemCount: fileNames.length,
                  itemBuilder: (context, index) {
                    String fileName = replaceToBuildingInfo(fileNames[index]);
                    // fileName에 사용자가 리스트뷰에서 터치한 층 수의 층수 표기(replaceToBuildinginfo를 통해 변환됨)가 저장됨
                    // ex. "1F" or "시설" or "기본"
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          int radix = 1;
                          selectedIndex = index;
                          if (fileName.contains('B')) radix = -1;
                          // 선택한 층수를 floorToFilePath 함수를 통해 파일명으로 변환하고
                          // 층수를 반환(B1은 -1로, 기본 또는 시설은 0으로 반환)
                          widget.onValueChanged(
                              floorToFilePath(fileName, fileNames),
                              radix * floorToInt(fileName));
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          //터치된 층 수는 파란색으로 표시
                          color: selectedIndex == index
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                        child: ListTile(
                          title: Center(
                            child: CustomText(
                              text: fileName,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
