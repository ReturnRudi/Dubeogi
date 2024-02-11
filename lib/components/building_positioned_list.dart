import 'package:Dubeogi/save/save.dart';
import 'package:flutter/material.dart';
// 터치 가능한 빌딩 이미지 좌표들....

List<Widget> buildingPositionedList(
    {required double scale_offset, required Function showFloorButton}) {
  List<Widget> widgets = [
    Positioned(
      left: 1804 * scale_offset,
      top: 2694 * scale_offset,
      child: InkWell(
        onTap: () {
          // 건물이 터치되면
          showFloorButton('혜화관');
        },
        child: Image.asset(
          buildingFilePath['혜화관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 1337 * scale_offset,
      top: 2379 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('다향관');
        },
        child: Image.asset(
          buildingFilePath['다향관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 1308 * scale_offset,
      top: 3206 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('대운동장');
        },
        child: Image.asset(
          buildingFilePath['대운동장']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 972 * scale_offset,
      top: 1880 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('만해광장');
        },
        child: Image.asset(
          buildingFilePath['만해광장']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 1129 * scale_offset,
      top: 2805 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('명진관');
        },
        child: Image.asset(
          buildingFilePath['명진관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 1102 * scale_offset,
      top: 2973 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('과학관');
        },
        child: Image.asset(
          buildingFilePath['과학관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 1528 * scale_offset,
      top: 2563 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('법학관_만해관');
        },
        child: Image.asset(
          buildingFilePath['법학관_만해관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 1017 * scale_offset,
      top: 2394 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('본관');
        },
        child: Image.asset(
          buildingFilePath['본관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 2145 * scale_offset,
      top: 2775 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('사회과학관_경영관');
        },
        child: Image.asset(
          buildingFilePath['사회과학관_경영관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 2297 * scale_offset,
      top: 2582 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('문화관');
        },
        child: Image.asset(
          buildingFilePath['문화관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 1067 * scale_offset,
      top: 3118 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('상록원');
        },
        child: Image.asset(
          buildingFilePath['상록원']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 482 * scale_offset,
      top: 2525 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('신공학관');
        },
        child: Image.asset(
          buildingFilePath['신공학관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 694 * scale_offset,
      top: 2084 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('원흥관');
        },
        child: Image.asset(
          buildingFilePath['원흥관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 634 * scale_offset,
      top: 1866 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('정보문화관q');
        },
        child: Image.asset(
          buildingFilePath['정보문화관q']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 769 * scale_offset,
      top: 1920 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('정보문화관p');
        },
        child: Image.asset(
          buildingFilePath['정보문화관p']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 1673 * scale_offset,
      top: 2941 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('정각원');
        },
        child: Image.asset(
          buildingFilePath['정각원']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 897 * scale_offset,
      top: 2663 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('중앙도서관');
        },
        child: Image.asset(
          buildingFilePath['중앙도서관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 1321 * scale_offset,
      top: 1843 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('체육관');
        },
        child: Image.asset(
          buildingFilePath['체육관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 1078 * scale_offset,
      top: 1636 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('학림관');
        },
        child: Image.asset(
          buildingFilePath['학림관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 670 * scale_offset,
      top: 1773 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('학생회관');
        },
        child: Image.asset(
          buildingFilePath['학생회관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
    Positioned(
      left: 2527 * scale_offset,
      top: 2567 * scale_offset,
      child: InkWell(
        onTap: () {
          showFloorButton('학술관');
        },
        child: Image.asset(
          buildingFilePath['학술관']!,
          scale: 1 / scale_offset,
        ),
      ),
    ),
  ];

  return widgets;
}