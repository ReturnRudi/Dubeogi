import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Dubeogi/component/appbar.dart';
import 'package:Dubeogi/algorithm/astar.dart';
import 'package:Dubeogi/save/save.dart';
import 'package:Dubeogi/component/draw_line.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


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
  int selectOption = 0;

  int nowFloor = 0;
  String _showButton = "기본";

  double _scale = 1.3;
  double _previousScale = 1.0;
  Offset _position = Offset.zero;
  Offset _previousPosition = Offset.zero;

  double now_w = 0.0;
  double now_g = 0.0;
  bool isTrackingLocation = false;
  StreamSubscription<Position>? positionStream;
  Offset gpsToPixel = Offset.zero;

  List<Offset> startPoints = [];
  List<Offset> endPoints = [];
  List<Offset> startPointsRed = [];
  List<Offset> endPointsRed = [];
  List<Offset> startPointsGreen = [];
  List<Offset> endPointsGreen = [];
  List<Offset> startPointsBlue = [];
  List<Offset> endPointsBlue = [];


/*  String _startNodeName = "";
  String _endNodeName = "";*/
  dynamic result;

  //late String nowBuilding;
  bool _vendingvisibility = false;
  bool _showervisibility = false;
  bool _storevisibility = false;
  bool _atmvisibility = false;
  bool _loungevisibility = false;
  bool _printervisibility = false;

  // for drawer widget

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

  Offset gps(double w, double g) {
    double pixel_x = 3000 * (g - 126.9962082464593) / (127.0046597158073 - 126.9962082464593);
    double pixel_y = 5333 * (37.56424922299378 - w) / (37.56424922299378 - 37.552279443944855);

    return Offset(pixel_x - 12, pixel_y - 5);  //왼쪽 위 오른 쪽 아래 보면서 오차 수정 필요
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      status = await Permission.location.request();
      if (!status.isGranted) {
        return Future.error('Location permission not granted');
      }
    }
  }

  void startLocationStream() async {
    await requestLocationPermission();
    positionStream = Geolocator.getPositionStream(
        desiredAccuracy: LocationAccuracy.high,
        //distanceFilter: 1
        intervalDuration: Duration(milliseconds: 1000)
    ).listen((Position position) {
      setState(() {
        now_w = position.latitude;
        now_g = position.longitude;
        gpsToPixel = gps(now_w, now_g);
      });
    });
  }

  @override
  void dispose() {
    positionStream?.cancel(); // Don't forget to cancel the stream when disposing
    super.dispose();
  }

  void toggleLocationTracking() {
    if (isTrackingLocation) {
      positionStream?.cancel();
    } else {
      startLocationStream();
    }

    setState(() {
      isTrackingLocation = !isTrackingLocation;
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
    initGraph();
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
      _scale = (_previousScale * details.scale).clamp(1.3, 12.0);
      final ratio = MediaQuery.of(context).size.height /
          MediaQuery.of(context).size.width;
      final screenWidth = _imageWidth_du / _scale;
      final screenHeight = screenWidth * ratio;

      double minY, maxY;

      double minX = -_imageWidth_du / 2 + screenWidth / 2;
      double maxX = _imageWidth_du / 2 - screenWidth / 2;

      if (_imageHeight_du > screenHeight) {
        minY = -_imageHeight_du / 2 + screenHeight / 2;
        maxY = _imageHeight_du / 2 - screenHeight / 2;
      } else {
        minY = _imageHeight_du / 2 - screenHeight / 2;
        maxY = -_imageHeight_du / 2 + screenHeight / 2;
      }

      _position += (details.focalPoint - _previousPosition) /
          _previousScale /
          scale_offset;

      _position = Offset(
        _position.dx.clamp(minX, maxX),
        _position.dy.clamp(minY, maxY),
      );

      _previousPosition = details.focalPoint;
    });
  }

  void _onScaleEnd(ScaleEndDetails details) {
    setState(() {
      // 화면 크기를 얻습니다.
      print('position: $_position');
      print("_scale: $_scale");
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

  void ColorPath(){
    erase();
    startPointsRed.clear();
    endPointsRed.clear();
    startPointsGreen.clear();
    endPointsGreen.clear();
    startPointsBlue.clear();
    endPointsBlue.clear();

    if(selectOption == 1 || selectOption == 2){
      for (int i = 0; i < startNodes.length; i++) {
        if(startNodes[i].isInside == 0 && endNodes[i].isInside == 0){
          if (graph.findEdge(startNodes[i].name, endNodes[i].name)?.type == "계단" || graph.findEdge(startNodes[i].name, endNodes[i].name)?.type == "오르막") {
            startPointsRed.add(Offset(startNodes[i].x, startNodes[i].y));
            endPointsRed.add(Offset(endNodes[i].x, endNodes[i].y));
          }
          else{
            startPointsGreen.add(Offset(startNodes[i].x, startNodes[i].y));
            endPointsGreen.add(Offset(endNodes[i].x, endNodes[i].y));
          }
        }
      }
    }
    else{
      for (int i = 0; i < startNodes.length; i++) {
        if (graph.findEdge(startNodes[i].name, endNodes[i].name)?.edgeAttribute == "차도") {
          startPointsBlue.add(Offset(startNodes[i].x, startNodes[i].y));
          endPointsBlue.add(Offset(endNodes[i].x, endNodes[i].y));
        }
        else{
          startPointsGreen.add(Offset(startNodes[i].x, startNodes[i].y));
          endPointsGreen.add(Offset(endNodes[i].x, endNodes[i].y));
        }
      }
    }
  }

/*  void floorButtonPath(int nowFloor, String nowBuilding) {
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
  }*/

  void floorButtonPath(int nowFloor, String nowBuilding) {
    //층 단면도를 보여주는 버튼을 눌렀을 때 해당하는 경로를 보여주는 함수

    ColorPath();
    for (int i = 0; i < startNodes.length; i++) {
      if (startNodes[i].isInside != 0 || endNodes[i].isInside != 0) {
        if(nowFloor != 0){
          if ((startNodes[i].isInside == nowFloor || endNodes[i].isInside == nowFloor) && (startNodes[i].building == nowBuilding || endNodes[i].building == nowBuilding)) {
            String? type = graph.findEdge(startNodes[i].name, endNodes[i].name)?.type;
            if(type == "계단" || type == "오르막"){
              startPointsRed.add(Offset(startNodes[i].x, startNodes[i].y));
              endPointsRed.add(Offset(endNodes[i].x, endNodes[i].y));
            }else if(type == "평지"){
              startPointsGreen.add(Offset(startNodes[i].x, startNodes[i].y));
              endPointsGreen.add(Offset(endNodes[i].x, endNodes[i].y));
            }
          }
        }
      }
    }
  }

/*  void Astar_pathMaking(String startNodeName, String endNodeName) {
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



    for (int i = 0; i < startNodes.length; i++) {
      print('startPoints: $startPoints');
      print('endPoints: $endPoints');
    }

    // 프로그램이 실행될 때의 _position 값을 출력합니다.
    //print('Initial _position: $_position');
  }*/

  bool testVar = false;
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    if (!_imageLoaded_du) {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
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
                  resizeToAvoidBottomInset: false,
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
                                      startPointsRed: startPointsRed, // 빈 리스트 전달
                                      endPointsRed: endPointsRed, // 빈 리스트 전달
                                      startPointsGreen: startPointsGreen, // 초록색 선의 점들 전달
                                      endPointsGreen: endPointsGreen, // 초록색 선의 점들 전달
                                      startPointsBlue: startPointsBlue, // 빈 리스트 전달
                                      endPointsBlue: endPointsBlue, // 빈 리스트 전달
                                    ),
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'assets/images/du.png',
                                            fit: BoxFit.cover,
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
                                            left: 1530 * scale_offset,
                                            top: 2564 * scale_offset,
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
                                          if (isTrackingLocation)
                                            Stack(
                                              children: [
                                                Positioned( // 투명 큰 원
                                                  left: (gpsToPixel.dx * scale_offset) - 4 * 1.3 /_scale,
                                                  top: (gpsToPixel.dy * scale_offset) - 4 * 1.3 /_scale,
                                                  child: Container(
                                                    width: 18 * 1.3 / _scale,
                                                    height: 18 * 1.3 / _scale,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.orange.withOpacity(0.3),
                                                    ),
                                                  ),
                                                ),
                                                Positioned( //중앙 원
                                                  left: gpsToPixel.dx * scale_offset,
                                                  top: gpsToPixel.dy * scale_offset,
                                                  child: Container(
                                                    width: 10 * 1.3 / _scale,
                                                    height: 10 * 1.3 / _scale,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.white, width: 1.5 * 1.3 / _scale),
                                                      color: Colors.red,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                  ),
                                  IgnorePointer(
                                    ignoring: true,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1294 * scale_offset - 50 / _scale,
                                          top: 3084 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "과학관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1464 * scale_offset - 50 / _scale,
                                          top: 2472 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "다향관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1572 * scale_offset - 50 / _scale,
                                          top: 3436 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "대운동장",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1125 * scale_offset - 50 / _scale,
                                          top: 2085 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "만해광장",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1318 * scale_offset - 50 / _scale,
                                          top: 2907 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "명진관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 2430 * scale_offset - 50 / _scale,
                                          top: 2836 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "문화관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1660 * scale_offset - 50 / _scale,
                                          top: 2745 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "법학관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1639 * scale_offset - 50 / _scale,
                                          top: 2958 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "만해관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1153 * scale_offset - 50 / _scale,
                                          top: 2540 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "본관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 2249 * scale_offset - 50 / _scale,
                                          top: 2954 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "사회과학관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 2361 * scale_offset - 50 / _scale,
                                          top: 3204 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "경영관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1182 * scale_offset - 50 / _scale,
                                          top: 3220 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "상록원",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 716 * scale_offset - 50 / _scale,
                                          top: 2665 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "신공학관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 865 * scale_offset - 50 / _scale,
                                          top: 2300 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "원흥관1",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 947 * scale_offset - 50 / _scale,
                                          top: 2515 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "원흥관2",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 835 * scale_offset - 50 / _scale,
                                          top: 2061 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "정보문화관P",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 739 * scale_offset - 50 / _scale,
                                          top: 1935 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "정보문화관Q",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1747 * scale_offset - 50 / _scale,
                                          top: 3013 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "정각원",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1013 * scale_offset - 50 / _scale,
                                          top: 2778 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "중앙도서관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1431 * scale_offset - 50 / _scale,
                                          top: 1961 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "체육관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1263 * scale_offset - 50 / _scale,
                                          top: 1765 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "학림관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 740 * scale_offset - 50 / _scale,
                                          top: 1844 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "학생회관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 2597 * scale_offset - 50 / _scale,
                                          top: 2741 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "학술관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1983 * scale_offset - 50 / _scale,
                                          top: 2912 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "혜화관",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 2371 * scale_offset - 50 / _scale,
                                          top: 3391 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "정문",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 1120 * scale_offset - 50 / _scale,
                                          top: 1544 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "후문",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 100 / _scale,
                                          height: 40 / _scale,
                                          left: 2550 * scale_offset - 50 / _scale,
                                          top: 2455 * scale_offset - 20 / _scale,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "혜화문",
                                                style: TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 7 / _scale,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              //---------------------------------------------------------------
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
                                  if (result['selectOption'] != Null) {
                                    setState(() { //아예
                                      selectOption = result['selectOption'];
                                    });
                                    testVar = true;
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
                                      fontFamily: 'Paybooc',
                                      fontWeight: FontWeight.w400,
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
                                //이곳에서 search_screen.dart에서 돌린 알고리즘의 결과 필요한 정보들을 더 받아오면 됨
                                if (result['selectOption'] != Null) {
                                  setState(() { //아예
                                    selectOption = result['selectOption'];
                                    ColorPath();
                                    print("startPointsGreen: $startPointsGreen");
                                  });
                                  testVar = true;
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
                                      fontFamily: 'Paybooc',
                                      fontWeight: FontWeight.w700,
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
                                  fontFamily: 'Paybooc',
                                  fontWeight: FontWeight.w700,
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
                                  fontFamily: 'Paybooc',
                                  fontWeight: FontWeight.w700,
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
                                  fontFamily: 'Paybooc',
                                  fontWeight: FontWeight.w700,
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
                                  fontFamily: 'Paybooc',
                                  fontWeight: FontWeight.w700,
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
                                  fontFamily: 'Paybooc',
                                  fontWeight: FontWeight.w700,
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
                                  fontFamily: 'Paybooc',
                                  fontWeight: FontWeight.w700,
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
                              bmPath = 'assets/images/floor/법학관_만해관_1F.png';
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
                              bmPath = 'assets/images/법학관_만해관(1528,2563).png';
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
                              whPath = 'assets/images/floor/원흥4.png';
                              nowFloor = 4;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('4F'),
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
                              iqPath = 'assets/images/floor/정q_3F.png';
                              nowFloor = 3;
                              floorButtonPath(nowFloor, _showButton);
                            });
                          },
                          child: Text('3F'),
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
                              hlPath = 'assets/images/floor/학림_1F.png';
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
/*          Positioned(
            bottom: 50,
            left: 50,
            child: Container(
              child: Text(
                '값넘기기실험중 $_startNodeName and $_endNodeName',
              ),
            ),
          ),*/
          testVar
              ? Positioned(
                  bottom: 100,
                  right: 50,
                  child: isMenuOpen
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isMenuOpen = !isMenuOpen;
                            });
                          },
                          child: Text("Close"),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isMenuOpen = !isMenuOpen;
                            });
                          },
                          child: Text("Open"),
                        ),
                )
              : Text("hi"),
          testVar
              ? Positioned(
                  bottom: 50,
                  right: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        erase();
                        testVar = false;
                        isMenuOpen = false;
                      });
                    },
                    child: Text("erase"),
                  ),
                )
              : Text("hi"),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            transform: Matrix4.translationValues(isMenuOpen ? 0 : -300, 0, 0),
            child: Container(
              width: 200,
              height: double.infinity,
              color: Colors.white,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print("${items[index]}");
                      Navigator.pushNamed(
                        context,
                        '/detail'
                      );
                    },
                    child: ListTile(
                      title: Text(items[index],
                        style: TextStyle(
                          fontFamily: 'Paybooc',
                          fontWeight: FontWeight.w400,
                        ),),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: toggleLocationTracking,
              child: Icon(isTrackingLocation ? Icons.location_off : Icons.location_on),
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}