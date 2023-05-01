import 'dart:async';
import 'package:Dubeogi/screen/input.dart';
import 'package:flutter/material.dart';
import 'package:Dubeogi/component/appbar.dart';
import 'package:Dubeogi/algorithm/astar.dart';
import 'package:Dubeogi/save/save.dart';
import 'package:Dubeogi/component/draw_line.dart';
import 'package:Dubeogi/screen/search_screen.dart';

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

  bool _showButton = false;
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

  void _toggleButton() {
    setState(() {
      _showButton = !_showButton;
    });
  }

  double _scale = 1.3;
  double _previousScale = 1.0;
  Offset _position = Offset.zero;
  Offset _previousPosition = Offset.zero;

  List<Offset> startPoints = [];
  List<Offset> endPoints = [];
  String _startNodeName = "";
  String _endNodeName = "";
  Graph graph = Graph();
  dynamic result;

  @override
  void initState() {
    super.initState();
    _getImageInfo();

    graph.addEdge("다향관", 1451, 2469, "명진관", 1320, 2900, 100, "평지", "차도");
    graph.addEdge("명진관", 5917, 6442, "과학관", 5885, 6671, 30, "평지", "차도");
    graph.addEdge("과학관", 5885, 6671, "대운동장앞", 6385, 6837, 20, "평지", "차도");
    graph.addEdge("명진관", 5917, 6442, "법학관", 6339, 6113, 70, "평지", "차도");
    graph.addEdge("다향관", 6107, 5898, "법학관", 6339, 6113, 70, "평지", "차도");
    graph.addEdge("법학관", 6339, 6113, "혜화관", 6757, 6443, 50, "평지", "차도");
    graph.addEdge("법학관", 6339, 6113, "대운동장앞", 6385, 6837, 170, "평지", "차도");
    graph.addEdge("대운동장앞", 6385, 6837, "경영관", 7223, 6823, 200, "평지", "차도");
    graph.addEdge("대운동장앞", 6385, 6837, "사회과학관", 7103, 6457, 220, "평지", "차도");
    graph.addEdge("대운동장앞", 6385, 6837, "혜화관", 6757, 6443, 80, "평지", "차도");
    graph.addEdge("경영관", 7223, 6823, "사회과학관", 7103, 6457, 10, "평지", "도보");
    graph.addEdge("사회과학관", 7103, 6457, "혜화관", 6757, 6443, 30, "평지", "차도");
    graph.addEdge("혜화관", 6757, 6443, "문화관", 7291, 6357, 45, "평지", "도보");
    graph.addEdge("사회과학관", 7103, 6457, "문화관", 7291, 6357, 20, "평지", "도보");
    graph.addEdge("문화관", 7291, 6357, "학술관", 7517, 6215, 20, "평지", "도보");
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
      print('imageHeight: $_imageHeight_du, imageWidth: $_imageWidth_du');
      print('screenWidth: $screenWidth, screenHeight: $screenHeight');
      print('minX: $minX, maxX: $maxX, minY: $minY, maxY: $maxY');

      // _position 값을 제한 값으로 설정합니다.
      _position = Offset(
        _position.dx.clamp(minX, maxX),
        _position.dy.clamp(minY, maxY),
      );
    });
  }

  List<Node> reconstructPath(
      List<int> prev, List<Node> nodes, int startIndex, int endIndex) {
    List<Node> path = [];
    int currentNode = endIndex;

    while (currentNode != startIndex) {
      path.add(nodes[currentNode]);
      currentNode = prev[currentNode];
      if (currentNode == -1) {
        break;
      }
    }

    if (currentNode == startIndex) {
      path.add(nodes[startIndex]);
    }

    path = path.reversed.toList();
    return path;
  }

  void a(String startNodeName, String endNodeName) {
    Node startNode = graph.findNode(startNodeName);
    Node endNode = graph.findNode(endNodeName);

    int startIndex = graph.findNodeIndex(graph.nodes, startNodeName);
    int endIndex = graph.findNodeIndex(graph.nodes, endNodeName);

    // Regular search
    var regularResult =
    graph.aStar(graph.nodes, graph.edges, startNode, endNode);
    List<int> regularDist = regularResult.item1;
    List<int> regularPrev = regularResult.item2;

    List<Node> startNodePoints = [];
    List<Node> endNodePoints = [];
    List<Node> regularPath =
    reconstructPath(regularPrev, graph.nodes, startIndex, endIndex);

    print("Regular path from $startNode to $endNode:");
    for (int i = 0; i < regularPath.length; i++) {
      if (i == 0)
        startNodePoints.add(regularPath[i]);
      else if (i == regularPath.length - 1)
        endNodePoints.add(regularPath[i]);
      else {
        endNodePoints.add(regularPath[i]);
        startNodePoints.add(regularPath[i]);
      }
    }

    for (int i = 0; i < startNodePoints.length; i++) {
      print(
          "(${startNodePoints[i].x}, ${startNodePoints[i].y}) -> (${endNodePoints[i].x}, ${endNodePoints[i].y})");
    }

    for (int i = 0; i < startNodePoints.length; i++) {
      startPoints.add(Offset(startNodePoints[i].x, startNodePoints[i].y));
      endPoints.add(Offset(endNodePoints[i].x, endNodePoints[i].y));
    }

    for (Node node in regularPath) {
      print("$node -> ");
    }
    print("END\n\n");

    print("Total distance: ${regularDist[endIndex]}");

    // 프로그램이 실행될 때의 _position 값을 출력합니다.

    for (int i = 0; i < startNodePoints.length; i++) {
      print('startPoints: $startPoints');
      print('endPoints: $endPoints');
    }

    //print('Initial _position: $_position');
  }

  Widget build(BuildContext context) {
    if (!_imageLoaded_du) {
      return Container(
        color: Color(0xFFDCB6),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
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
                          !_imageLoaded_du
                              ? Text('지도를 불러오는 중')
                              : Transform.scale(
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
                                      child: Image.asset(
                                        'assets/images/du.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      left: 1102 * scale_offset,
                                      top: 2973 * scale_offset,
                                      child: InkWell(
                                        onTap: () {
                                          _toggleButton();
                                          selectedHall = '과학관';
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
                                          _toggleButton();
                                          selectedHall = '다향관';
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
                                          _toggleButton();
                                          selectedHall = '대운동장';
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
                                          _toggleButton();
                                          selectedHall = '만해광장';
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
                                          _toggleButton();
                                          selectedHall = '명진관';
                                        },
                                        child: Image.asset(
                                          mjPath,
                                          scale: 1 / scale_offset,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 2297 * scale_offset,
                                      top: 2582 * scale_offset,
                                      child: InkWell(
                                        onTap: () {
                                          _toggleButton();
                                          selectedHall = '문화관';
                                        },
                                        child: Image.asset(
                                          culturePath,
                                          scale: 1 / scale_offset,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 1528 * scale_offset,
                                      top: 2563 * scale_offset,
                                      child: InkWell(
                                        onTap: () {
                                          _toggleButton();
                                          selectedHall = '법학관_만해관';
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
                                          _toggleButton();
                                          selectedHall = '본관';
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
                                          _toggleButton();
                                          selectedHall = '사회과학관_경영관';
                                        },
                                        child: Image.asset(
                                          scPath,
                                          scale: 1 / scale_offset,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 1067 * scale_offset,
                                      top: 3118 * scale_offset,
                                      child: InkWell(
                                        onTap: () {
                                          _toggleButton();
                                          selectedHall = '상록원';
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
                                          _toggleButton();
                                          selectedHall = '신공학관';
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
                                          _toggleButton();
                                          selectedHall = '원흥관';
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
                                          _toggleButton();
                                          selectedHall = '정p';
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
                                          _toggleButton();
                                          selectedHall = '정q';
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
                                          _toggleButton();
                                          selectedHall = '정각원';
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
                                          _toggleButton();
                                          selectedHall = '중앙도서관';
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
                                          _toggleButton();
                                          selectedHall = '체육관';
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
                                          _toggleButton();
                                          selectedHall = '학림관';
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
                                          _toggleButton();
                                          selectedHall = '학생회관';
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
                                          _toggleButton();
                                          selectedHall = '학술관';
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
                                          _toggleButton();
                                          selectedHall = '혜화관';
                                        },
                                        child: Image.asset(
                                          hhPath,
                                          scale: 1 / scale_offset,
                                        ),
                                      ),
                                    ),
                                    if(_vendingvisibility)
                                      Positioned(
                                        left: 971 * scale_offset,
                                        top: 2479 * scale_offset,
                                        child: Image.asset(
                                          vendingPath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_vendingvisibility)
                                      Positioned(
                                        left: 725 * scale_offset,
                                        top: 2770 * scale_offset,
                                        child: Image.asset(
                                          vendingPath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_vendingvisibility)
                                      Positioned(
                                        left: 2360 * scale_offset,
                                        top: 2940 * scale_offset,
                                        child: Image.asset(
                                          vendingPath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_vendingvisibility)
                                      Positioned(
                                        left: 825 * scale_offset,
                                        top: 2022 * scale_offset,
                                        child: Image.asset(
                                          vendingPath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_showervisibility)
                                      Positioned(
                                        left: 927 * scale_offset,
                                        top: 2537 * scale_offset,
                                        child: Image.asset(
                                          showerPath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_showervisibility)
                                      Positioned(
                                        left: 1650 * scale_offset,
                                        top: 2616 * scale_offset,
                                        child: Image.asset(
                                          showerPath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_storevisibility)
                                      Positioned(
                                        left: 865 * scale_offset,
                                        top: 2279 * scale_offset,
                                        child: Image.asset(
                                          storePath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_storevisibility)
                                      Positioned(
                                        left: 694 * scale_offset,
                                        top: 2596 * scale_offset,
                                        child: Image.asset(
                                          storePath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_storevisibility)
                                      Positioned(
                                        left: 1028 * scale_offset,
                                        top: 2736 * scale_offset,
                                        child: Image.asset(
                                          storePath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_storevisibility)
                                      Positioned(
                                        left: 1123 * scale_offset,
                                        top: 3168 * scale_offset,
                                        child: Image.asset(
                                          storePath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_storevisibility)
                                      Positioned(
                                        left: 1955 * scale_offset,
                                        top: 2891 * scale_offset,
                                        child: Image.asset(
                                          storePath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_storevisibility)
                                      Positioned(
                                        left: 1107 * scale_offset,
                                        top: 1719 * scale_offset,
                                        child: Image.asset(
                                          storePath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_printervisibility)
                                      Positioned(
                                        left: 854 * scale_offset,
                                        top: 2696 * scale_offset,
                                        child: Image.asset(
                                          printerPath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_printervisibility)
                                      Positioned(
                                        left: 936 * scale_offset,
                                        top: 2416 * scale_offset,
                                        child: Image.asset(
                                          printerPath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_printervisibility)
                                      Positioned(
                                        left: 838 * scale_offset,
                                        top: 1988 * scale_offset,
                                        child: Image.asset(
                                          printerPath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_atmvisibility)
                                      Positioned(
                                        left: 2500 * scale_offset,
                                        top: 1725 * scale_offset,
                                        child: Image.asset(
                                          atmPath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_atmvisibility)
                                      Positioned(
                                        left: 1120 * scale_offset,
                                        top: 3217 * scale_offset,
                                        child: Image.asset(
                                          atmPath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_atmvisibility)
                                      Positioned(
                                        left: 1469 * scale_offset,
                                        top: 2956 * scale_offset,
                                        child: Image.asset(
                                          atmPath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_loungevisibility)
                                      Positioned(
                                        left: 1011 * scale_offset,
                                        top: 2870 * scale_offset,
                                        child: Image.asset(
                                          loungePath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                    if(_loungevisibility)
                                      Positioned(
                                        left: 1258 * scale_offset,
                                        top: 1735 * scale_offset,
                                        child: Image.asset(
                                          loungePath,
                                          scale: 1 / (scale_offset/16),),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (_showButton)
                            Positioned(
                              left: 20, // 버튼의 x 좌표를 조절하세요.
                              bottom: 20, // 버튼의 y 좌표를 조절하세요.
                              child: ElevatedButton(
                                onPressed: () {
                                  if (selectedHall == "중앙도서관")
                                    libraryPath = 'assets/images/after/중앙도서관(897,2663).png';
                                  else if (selectedHall == "과학관")
                                    sciencePath = 'assets/images/after/과학관(1102,2973).png';
                                  else if (selectedHall == "대운동장")
                                    dwPath = 'assets/images/after/대운동장(1308,3206).png';
                                  else if (selectedHall == "만해광장")
                                    mhPath = 'assets/images/after/만해광장(972,1880).png';
                                  else if (selectedHall == "명진관")
                                    mjPath = 'assets/images/after/명진관(1129,2805).png';
                                  else if (selectedHall == "문화관")
                                    culturePath = 'assets/images/after/문화관(2297,2582).png';
                                  else if (selectedHall == "본관")
                                    bPath = 'assets/images/after/본관(1017,2394).png';
                                  else if (selectedHall == "사회과학관_경영관")
                                    scPath = 'assets/images/after/사회과학관_경영관(2145,2775).png';
                                  else if (selectedHall == "신공학관")
                                    nePath = 'assets/images/after/신공학관(482,2525).png';
                                  else if (selectedHall == "원흥관")
                                    whPath = 'assets/images/after/원흥관(694,2084).png';
                                  else if (selectedHall == "정p")
                                    ipPath = 'assets/images/after/정p(769,1920).png';
                                  else if (selectedHall == "정q")
                                    iqPath = 'assets/images/after/정q(634,1866).png';
                                  else if (selectedHall == "정각원")
                                    jgPath = 'assets/images/after/정각원(1673,2941).png';
                                  else if (selectedHall == "체육관")
                                    gymPath = 'assets/images/after/체육관(1321,1843).png';
                                  else if (selectedHall == "학림관")
                                    hlPath = 'assets/images/after/학림관(1078,1636).png';
                                  else if (selectedHall == "학생회관")
                                    stuPath = 'assets/images/after/학생회관(670,1773).png';
                                  else if (selectedHall == "학술관")
                                    hsPath = 'assets/images/after/학술관(2527,2567).png';
                                  else if (selectedHall == "혜화관")
                                    hhPath = 'assets/images/after/혜화관(1804,2694).png';
                                  _toggleButton();
                                },
                                child: Text('1F'),
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
                                  onTap: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (_)=> Pressinput(),)
                                    );
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
                                  result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SearchScreen(),
                                    ),
                                  );
                                  print(
                                      '값넘기기실험중.${result['start']} , ${result['end']}, $result');

                                  if (result['start'] != "" && result['end'] != "") {
                                    setState(() {
                                      _startNodeName = result['start'];
                                      _endNodeName = result['end'];
                                      a(_startNodeName,_endNodeName);

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
                                    backgroundColor: Colors.white //.withOpacity(0.5),
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
        ));
  }
}