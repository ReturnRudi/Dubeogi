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

  double _scale = 1.3;
  double _previousScale = 1.0;
  Offset _position = Offset.zero;
  Offset _previousPosition = Offset.zero;

  List<Offset> startPoints = [];
  List<Offset> endPoints = [];

  List<Node> startNodes = [];
  List<Node> endNodes = [];

  Graph graph = Graph();

  void erase() {
    startPoints.clear();
    endPoints.clear();
  }

  String _startNodeName = "";
  String _endNodeName = "";
  dynamic result;

  @override
  void initState() {
    super.initState();
    _getImageInfo();

    graph.addEdge("다향관", "명진관", 100, "평지", "차도", node1X: 1451, node1Y: 2469, inside1: 0, building1: "다향관", building2: "명진관", node2X: 1320, node2Y: 2900, inside2: 0);
    graph.addEdge("명진관", "과학관", 30, "평지", "차도", node2X: 1248, node2Y: 3071, inside2: 0, building2: "과학관");
    graph.addEdge("과학관", "대운동장앞", 20, "평지", "차도", node2X: 1589, node2Y: 3421, inside2: 0, building2: "밖");
    graph.addEdge("명진관", "법학관", 70, "평지", "차도", node2X: 1656, node2Y: 2641, inside2: 0, building2: "법학관");
    graph.addEdge("다향관", "법학관", 70, "평지", "차도");
    graph.addEdge("법학관", "혜화관", 50, "평지", "차도", node2X: 1990, node2Y: 2882, inside2: 0, building2: "혜화관");
    graph.addEdge("법학관", "대운동장앞", 170, "평지", "차도");
    graph.addEdge("대운동장앞", "경영관", 200, "평지", "차도", node2X: 2366, node2Y: 3214, inside2: 0, building2: "경영관");
    graph.addEdge("대운동장앞", "명진관", 220, "평지", "차도");
    graph.addEdge("대운동장앞", "혜화관", 80, "평지", "차도");
    graph.addEdge("경영관", "사회과학관", 10, "평지", "도보", node2X: 2274, node2Y: 2921, inside2: 0, building2: "사화과학관");
    graph.addEdge("사회과학관", "혜화관", 30, "평지", "차도");
    graph.addEdge("혜화관", "문화관", 45, "평지", "도보", node2X: 2416, node2Y: 2838, inside2: 3, building2: "문화관");
    graph.addEdge("사회과학관", "문화관", 20, "평지", "도보");
    graph.addEdge("문화관", "학술관", 20, "평지", "도보", node2X: 2595, node2Y: 2722, inside2: 0, building2: "학술관");



    for (int i = 0; i < graph.nodes.length; i++) {
      names.add(graph.nodes[i].name);
    }
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

  List<Node> reconstructPath( //Astar 결과 지나온 노드들을 반대로 돌아가면서 경로를 path 리스트에 저장한 후 reverse를 통해 경로 순서대로 재배치한다.
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

  void floorButtonPath(int nowFloor, String nowBuilding){
    //층 단면도를 보여주는 버튼을 눌렀을 때 해당하는 경로를 보여주는 함수
    erase();

    for (int i = 0; i < startNodes.length; i++) {
      if(startNodes[i].isInside == 0 && endNodes[i].isInside == 0){ //엣지의 출발지, 도착지가 모두 밖이면 그냥 경로 리스트에 추가
        startPoints.add(Offset(startNodes[i].x, startNodes[i].y));
        endPoints.add(Offset(endNodes[i].x, endNodes[i].y));
      }
      else{
        if(nowFloor != 0){
          if((startNodes[i].isInside == nowFloor || endNodes[i].isInside == nowFloor) && (startNodes[i].building == nowBuilding || endNodes[i].building == nowBuilding)){
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

    for (int i = 0; i < startNodes.length; i++) {  //실내 노드를 넣을 때 이곳을 수정해야함
      if(startNodes[i].isInside == 0 && endNodes[i].isInside == 0){ //엣지의 출발지, 도착지가 모두 밖일 때만 우선 startPoints, endPoints에 넣어서 외부 경로만 보이도록 한다.
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
                        Transform.scale(
                          scale: _scale,
                          child: Transform.translate(
                            offset: _position.scale(
                                scale_offset, scale_offset),
                            child: ClipRect(
                              child: Stack(
                                children: [
                                  CustomPaint(
                                    size: Size(
                                        _imageWidth_du, _imageHeight_du),
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
                                                _showFloorButton(
                                                    selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              _showFloorButton(
                                                  selectedHall);
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
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_vendingvisibility)
                                          Positioned(
                                            left: 725 * scale_offset,
                                            top: 2770 * scale_offset,
                                            child: Image.asset(
                                              vendingPath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_vendingvisibility)
                                          Positioned(
                                            left: 2360 * scale_offset,
                                            top: 2940 * scale_offset,
                                            child: Image.asset(
                                              vendingPath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_vendingvisibility)
                                          Positioned(
                                            left: 825 * scale_offset,
                                            top: 2022 * scale_offset,
                                            child: Image.asset(
                                              vendingPath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_showervisibility)
                                          Positioned(
                                            left: 927 * scale_offset,
                                            top: 2537 * scale_offset,
                                            child: Image.asset(
                                              showerPath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_showervisibility)
                                          Positioned(
                                            left: 1650 * scale_offset,
                                            top: 2616 * scale_offset,
                                            child: Image.asset(
                                              showerPath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_storevisibility)
                                          Positioned(
                                            left: 865 * scale_offset,
                                            top: 2279 * scale_offset,
                                            child: Image.asset(
                                              storePath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_storevisibility)
                                          Positioned(
                                            left: 694 * scale_offset,
                                            top: 2596 * scale_offset,
                                            child: Image.asset(
                                              storePath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_storevisibility)
                                          Positioned(
                                            left: 1028 * scale_offset,
                                            top: 2736 * scale_offset,
                                            child: Image.asset(
                                              storePath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_storevisibility)
                                          Positioned(
                                            left: 1123 * scale_offset,
                                            top: 3168 * scale_offset,
                                            child: Image.asset(
                                              storePath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_storevisibility)
                                          Positioned(
                                            left: 1955 * scale_offset,
                                            top: 2891 * scale_offset,
                                            child: Image.asset(
                                              storePath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_storevisibility)
                                          Positioned(
                                            left: 1107 * scale_offset,
                                            top: 1719 * scale_offset,
                                            child: Image.asset(
                                              storePath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_printervisibility)
                                          Positioned(
                                            left: 854 * scale_offset,
                                            top: 2696 * scale_offset,
                                            child: Image.asset(
                                              printerPath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_printervisibility)
                                          Positioned(
                                            left: 936 * scale_offset,
                                            top: 2416 * scale_offset,
                                            child: Image.asset(
                                              printerPath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_printervisibility)
                                          Positioned(
                                            left: 838 * scale_offset,
                                            top: 1988 * scale_offset,
                                            child: Image.asset(
                                              printerPath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_atmvisibility)
                                          Positioned(
                                            left: 2500 * scale_offset,
                                            top: 1725 * scale_offset,
                                            child: Image.asset(
                                              atmPath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_atmvisibility)
                                          Positioned(
                                            left: 1120 * scale_offset,
                                            top: 3217 * scale_offset,
                                            child: Image.asset(
                                              atmPath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_atmvisibility)
                                          Positioned(
                                            left: 1469 * scale_offset,
                                            top: 2956 * scale_offset,
                                            child: Image.asset(
                                              atmPath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_loungevisibility)
                                          Positioned(
                                            left: 1011 * scale_offset,
                                            top: 2870 * scale_offset,
                                            child: Image.asset(
                                              loungePath,
                                              scale:
                                              1 / (scale_offset / 16),
                                            ),
                                          ),
                                        if (_loungevisibility)
                                          Positioned(
                                            left: 1258 * scale_offset,
                                            top: 1735 * scale_offset,
                                            child: Image.asset(
                                              loungePath,
                                              scale:
                                              1 / (scale_offset / 16),
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
                                      print("********************************************");
                                      _startNodeName = result['start'];
                                      _endNodeName = result['end'];
                                      Astar_pathMaking(_startNodeName, _endNodeName);
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
                                    Astar_pathMaking(_startNodeName, _endNodeName);
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
