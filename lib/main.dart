import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tuple/tuple.dart';
import 'package:collection/collection.dart';

class Node {
  final String name;
  final double x, y;

  Node(this.name, this.x, this.y);

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Node && other.name == name && other.x == x && other.y == y;
  }

  @override
  int get hashCode => name.hashCode ^ x.hashCode ^ y.hashCode;
}

class Edge {
  Node node1, node2;
  int weight;
  String type;
  String edgeAttribute;

  Edge(this.node1, this.node2, this.weight, this.type, this.edgeAttribute);
}

class Graph {
  List<Node> nodes = [];
  List<Edge> edges = [];

  void addNode(String name, double x, double y) {
    nodes.add(Node(name, x, y));
  }

  Node findNode(String name) {
    return nodes.firstWhere((node) => node.name == name, orElse: () => throw Exception("Node not found"));
  }

  void addEdge(String node1Name, double node1X, double node1Y, String node2Name, double node2X, double node2Y, int weight, String type, String edgeAttribute) {
    if (!nodeExists(node1Name)) {
      addNode(node1Name, node1X, node1Y);
    }
    if (!nodeExists(node2Name)) {
      addNode(node2Name, node2X, node2Y);
    }
    Node node1 = findNode(node1Name);
    Node node2 = findNode(node2Name);
    edges.add(Edge(node1, node2, weight, type, edgeAttribute));
  }

  int findNodeIndex(List<Node> nodes, String targetNodeName) {
    for (int i = 0; i < nodes.length; ++i) {
      if (nodes[i].name == targetNodeName) {
        return i;
      }
    }
    return -1;
  }

  Graph excludeEdgesByType(String type) {
    Graph newGraph = Graph();
    newGraph.nodes = List.from(nodes);

    for (final edge in edges) {
      if (edge.type != type) {
        newGraph.edges.add(edge);
      }
    }

    return newGraph;
  }

  Graph filterEdges(String requiredAttribute) {
    Graph newGraph = Graph();
    newGraph.nodes = List.from(nodes);

    for (final edge in edges) {
      if (edge.edgeAttribute == requiredAttribute) {
        newGraph.edges.add(edge);
      }
    }

    return newGraph;
  }

  bool nodeExists(String name) {
    return nodes.any((node) => node.name == name);
  }

  // A* algorithm
  Tuple2<List<int>, List<int>> aStar(List<Node> nodes, List<Edge> edges, Node start, Node end) {
    int startIndex = findNodeIndex(nodes, start.name);
    int endIndex = findNodeIndex(nodes, end.name);

    List<int> dist = List<int>.filled(nodes.length, 1 << 32);
    List<int> prev = List<int>.filled(nodes.length, -1);

    dist[startIndex] = 0;

    PriorityQueue<Tuple2<int, int>> pq = PriorityQueue<Tuple2<int, int>>(
          (a, b) => a.item1.compareTo(b.item1),
    );

    pq.add(Tuple2<int, int>(0, startIndex));

    while (pq.isNotEmpty) {
      Tuple2<int, int> currentPair = pq.removeFirst();
      int currentDist = currentPair.item1;
      int currentNode = currentPair.item2;

      if (currentNode == endIndex) {
        break;
      }

      if (currentDist > dist[currentNode]) {
        continue;
      }

      for (Edge edge in edges) {
        if (edge.node1.name == nodes[currentNode].name || edge.node2.name == nodes[currentNode].name) {
          int nextNode;
          if (edge.node1.name == nodes[currentNode].name) {
            nextNode = findNodeIndex(nodes, edge.node2.name);
          } else { // This should be an else block, not an if block
            nextNode = findNodeIndex(nodes, edge.node1.name);
          }

          int candidateDist = dist[currentNode] + edge.weight;

          if (candidateDist < dist[nextNode]) {
            dist[nextNode] = candidateDist;
            prev[nextNode] = currentNode;
            pq.add(Tuple2<int, int>(candidateDist, nextNode));
          }
        }
      }
    }

    return Tuple2<List<int>, List<int>>(dist, prev);
  }
}

