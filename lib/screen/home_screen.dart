import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Dubeogi/component/appbar.dart';
import 'package:Dubeogi/algorithm/astar.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '동국대학교',
      ),
      body: ImageDrawing(),
    );
  }
}

class ImageDrawing extends StatefulWidget {
  @override
  _ImageDrawingState createState() => _ImageDrawingState();
}

class _ImageDrawingState extends State<ImageDrawing> {
  late ImageInfo _imageInfo;
  bool _imageLoaded = false;
  late double _imageWidth;
  late double _imageHeight;
  late double scale_offset;
  List<Offset> startPoints = [];
  List<Offset> endPoints = [];

  @override
  void initState() {
    super.initState();
    _getImageInfo();
    Graph graph = Graph();

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

    String startNodeName = "명진관";
    String endNodeName = "학술관";

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

    print('Initial _position: $_position');
  }

  Future<void> _getImageInfo() async {
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

  double _scale = 4.0;
  double _previousScale = 1.0;
  Offset _position = Offset.zero;
  Offset _previousPosition = Offset.zero;

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      onScaleEnd: _onScaleEnd,
      child: Stack(
        children: [
          Scaffold(
            body: Center(
              child: !_imageLoaded
                  ? Text('지도를 불러오는 중')
                  : Transform.scale(
                      scale: _scale,
                      child: Transform.translate(
                        offset: _position.scale(scale_offset, scale_offset),
                        child: ClipRect(
                          child: CustomPaint(
                            size: Size(_imageWidth, _imageHeight),
                            foregroundPainter:
                                LinePainter(_imageInfo, startPoints, endPoints),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          width: 200.0,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.7),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              hintText: '출발지를 입력하세요',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          '샤워실',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          '편의점',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
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
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          '미정',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          '미정',
                          style: TextStyle(
                            color: Colors.blue,
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
    );
  }
}

class LinePainter extends CustomPainter {
  final ImageInfo imageInfo;
  final List<Offset> startPoints;
  final List<Offset> endPoints;

  LinePainter(this.imageInfo, this.startPoints, this.endPoints);

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / imageInfo.image.width;
    final scaleY = size.height / imageInfo.image.height;
    print(
        'size.width: ${size.width}, imageInfo.image.width: ${imageInfo.image.width}');
    print(
        'size.height: ${size.height}, imageInfo.image.height: ${imageInfo.image.height}');

    print('scaleX: $scaleX, scaleY: $scaleY');

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < startPoints.length; i++) {
      canvas.drawLine(
        startPoints[i].scale(scaleX, scaleY),
        endPoints[i].scale(scaleX, scaleY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
