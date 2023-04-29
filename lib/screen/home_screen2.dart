import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Dubeogi/algorithm/astar.dart';
import 'package:Dubeogi/component/appbar.dart';
import 'package:Dubeogi/component/draw_line.dart';
import 'package:Dubeogi/screen/search_screen.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreenState2();
}

class _HomeScreenState2 extends State<HomeScreen2> {
  late ImageInfo _imageInfo;
  bool _imageLoaded = false;
  late double _imageWidth;
  late double _imageHeight;
  late double scale_offset;

  double _scale = 4.0;
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
    // 이미지를 받아오고
    _getImageInfo();
    // 그래프 생성
    graph.addEdge("다향관", 6107, 5898, "명진관", 5917, 6442, 100, "평지", "차도");
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
    // 이미지 로드드
    final Completer<ImageInfo> completer = Completer();
    final ImageStream stream =
        AssetImage('assets/images/du.png').resolve(ImageConfiguration());
    final listener = ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info);
    });
    stream.addListener(listener);
    _imageInfo = await completer.future;
    setState(() {
      _imageLoaded = true;
      _imageWidth = _imageInfo.image.width.toDouble();
      _imageHeight = _imageInfo.image.height.toDouble();
      scale_offset = MediaQuery.of(context).size.width / _imageWidth;
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
      _scale = (_previousScale * details.scale).clamp(4.0, double.infinity);

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
      final screenWidth = _imageWidth / _scale; //화면에서 보여지는 너비의 물리적 픽셀값
      final screenHeight = screenWidth * ratio; //화면에서 보여지는 높이의 물리적 픽셀값

      double minY, maxY;

      // 이미지의 최소 및 최대 제한 값을 계산합니다.
      double minX = -_imageWidth / 2 + screenWidth / 2;
      double maxX = _imageWidth / 2 - screenWidth / 2;

      // 위 아래 여백이 생기는 경우 minY, maxY의 크기가 역전되지 않도록 if문 추가
      if (_imageHeight > screenHeight) {
        minY = -_imageHeight / 2 + screenHeight / 2;
        maxY = _imageHeight / 2 - screenHeight / 2;
      } else {
        minY = _imageHeight / 2 - screenHeight / 2;
        maxY = -_imageHeight / 2 + screenHeight / 2;
      }

      // 값을 출력합니다.
      print('imageHeight: $_imageHeight, imageWidth: $_imageWidth');
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
      // end부터 start까지 path로 추가
      path.add(nodes[currentNode]);
      currentNode = prev[currentNode];
      if (currentNode == -1) {
        break;
      }
    }
    if (currentNode == startIndex) {
      // 위 while에서 startnode는 추가가 안됐기 때문에 따로 추가
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

  @override
  Widget build(BuildContext context) {
    if (!_imageLoaded) {
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
            // 지도
            GestureDetector(
              onScaleStart: _onScaleStart,
              onScaleUpdate: _onScaleUpdate,
              onScaleEnd: _onScaleEnd,
              child: Scaffold(
                body: Center(
                  child: Transform.scale(
                    scale: _scale,
                    child: Transform.translate(
                      offset: _position.scale(scale_offset, scale_offset),
                      child: ClipRect(
                        child: CustomPaint(
                          size: Size(_imageWidth, _imageHeight),
                          foregroundPainter: LinePainter(
                            imageInfo: _imageInfo,
                            startPoints: startPoints,
                            endPoints: endPoints,
                          ),
                          child: Image.asset(
                            'assets/images/du.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // 버튼
              bottom: 50,
              right: 50,
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
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // 버튼 모서리 둥글기 정도
                  ),
                ),
                child: Text('길찾기'),
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