List<Node> reconstructPath(List<int> prev, List<Node> nodes, int startIndex, int endIndex) {
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


void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange, // 앱바 색상 설정
          centerTitle: true, // 제목을 가운데 정렬하기 위해 설정
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center, // 로고와 텍스트를 가운데 정렬하기 위해 설정
            children: [
              Image.asset(
                'assets/images/dgulogo.png',
                height: 32, // 로고 이미지 높이 설정
                width: 32, // 로고 이미지 너비 설정
              ),
              const SizedBox(width: 8), // 로고와 텍스트 사이 간격 조정
              Text(
                '동국대학교 길찾기',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),

        body: ImageDrawing(),
      )));
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
    var regularResult = graph.aStar(graph.nodes, graph.edges, startNode, endNode);
    List<int> regularDist = regularResult.item1;
    List<int> regularPrev = regularResult.item2;

    List<Node> startNodePoints = [];
    List<Node> endNodePoints = [];
    List<Node> regularPath = reconstructPath(regularPrev, graph.nodes, startIndex, endIndex);

    print("Regular path from $startNode to $endNode:");
    for (int i = 0; i < regularPath.length; i++) {
      if (i == 0)
        startNodePoints.add(regularPath[i]);
      else if(i == regularPath.length - 1)
        endNodePoints.add(regularPath[i]);
      else {
        endNodePoints.add(regularPath[i]);
        startNodePoints.add(regularPath[i]);
      }
    }

    for (int i = 0; i < startNodePoints.length; i++) {
      print("(${startNodePoints[i].x}, ${startNodePoints[i].y}) -> (${endNodePoints[i].x}, ${endNodePoints[i].y})");
    }

    for (int i = 0; i < startNodePoints.length; i++){
      startPoints.add(Offset(startNodePoints[i].x, startNodePoints[i].y));
      endPoints.add(Offset(endNodePoints[i].x, endNodePoints[i].y));
    }


    for (Node node in regularPath) {
      print("$node -> ");
    }
    print("END\n\n");

    print("Total distance: ${regularDist[endIndex]}");

    // 프로그램이 실행될 때의 _position 값을 출력합니다.

    for (int i = 0; i < startNodePoints.length; i++){
      print('startPoints: $startPoints');
      print('endPoints: $endPoints');
    }

    print('Initial _position: $_position');
  }

  Future<void> _getImageInfo() async {
    final Completer<ImageInfo> completer = Completer();
    final ImageStream stream = AssetImage('assets/images/du.png').resolve(ImageConfiguration());
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

      _position += (details.focalPoint - _previousPosition) / _previousScale / scale_offset;
      //_previousScale로 나누어 줘서 scale이 변해도 _position의 이동 속도를 기존과 같게 유지한다.

      _previousPosition = details.focalPoint;
    });
  }

  void _onScaleEnd(ScaleEndDetails details) {
    setState(() {
      // 화면 크기를 얻습니다.
      print('position: $_position');
      final ratio = MediaQuery.of(context).size.height / MediaQuery.of(context).size.width;
      final screenWidth = _imageWidth / _scale; //화면에서 보여지는 너비의 물리적 픽셀값
      final screenHeight = screenWidth * ratio; //화면에서 보여지는 높이의 물리적 픽셀값
      
      double minY, maxY;
      
      // 이미지의 최소 및 최대 제한 값을 계산합니다.
      double minX = -_imageWidth / 2 + screenWidth / 2;
      double maxX = _imageWidth / 2 - screenWidth / 2;
      
      // 위 아래 여백이 생기는 경우 minY, maxY의 크기가 역전되지 않도록 if문 추가
      if(_imageHeight > screenHeight){
        minY = -_imageHeight / 2 + screenHeight / 2;
        maxY = _imageHeight / 2 - screenHeight / 2;
      }
      else{
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
    return Scaffold(
      body: Center(
        child: !_imageLoaded
            ? Text('지도를 불러오는 중')
            : GestureDetector(
          onScaleStart: _onScaleStart,
          onScaleUpdate: _onScaleUpdate,
          onScaleEnd: _onScaleEnd,
          child: Transform.scale(
            scale: _scale,
            child: Transform.translate(
              offset: _position.scale(scale_offset, scale_offset),
              child: ClipRect(
                child: CustomPaint(
                  size: Size(_imageWidth, _imageHeight),
                  foregroundPainter: LinePainter(
                      _imageInfo, startPoints, endPoints),
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
    print('size.width: ${size.width}, imageInfo.image.width: ${imageInfo.image.width}');
    print('size.height: ${size.height}, imageInfo.image.height: ${imageInfo.image.height}');

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
