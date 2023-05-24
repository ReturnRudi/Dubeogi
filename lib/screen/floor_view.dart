import 'package:Dubeogi/save/custom_text.dart';
import 'package:Dubeogi/save/save.dart';
import 'package:flutter/material.dart';

class CustomFloorView extends StatefulWidget {
  final String showbutton;
  final Function onValueChanged;

  const CustomFloorView({
    Key? key, required this.showbutton, required this.onValueChanged,
  }) : super(key: key);

  @override
  _CustomFloorViewState createState() => _CustomFloorViewState();
}

class _CustomFloorViewState extends State<CustomFloorView> {
  String defaultpath = 'assets/images/floor/';
  int selectedIndex = -1; // 선택된 항목의 인덱스, 초기값은 -1로 설정

  String processString(String input) {
    if (input.endsWith('관')) {
      return input.substring(0, input.length - 1);
    }
    else {
      return input;
    }
  }

  String replaceToBuildinginfo(String input) {
    if (input == '시설'){
      return '시설';
    }
    else if(input == '기본')
      return input;
    else{
      String floor = input.replaceAll(RegExp(r'[^0-9]'), '');
      print(floor);
      if(input.contains('B'))
      {
        return 'B${int.parse(floor)}';
      }
      else{
        return '${int.parse(floor)}F';
      }
    }
  }

  String? floorTopath(String input, List<String> fileNames) {
    if (input.contains('F') || input.contains('B'))
      {
        String floor = input.replaceAll(RegExp(r'[^0-9B]'), '');
        for (String str in fileNames) {
          if (!str.contains('(') && !str.contains(')') && str.contains(floor))
          {
            return defaultpath + str;
          }
        }
      }
    else if(input == '기본') {
      return OriginalData[widget.showbutton];
    }
    else
    { //시설정보 입력할 때
      return input;
    };
  }

  int floorToint(String input) {
    if (input.contains('F') || input.contains('B'))
    {
      String floor  = input.replaceAll(RegExp(r'[^0-9]'), '');
      return int.parse(floor);
    }
    else{
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    String serachstring = processString(widget.showbutton);
    List<String> fileNames = allFileNames.where((name) => name.startsWith(serachstring)).toList();
    fileNames.sort((a, b) {
      String aNumber = a.replaceAll(RegExp(r'[^0-9]'), ''); // 숫자만 추출
      String bNumber = b.replaceAll(RegExp(r'[^0-9]'), ''); // 숫자만 추출

      if (aNumber.isEmpty && bNumber.isEmpty) {
        return a.compareTo(b); // 둘 다 숫자가 없는 경우 문자열 비교
      } else if (aNumber.isEmpty) {
        return -1; // a는 문자열이므로 b가 더 큰 숫자로 취급
      } else if (bNumber.isEmpty) {
        return 1; // b는 문자열이므로 a가 더 큰 숫자로 취급
      } else {
        return int.parse(aNumber).compareTo(int.parse(bNumber)); // 숫자 비교
      }
    });
    fileNames = fileNames.reversed.toList();
    fileNames.insert(0, "기본");
    fileNames.insert(0, "시설");
    return Positioned(
      left: 20.0,
      bottom: 100.0,
      child: Stack(
        children: [
          Container(
            height: 150.0,
            width: 70.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              itemCount: fileNames.length,
              itemBuilder: (context, index) {
                String fileName = replaceToBuildinginfo(fileNames[index]);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      int radix = 1;
                      selectedIndex = index;
                      if(fileName.contains('B'))
                        radix = -1;
                      widget.onValueChanged(floorTopath(fileName, fileNames), radix * floorToint(fileName));
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                    child: ListTile(
                      title: Center(
                        child: CustomText(text: fileName, color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
