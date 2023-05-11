import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Dubeogi/component/appbar.dart';
import 'package:Dubeogi/algorithm/astar.dart';
import 'package:Dubeogi/save/save.dart';
import 'package:Dubeogi/component/draw_line.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ImageInfo _imageInfo_du;
  bool _imageLoaded_du = false;
  late double _imageWidth_du;
  late double _imageHeight_du;
  late double scale_offset;
  late String selectedHall;

  int nowFloor = 0;
  String _showButton = "기본";

  double _scale = 1.3;
  double _previousScale = 1.0;
  Offset _position = Offset.zero;
  Offset _previousPosition = Offset.zero;

  List<Offset> startPoints = [];
  List<Offset> endPoints = [];

  String _startNodeName = "";
  String _endNodeName = "";
  dynamic result;

  //late String nowBuilding;
  bool _vendingvisibility = false;
  bool _showervisibility = false;
  bool _storevisibility = false;
  bool _atmvisibility = false;
  bool _loungevisibility = false;
  bool _printervisibility = false;

  void _vendingshow() {
    setState(() {
      _vendingvisibility = !_vendingvisibility;
    });
  }

  void _showershow() {
    setState(() {
      _showervisibility = !_showervisibility;
    });
  }

  void _storeshow() {
    setState(() {
      _storevisibility = !_storevisibility;
    });
  }

  void _atmshow() {
    setState(() {
      _atmvisibility = !_atmvisibility;
    });
  }

  void _loungeshow() {
    setState(() {
      _loungevisibility = !_loungevisibility;
    });
  }

  void _printershow() {
    setState(() {
      _printervisibility = !_printervisibility;
    });
  }

  void _showFloorButton(String touchedBuilding) {
    //print('_showButton: $_showButton');
    setState(() {
      if (touchedBuilding == "과학관") {
        if (_showButton == "과학관")
          _showButton = "기본";
        else
          _showButton = "과학관";
      } else if (touchedBuilding == "다향관") {
        if (_showButton == "다향관")
          _showButton = "기본";
        else
          _showButton = "다향관";
      } else if (touchedBuilding == "대운동장앞") {
        if (_showButton == "대운동장앞")
          _showButton = "기본";
        else
          _showButton = "대운동장앞";
      } else if (touchedBuilding == "만해광장") {
        if (_showButton == "만해광장")
          _showButton = "기본";
        else
          _showButton = "만해광장";
      } else if (touchedBuilding == "명진관") {
        if (_showButton == "명진관")
          _showButton = "기본";
        else
          _showButton = "명진관";
      } else if (touchedBuilding == "문화관") {
        if (_showButton == "문화관")
          _showButton = "기본";
        else
          _showButton = "문화관";
      } else if (touchedBuilding == "법학관_만해관") {
        if (_showButton == "법학관_만해관")
          _showButton = "기본";
        else
          _showButton = "법학관_만해관";
      } else if (touchedBuilding == "본관") {
        if (_showButton == "본관")
          _showButton = "기본";
        else
          _showButton = "본관";
      } else if (touchedBuilding == "사회과학관_경영관") {
        if (_showButton == "사회과학관_경영관")
          _showButton = "기본";
        else
          _showButton = "사회과학관_경영관";
      } else if (touchedBuilding == "상록원") {
        if (_showButton == "상록원")
          _showButton = "기본";
        else
          _showButton = "상록원";
      } else if (touchedBuilding == "신공학관") {
        if (_showButton == "신공학관")
          _showButton = "기본";
        else
          _showButton = "신공학관";
      } else if (touchedBuilding == "원흥관") {
        if (_showButton == "원흥관")
          _showButton = "기본";
        else
          _showButton = "원흥관";
      } else if (touchedBuilding == "정p") {
        if (_showButton == "정p")
          _showButton = "기본";
        else
          _showButton = "정p";
      } else if (touchedBuilding == "정q") {
        if (_showButton == "정q")
          _showButton = "기본";
        else
          _showButton = "정q";
      } else if (touchedBuilding == "정각원") {
        if (_showButton == "정각원")
          _showButton = "기본";
        else
          _showButton = "정각원";
      } else if (touchedBuilding == "중앙도서관") {
        if (_showButton == "중앙도서관")
          _showButton = "기본";
        else
          _showButton = "중앙도서관";
      } else if (touchedBuilding == "체육관") {
        if (_showButton == "체육관")
          _showButton = "기본";
        else
          _showButton = "체육관";
      } else if (touchedBuilding == "학림관") {
        if (_showButton == "학림관")
          _showButton = "기본";
        else
          _showButton = "학림관";
      } else if (touchedBuilding == "학생회관") {
        if (_showButton == "학생회관")
          _showButton = "기본";
        else
          _showButton = "학생회관";
      } else if (touchedBuilding == "학술관") {
        if (_showButton == "학술관")
          _showButton = "기본";
        else
          _showButton = "학술관";
      } else if (touchedBuilding == "혜화관") {
        if (_showButton == "혜화관")
          _showButton = "기본";
        else
          _showButton = "혜화관";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getImageInfo();

/*    graph.addEdge("Node1 이름", "Node2 이름", 거리, "평지" or "계단" or "오르막", "도보" or "차도",
        node1X: Node1 x 픽셀값,
        node1Y: Node1 y 픽셀값,
        isInside1: 야외면 0, 실내면 층 수,
        building1: "실외" or "건물 이름",
        showRoute1: 안내해야하는 엣지면 true, 아니라면 false,
        node2X: Node2 x 픽셀값,
        node2Y: Node2 y 픽셀값,
        isInside2: 야외면 0, 실내면 층 수,
        building2: "실외" or "건물 이름",
        showRoute2: 안내해야하는 엣지면 true, 아니라면 false);*/
    //1
    graph.addEdge("신공 9층 입구", "신공 중도 갈림길", 85, "평지", "도보",
        node1X: 899,
        node1Y: 2638,
        isInside1: 0,
        building1: "실외",
        showRoute1: true,
        node2X: 980,
        node2Y: 2664,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("신공 중도 갈림길", "신공 9층 입구", 85, "평지", "도보");
    //2
    graph.addEdge("신공 중도 갈림길", "중도 후문", 9, "평지", "도보",
        node2X: 979,
        node2Y: 2673,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("중도 후문", "신공 중도 갈림길", 9, "평지", "도보");
    //3
    graph.addEdge("신공 중도 갈림길", "신공 중도 갈림길2", 107, "평지", "도보",
        node2X: 1083,
        node2Y: 2694,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("신공 중도 갈림길2", "신공 중도 갈림길", 107, "평지", "도보");
    //4
    graph.addEdge("신공 중도 갈림길2", "중도 옆 계단 아래", 21, "평지", "도보",
        node2X: 1103,
        node2Y: 2701,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("중도 옆 계단 아래", "신공 중도 갈림길2", 21, "평지", "도보");
    //5
    graph.addEdge("중도 옆 계단 아래", "중도 옆 계단 위", 56, "계단", "도보",
        node2X: 1139,
        node2Y: 2712,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("중도 옆 계단 위", "중도 옆 계단 아래", 30, "계단", "도보");
    //6
    graph.addEdge("중도 옆 계단 위", "중도 정문 앞", 44, "평지", "도보",
        node2X: 1126,
        node2Y: 2754,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("중도 정문 앞", "중도 옆 계단 위", 44, "평지", "도보");
    //7
    graph.addEdge("중도 정문 앞", "중도 정문", 10, "평지", "도보",
        node2X: 1116,
        node2Y: 2752,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("중도 정문", "중도 정문 앞", 10, "평지", "도보");
    //8
    graph.addEdge("신공 중도 갈림길2", "중도 옆옆 계단 앞", 17, "평지", "도보",
        node2X: 1088,
        node2Y: 2678,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("중도 옆옆 계단 앞", "신공 중도 갈림길2", 17, "평지", "도보");
    //9
    graph.addEdge("중도 옆옆 계단 앞", "중도 옆옆 계단 위", 14, "평지", "도보",
        node2X: 1075,
        node2Y: 2673,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("중도 옆옆 계단 위", "중도 옆옆 계단 앞", 14, "평지", "도보");
    //10
    graph.addEdge("중도 옆옆 계단 위", "중도 옆옆 계단 아래", 23, "계단", "도보",
        node2X: 1047,
        node2Y: 2665,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("중도 옆옆 계단 아래", "중도 옆옆 계단 위", 44, "계단", "도보");
    //11
    graph.addEdge("중도 옆옆 계단 아래", "지하주차장 앞", 67, "평지", "도보",
        node2X: 1002,
        node2Y: 2615,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("지하주차장 앞", "중도 옆옆 계단 아래", 67, "평지", "도보");
    //12
    graph.addEdge("중도 옆옆 계단 앞", "본관 쪽문", 77, "평지", "도보",
        node2X: 1161,
        node2Y: 2698,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("본관 쪽문", "중도 옆옆 계단 앞", 77, "평지", "도보");
    //13
    graph.addEdge("중도 옆 계단 위", "팔정도 좌측 하단", 82, "평지", "도보",
        node2X: 1212,
        node2Y: 2749,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("팔정도 좌측 하단", "중도 옆 계단 위", 82, "평지", "도보");
    //14
    graph.addEdge("중도 옆 계단 위", "팔정도 좌측 하단3", 44, "평지", "도보",
        node2X: 1169,
        node2Y: 2744,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("팔정도 좌측 하단3", "중도 옆 계단 위", 44, "평지", "도보");
    //15
    graph.addEdge("팔정도 좌측 하단3", "팔정도 좌측 하단2", 19, "평지", "차도",
        node2X: 1188,
        node2Y: 2742,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("팔정도 좌측 하단2", "팔정도 좌측 하단3", 19, "평지", "차도");
    //16
    graph.addEdge("팔정도 좌측 하단", "팔정도 좌측 하단2", 25, "평지", "차도");
    graph.addEdge("팔정도 좌측 하단2", "팔정도 좌측 하단", 25, "평지", "차도");
    //17
    graph.addEdge("팔정도 좌측 하단3", "상록원 가는 길 명진관 계단 앞", 190, "평지", "차도",
        node2X: 1116,
        node2Y: 2926,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 가는 길 명진관 계단 앞", "팔정도 좌측 하단3", 190, "평지", "차도");
    //18
    graph.addEdge("상록원 가는 길 명진관 계단 앞", "상록원 가는 길 명진관 계단 아래", 52, "평지", "도보",
        node2X: 1165,
        node2Y: 2943,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 가는 길 명진관 계단 아래", "상록원 가는 길 명진관 계단 앞", 52, "평지", "도보");
    //19
    graph.addEdge("상록원 가는 길 명진관 계단 아래", "상록원 가는 길 명진관 계단 중간", 21, "계단", "도보",
        node2X: 1165,
        node2Y: 2957,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 가는 길 명진관 계단 중간", "상록원 가는 길 명진관 계단 아래", 11, "계단", "도보");
    //20
    graph.addEdge("상록원 가는 길 명진관 계단 중간", "상록원 가는 길 명진관 계단 위", 20, "계단", "도보",
        node2X: 1173,
        node2Y: 2946,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 가는 길 명진관 계단 위", "상록원 가는 길 명진관 계단 중간", 11, "계단", "도보");
    //21
    graph.addEdge("상록원 가는 길 명진관 계단 앞", "상록원 가는 길", 57, "평지", "차도",
        node2X: 1101,
        node2Y: 2981,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 가는 길", "상록원 가는 길 명진관 계단 앞", 57, "평지", "차도");
    //22
    graph.addEdge("상록원 가는 길", "상록원 가는 길2", 162, "오르막", "차도",
        node2X: 1102,
        node2Y: 3089,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 가는 길2", "상록원 가는 길", 86, "오르막", "차도");
    //23
    graph.addEdge("상록원 가는 길2", "상록원 가는 길3", 42, "평지", "차도",
        node2X: 1090,
        node2Y: 3129,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 가는 길3", "상록원 가는 길2", 42, "평지", "차도");
    //24
    graph.addEdge("상록원 가는 길3", "상록원 가는 길4", 36, "평지", "차도",
        node2X: 1079,
        node2Y: 3163,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 가는 길4", "상록원 가는 길3", 36, "평지", "차도");
    //25
    graph.addEdge("상록원 가는 길4", "상록원 옆입구", 32, "평지", "도보",
        node2X: 1110,
        node2Y: 3172,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 옆입구", "상록원 가는 길4", 32, "평지", "도보");
    //26
    graph.addEdge("상록원 가는 길3", "상록원 과학관 갈림길", 29, "평지", "도보",
        node2X: 1117 ,
        node2Y: 3139,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 과학관 갈림길", "상록원 가는 길3", 29, "평지", "도보");
    //27
    graph.addEdge("상록원 과학관 갈림길", "상록원 앞", 17, "평지", "도보",
        node2X: 1133 ,
        node2Y: 3144,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 앞", "상록원 과학관 갈림길", 17, "평지", "도보");
    //28
    graph.addEdge("상록원 앞", "상록원 정문", 9, "평지", "도보",
        node2X: 1127 ,
        node2Y: 3151,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 정문", "상록원 앞", 9, "평지", "도보");
    //29
    graph.addEdge("상록원 앞", "상록원 옆 갈림길", 66, "평지", "도보",
        node2X: 1198,
        node2Y: 3135,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 옆 갈림길", "상록원 앞", 66, "평지", "도보");
    //30
    graph.addEdge("상록원 옆 갈림길", "상록원 후문 앞", 77, "평지", "도보",
        node2X: 1263,
        node2Y: 3176,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 후문 앞", "상록원 옆 갈림길", 77, "평지", "도보");
    //31
    graph.addEdge("상록원 후문 앞", "대운동장 상록원 계단 위", 41, "평지", "도보",
        node2X: 1287,
        node2Y: 3143,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("대운동장 상록원 계단 위", "상록원 후문 앞", 41, "평지", "도보");
    //32
    graph.addEdge("상록원 후문 앞", "상록원 후문", 19, "평지", "도보",
        node2X: 1252,
        node2Y: 3192,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 후문", "상록원 후문 앞", 19, "평지", "도보");
    //33
    graph.addEdge("상록원 옆 갈림길", "상록원 옆 길", 41, "평지", "도보",
        node2X: 1238,
        node2Y: 3124,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("상록원 옆 길", "상록원 옆 갈림길", 41, "평지", "도보");
    //34
    graph.addEdge("대운동장 상록원 계단 위", "상록원 옆 길", 53, "평지", "도보");
    graph.addEdge("상록원 옆 길", "대운동장 상록원 계단 위", 53, "평지", "도보");
    //35
    graph.addEdge("대운동장 상록원 계단 위", "대운동장 상록원 계단 갈림길", 116, "계단", "도보",
        node2X: 1423,
        node2Y: 3193,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("대운동장 상록원 계단 갈림길", "대운동장 상록원 계단 위", 217, "계단", "도보");
    //36
    graph.addEdge("대운동장 상록원 계단 갈림길", "대운동장 상록원 계단 아래", 44, "계단", "도보",
        node2X: 1475,
        node2Y: 3212,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("대운동장 상록원 계단 아래", "대운동장 상록원 계단 갈림길", 83, "계단", "도보");
    //37
    graph.addEdge("대운동장 상록원 계단 갈림길", "과학관 우측 입구 앞", 108, "계단", "도보",
        node2X: 1444,
        node2Y: 3124,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("과학관 우측 입구 앞", "대운동장 상록원 계단 갈림길", 58, "계단", "도보");
    //38
    graph.addEdge("과학관 우측 입구 앞", "과학관 우측 입구", 24, "평지", "도보",
        node2X: 1421,
        node2Y: 3117,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("과학관 우측 입구", "과학관 우측 입구 앞", 24, "평지", "도보");
    //39
    graph.addEdge("과학관 우측 입구 앞", "명진관 과학관 우측 하단", 47, "평지", "도보",
        node2X: 1458,
        node2Y: 3079,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("명진관 과학관 우측 하단", "과학관 우측 입구 앞", 47, "평지", "도보");
    //40
    graph.addEdge("상록원 과학관 갈림길", "과학관 좌측 입구 앞", 97, "평지", "도보",
        node2X: 1147,
        node2Y: 3047,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("과학관 좌측 입구 앞", "상록원 과학관 갈림길", 97, "평지", "도보");
    //41
    graph.addEdge("과학관 좌측 입구 앞", "과학관 좌측 입구", 9, "평지", "도보",
        node2X: 1155,
        node2Y: 3050,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("과학관 좌측 입구", "과학관 좌측 입구 앞", 9, "평지", "도보");
    //42
    graph.addEdge("과학관 좌측 입구 앞", "명진관 과학관 좌측 하단", 62, "평지", "도보",
        node2X: 1167,
        node2Y: 2988,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("명진관 과학관 좌측 하단", "과학관 좌측 입구 앞", 62, "평지", "도보");
    //43
    graph.addEdge("명진관 과학관 좌측 하단", "상록원 가는 길 명진관 계단 위", 42, "평지", "도보");
    graph.addEdge("상록원 가는 길 명진관 계단 위", "명진관 과학관 좌측 하단", 42, "평지", "도보");
/*    //44
    graph.addEdge("과학관 좌측 입구 앞", "명진관 과학관 좌측 하단", 62, "평지", "도보",
        node2X: 1167,
        node2Y: 2988,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    graph.addEdge("명진관 과학관 좌측 하단", "과학관 좌측 입구 앞", 62, "평지", "도보");*/








  }

  Future<void> _getImageInfo() async {
    final Completer<ImageInfo> completer = Completer();
    final ImageStream stream =
        AssetImage('assets/images/du.png').resolve(ImageConfiguration());
    final listener = ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info);
    });
    stream.addListener(listener);
    _imageInfo_du = await completer.future;
    setState(() {
      _imageLoaded_du = true;
      _imageWidth_du = _imageInfo_du.image.width.toDouble();
      _imageHeight_du = _imageInfo_du.image.height.toDouble();
      scale_offset = MediaQuery.of(context).size.width / _imageWidth_du;
    });
    stream.removeListener(listener);
  }

  void _onScaleStart(ScaleStartDetails details) {
    setState(() {
      _previousScale = _scale;
      _previousPosition = details.focalPoint;
    });
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = (_previousScale * details.scale).clamp(1.3, double.infinity);

      _position += (details.focalPoint - _previousPosition) /
          _previousScale /
          scale_offset;
      //_previousScale로 나누어 줘서 scale이 변해도 _position의 이동 속도를 기존과 같게 유지한다.

      _previousPosition = details.focalPoint;
    });
  }

  void _onScaleEnd(ScaleEndDetails details) {
    setState(() {
      // 화면 크기를 얻습니다.
      print('position: $_position');
      final ratio = MediaQuery.of(context).size.height /
          MediaQuery.of(context).size.width;
      final screenWidth = _imageWidth_du / _scale; //화면에서 보여지는 너비의 물리적 픽셀값
      final screenHeight = screenWidth * ratio; //화면에서 보여지는 높이의 물리적 픽셀값

      double minY, maxY;

      // 이미지의 최소 및 최대 제한 값을 계산합니다.
      double minX = -_imageWidth_du / 2 + screenWidth / 2;
      double maxX = _imageWidth_du / 2 - screenWidth / 2;

      // 위 아래 여백이 생기는 경우 minY, maxY의 크기가 역전되지 않도록 if문 추가
      if (_imageHeight_du > screenHeight) {
        minY = -_imageHeight_du / 2 + screenHeight / 2;
        maxY = _imageHeight_du / 2 - screenHeight / 2;
      } else {
        minY = _imageHeight_du / 2 - screenHeight / 2;
        maxY = -_imageHeight_du / 2 + screenHeight / 2;
      }

      // 값을 출력합니다.
/*      print('imageHeight: $_imageHeight_du, imageWidth: $_imageWidth_du');
      print('screenWidth: $screenWidth, screenHeight: $screenHeight');
      print('minX: $minX, maxX: $maxX, minY: $minY, maxY: $maxY');
      print('_showButton: $_showButton');*/

      // _position 값을 제한 값으로 설정합니다.
      _position = Offset(
        _position.dx.clamp(minX, maxX),
        _position.dy.clamp(minY, maxY),
      );
    });
  }

  void erase() {
    startPoints.clear();
    endPoints.clear();
  }

  void floorButtonPath(int nowFloor, String nowBuilding) {
    //층 단면도를 보여주는 버튼을 눌렀을 때 해당하는 경로를 보여주는 함수
    erase();

    for (int i = 0; i < startNodes.length; i++) {
      if (startNodes[i].isInside == 0 && endNodes[i].isInside == 0) {
        //엣지의 출발지, 도착지가 모두 밖이면 그냥 경로 리스트에 추가
        startPoints.add(Offset(startNodes[i].x, startNodes[i].y));
        endPoints.add(Offset(endNodes[i].x, endNodes[i].y));
      } else {
        if (nowFloor != 0) {
          if ((startNodes[i].isInside == nowFloor ||
                  endNodes[i].isInside == nowFloor) &&
              (startNodes[i].building == nowBuilding ||
                  endNodes[i].building == nowBuilding)) {
            startPoints.add(Offset(startNodes[i].x, startNodes[i].y));
            endPoints.add(Offset(endNodes[i].x, endNodes[i].y));
          }
        }
      }
    }
  }

  void Astar_pathMaking(String startNodeName, String endNodeName) {
    //시작 노드와 도착 노드를 매개변수로 받아 Astar 알고리즘을 돌린 후 reconstructPath를 통해 경로를 리스트에 순서대로 저장한 후
    //지도 위에 그림을 그릴 수 있도록 start, end 리스트에 x, y값을 각각 넣는다.

    erase();
    startNodes.clear();
    endNodes.clear();

    Node startNode = graph.findNode(startNodeName);
    Node endNode = graph.findNode(endNodeName);

    int startIndex = graph.findNodeIndex(graph.nodes, startNodeName);
    int endIndex = graph.findNodeIndex(graph.nodes, endNodeName);

    // Regular search
    var regularResult =
        graph.aStar(graph.nodes, graph.edges, startNode, endNode);
    List<int> regularDist = regularResult.item1;
    List<int> regularPrev = regularResult.item2;

    List<Node> regularPath =
        reconstructPath(regularPrev, graph.nodes, startIndex, endIndex);

    print("Regular path from $startNode to $endNode:");
    for (int i = 0; i < regularPath.length; i++) {
      if (i == 0)
        startNodes.add(regularPath[i]);
      else if (i == regularPath.length - 1)
        endNodes.add(regularPath[i]);
      else {
        endNodes.add(regularPath[i]);
        startNodes.add(regularPath[i]);
      }
    }

    for (int i = 0; i < startNodes.length; i++) {
      print(
          "(${startNodes[i].x}, ${startNodes[i].y}) -> (${endNodes[i].x}, ${endNodes[i].y})");
    }

    for (int i = 0; i < startNodes.length; i++) {
      //실내 노드를 넣을 때 이곳을 수정해야함
      if (startNodes[i].isInside == 0 && endNodes[i].isInside == 0) {
        //엣지의 출발지, 도착지가 모두 밖일 때만 우선 startPoints, endPoints에 넣어서 외부 경로만 보이도록 한다.
        startPoints.add(Offset(startNodes[i].x, startNodes[i].y));
        endPoints.add(Offset(endNodes[i].x, endNodes[i].y));
      }
    }

    for (Node node in regularPath) {
      print("$node -> ");
    }
    print("END\n\n");

    print("Total distance: ${regularDist[endIndex]}");

    // 프로그램이 실행될 때의 _position 값을 출력합니다.

    for (int i = 0; i < startNodes.length; i++) {
      print('startPoints: $startPoints');
      print('endPoints: $endPoints');
    }

    //print('Initial _position: $_position');
  }

  @override
  Widget build(BuildContext context) {
    if (!_imageLoaded_du) {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(
            valueColor:AlwaysStoppedAnimation<Color>(Colors.orange),
          ),
        ),
      );
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: '동국대학교',
      ),
      body: Stack(
        children: [
          GestureDetector(
            onScaleStart: _onScaleStart,
            onScaleUpdate: _onScaleUpdate,
            onScaleEnd: _onScaleEnd,
            child: Stack(
              children: [
                Scaffold(
                  body: Center(
                    child: Stack(
                      children: [
                        Transform.scale(
                          scale: _scale,
                          child: Transform.translate(
                            offset: _position.scale(scale_offset, scale_offset),
                            child: ClipRect(
                              child: Stack(
                                children: [
                                  CustomPaint(
                                    size: Size(_imageWidth_du, _imageHeight_du),
                                    foregroundPainter: LinePainter(
                                      imageInfo: _imageInfo_du,
                                      startPoints: startPoints,
                                      endPoints: endPoints,
                                    ),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/du.png',
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          left: 1102 * scale_offset,
                                          top: 2973 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedHall = '과학관';
                                                _showFloorButton(selectedHall);
                                              });
                                            },
                                            child: Image.asset(
                                              sciencePath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 1337 * scale_offset,
                                          top: 2379 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '다향관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              dhPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 1308 * scale_offset,
                                          top: 3206 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '대운동장';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              dwPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 972 * scale_offset,
                                          top: 1880 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '만해광장';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              mhPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 1129 * scale_offset,
                                          top: 2805 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '명진관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              mjPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 1528 * scale_offset,
                                          top: 2563 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '법학관_만해관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              bmPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 1017 * scale_offset,
                                          top: 2394 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '본관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              bPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 2145 * scale_offset,
                                          top: 2775 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '사회과학관_경영관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              scPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 2297 * scale_offset,
                                          top: 2582 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '문화관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              culturePath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 1067 * scale_offset,
                                          top: 3118 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '상록원';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              srPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 482 * scale_offset,
                                          top: 2525 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '신공학관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              nePath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 694 * scale_offset,
                                          top: 2084 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '원흥관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              whPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 769 * scale_offset,
                                          top: 1920 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '정p';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              ipPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 634 * scale_offset,
                                          top: 1866 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '정q';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              iqPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 1673 * scale_offset,
                                          top: 2941 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '정각원';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              jgPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 897 * scale_offset,
                                          top: 2663 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '중앙도서관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              libraryPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 1321 * scale_offset,
                                          top: 1843 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '체육관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              gymPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 1078 * scale_offset,
                                          top: 1636 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '학림관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              hlPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 670 * scale_offset,
                                          top: 1773 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '학생회관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              stuPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 2527 * scale_offset,
                                          top: 2567 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '학술관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              hsPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 1804 * scale_offset,
                                          top: 2694 * scale_offset,
                                          child: InkWell(
                                            onTap: () {
                                              selectedHall = '혜화관';
                                              _showFloorButton(selectedHall);
                                            },
                                            child: Image.asset(
                                              hhPath,
                                              scale: 1 / scale_offset,
                                            ),
                                          ),
                                        ),
                                        if (_vendingvisibility)
                                          Positioned(
                                            left: 971 * scale_offset,
                                            top: 2479 * scale_offset,
                                            child: Image.asset(
                                              vendingPath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_vendingvisibility)
                                          Positioned(
                                            left: 725 * scale_offset,
                                            top: 2770 * scale_offset,
                                            child: Image.asset(
                                              vendingPath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_vendingvisibility)
                                          Positioned(
                                            left: 2360 * scale_offset,
                                            top: 2940 * scale_offset,
                                            child: Image.asset(
                                              vendingPath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_vendingvisibility)
                                          Positioned(
                                            left: 825 * scale_offset,
                                            top: 2022 * scale_offset,
                                            child: Image.asset(
                                              vendingPath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_showervisibility)
                                          Positioned(
                                            left: 927 * scale_offset,
                                            top: 2537 * scale_offset,
                                            child: Image.asset(
                                              showerPath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_showervisibility)
                                          Positioned(
                                            left: 1650 * scale_offset,
                                            top: 2616 * scale_offset,
                                            child: Image.asset(
                                              showerPath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_storevisibility)
                                          Positioned(
                                            left: 865 * scale_offset,
                                            top: 2279 * scale_offset,
                                            child: Image.asset(
                                              storePath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_storevisibility)
                                          Positioned(
                                            left: 694 * scale_offset,
                                            top: 2596 * scale_offset,
                                            child: Image.asset(
                                              storePath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_storevisibility)
                                          Positioned(
                                            left: 1028 * scale_offset,
                                            top: 2736 * scale_offset,
                                            child: Image.asset(
                                              storePath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_storevisibility)
                                          Positioned(
                                            left: 1123 * scale_offset,
                                            top: 3168 * scale_offset,
                                            child: Image.asset(
                                              storePath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_storevisibility)
                                          Positioned(
                                            left: 1955 * scale_offset,
                                            top: 2891 * scale_offset,
                                            child: Image.asset(
                                              storePath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_storevisibility)
                                          Positioned(
                                            left: 1107 * scale_offset,
                                            top: 1719 * scale_offset,
                                            child: Image.asset(
                                              storePath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_printervisibility)
                                          Positioned(
                                            left: 854 * scale_offset,
                                            top: 2696 * scale_offset,
                                            child: Image.asset(
                                              printerPath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_printervisibility)
                                          Positioned(
                                            left: 936 * scale_offset,
                                            top: 2416 * scale_offset,
                                            child: Image.asset(
                                              printerPath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_printervisibility)
                                          Positioned(
                                            left: 838 * scale_offset,
                                            top: 1988 * scale_offset,
                                            child: Image.asset(
                                              printerPath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_atmvisibility)
                                          Positioned(
                                            left: 2500 * scale_offset,
                                            top: 1725 * scale_offset,
                                            child: Image.asset(
                                              atmPath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_atmvisibility)
                                          Positioned(
                                            left: 1120 * scale_offset,
                                            top: 3217 * scale_offset,
                                            child: Image.asset(
                                              atmPath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_atmvisibility)
                                          Positioned(
                                            left: 1469 * scale_offset,
                                            top: 2956 * scale_offset,
                                            child: Image.asset(
                                              atmPath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_loungevisibility)
                                          Positioned(
                                            left: 1011 * scale_offset,
                                            top: 2870 * scale_offset,
                                            child: Image.asset(
                                              loungePath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_loungevisibility)
                                          Positioned(
                                            left: 1258 * scale_offset,
                                            top: 1735 * scale_offset,
                                            child: Image.asset(
                                              loungePath,
                                              scale: 1 / (scale_offset / 16),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                onTap: () async {
                                  result = await Navigator.pushNamed(
                                    context,
                                    '/find',
                                  );
                                  if (result['start'] != "" &&
                                      result['end'] != "") {
                                    setState(() {
                                      print(
                                          "********************************************");
                                      _startNodeName = result['start'];
                                      _endNodeName = result['end'];
                                      Astar_pathMaking(
                                          _startNodeName, _endNodeName);
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.7),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 12.0,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    '출발지를 입력하세요',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 43.0,
                            width: 60.0,
                            child: ElevatedButton(
                              onPressed: () async {
                                result = await Navigator.pushNamed(
                                  context,
                                  '/search',
                                );
                                print(
                                    '값넘기기실험중.${result['start']} , ${result['end']}, $result');

                                if (result['start'] != "" &&
                                    result['end'] != "") {
                                  setState(() {
                                    _startNodeName = result['start'];
                                    _endNodeName = result['end'];
                                    Astar_pathMaking(
                                        _startNodeName, _endNodeName);
                                  });
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search,
                                  ),
                                  Text(
                                    '길찾기',
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _vendingshow();
                              },
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor:
                                      Colors.white //.withOpacity(0.5),
                                  ),
                              child: Text(
                                '자판기',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                _showershow();
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                '샤워실',
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                _storeshow();
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                '편의점',
                                style: TextStyle(
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                _printershow();
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                '프린터',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                _loungeshow();
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                '라운지',
                                style: TextStyle(
                                  color: Colors.brown,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                _atmshow();
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                'ATM',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (_showButton == "과학관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "다향관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "대운동장앞")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "만해광장")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "명진관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "문화관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              culturePath = 'assets/images/floor/문화1.png';
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              culturePath = 'assets/images/floor/문화2.png';
                              nowFloor = 2;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('2F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              culturePath = 'assets/images/floor/문화3.png';
                              nowFloor = 3;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('3F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 140, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              culturePath =
                                  'assets/images/floor/문화관(2297,2582).png';
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 180, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "법학관_만해관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "본관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "사회과학관_경영관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              scPath = 'assets/images/floor/사과경영1.png';
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              scPath = 'assets/images/floor/사과경영2.png';
                              nowFloor = 2;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('2F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              scPath = 'assets/images/floor/사과경영3.png';
                              nowFloor = 3;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('3F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 140, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              scPath =
                                  'assets/images/floor/사회과학관_경영관(2145,2775).png';
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 180, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "상록원")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "신공학관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nePath = 'assets/images/floor/신공1.png';
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nePath = 'assets/images/floor/신공2.png';
                              nowFloor = 4;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('4F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nePath = 'assets/images/floor/신공3.png';
                              nowFloor = 7;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('7F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 140, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nePath = 'assets/images/floor/신공학관(482,2525).png';
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 180, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "원흥관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              whPath = 'assets/images/floor/원흥1.png';
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              whPath = 'assets/images/floor/원흥2.png';
                              nowFloor = 2;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('2F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              whPath = 'assets/images/floor/원흥3.png';
                              nowFloor = 3;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('3F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 140, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              whPath = 'assets/images/floor/원흥관(694,2084).png';
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "정p")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "정q")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "정각원")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "중앙도서관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "체육관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "학림관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "학생회관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "학술관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              hsPath = 'assets/images/floor/학술1.png';
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              hsPath = 'assets/images/floor/학술2.png';
                              nowFloor = 2;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('2F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              hsPath = 'assets/images/floor/학술3.png';
                              nowFloor = 3;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('3F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 140, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              hsPath = 'assets/images/floor/학술관(2527,2567).png';
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 180, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
                if (_showButton == "혜화관")
                  Stack(
                    children: [
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 20, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              hhPath = 'assets/images/floor/혜화1.png';
                              nowFloor = 1;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('1F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 60, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              hhPath = 'assets/images/floor/혜화2.png';
                              nowFloor = 2;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('2F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 100, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              hhPath = 'assets/images/floor/혜화3.png';
                              nowFloor = 3;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('3F'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 140, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              hhPath = 'assets/images/floor/혜화관(1804,2964).png';
                              nowFloor = 0;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('기본'),
                        ),
                      ),
                      Positioned(
                        left: 20, // 버튼의 x 좌표를 조절하세요.
                        bottom: 180, // 버튼의 y 좌표를 조절하세요.
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //시설 정보로 이동하는 코드 구현 위치
                            });
                          },
                          child: Text('시설정보'),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 50,
            child: Container(
              child: Text(
                '값넘기기실험중 $_startNodeName and $_endNodeName',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
