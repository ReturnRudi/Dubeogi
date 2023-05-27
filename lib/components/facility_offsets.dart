import 'package:flutter/material.dart';
import 'package:Dubeogi/save/save.dart';
// 편의시설들 버튼 누르면 뜨는 아이콘의 위치들.

List<Widget> vendingPositionedList({required double scale_offset}) {
  List<Widget> widgets = [
    Positioned(
      left: 971 * scale_offset,
      top: 2479 * scale_offset,
      child: Image.asset(
        vendingPath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 725 * scale_offset,
      top: 2770 * scale_offset,
      child: Image.asset(
        vendingPath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 2360 * scale_offset,
      top: 2940 * scale_offset,
      child: Image.asset(
        vendingPath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 825 * scale_offset,
      top: 2022 * scale_offset,
      child: Image.asset(
        vendingPath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
  ];

  return widgets;
}

List<Widget> showerPositionedList({required double scale_offset}) {
  List<Widget> widgets = [
    Positioned(
      left: 927 * scale_offset,
      top: 2537 * scale_offset,
      child: Image.asset(
        showerPath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 1650 * scale_offset,
      top: 2616 * scale_offset,
      child: Image.asset(
        showerPath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
  ];

  return widgets;
}

List<Widget> storePositionedList({required double scale_offset}) {
  List<Widget> widgets = [
    Positioned(
      left: 865 * scale_offset,
      top: 2279 * scale_offset,
      child: Image.asset(
        storePath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 694 * scale_offset,
      top: 2596 * scale_offset,
      child: Image.asset(
        storePath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 1028 * scale_offset,
      top: 2736 * scale_offset,
      child: Image.asset(
        storePath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 1123 * scale_offset,
      top: 3168 * scale_offset,
      child: Image.asset(
        storePath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 1955 * scale_offset,
      top: 2891 * scale_offset,
      child: Image.asset(
        storePath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 1107 * scale_offset,
      top: 1719 * scale_offset,
      child: Image.asset(
        storePath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
  ];

  return widgets;
}

List<Widget> printerPositionedList({required double scale_offset}) {
  List<Widget> widgets = [
    Positioned(
      left: 854 * scale_offset,
      top: 2696 * scale_offset,
      child: Image.asset(
        printerPath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 936 * scale_offset,
      top: 2416 * scale_offset,
      child: Image.asset(
        printerPath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 838 * scale_offset,
      top: 1988 * scale_offset,
      child: Image.asset(
        printerPath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
  ];

  return widgets;
}

List<Widget> atmPositionedList({required double scale_offset}) {
  List<Widget> widgets = [
    Positioned(
      left: 2500 * scale_offset,
      top: 1725 * scale_offset,
      child: Image.asset(
        atmPath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 1120 * scale_offset,
      top: 3217 * scale_offset,
      child: Image.asset(
        atmPath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 1469 * scale_offset,
      top: 2956 * scale_offset,
      child: Image.asset(
        atmPath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
  ];

  return widgets;
}

List<Widget> loungePositionedList({required double scale_offset}) {
  List<Widget> widgets = [
    Positioned(
      left: 1011 * scale_offset,
      top: 2870 * scale_offset,
      child: Image.asset(
        loungePath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
    Positioned(
      left: 1258 * scale_offset,
      top: 1735 * scale_offset,
      child: Image.asset(
        loungePath,
        scale: 1 / (scale_offset / 16),
      ),
    ),
  ];

  return widgets;
}
