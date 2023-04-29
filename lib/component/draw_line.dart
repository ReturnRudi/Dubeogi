import 'package:flutter/material.dart';
import 'package:Dubeogi/algorithm/astar.dart';

class LinePainter extends CustomPainter { // 지도에 선을 그리는 클래스
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

List<Node> reconstructPath(
    List<int> prev,
    List<Node> nodes,
    int startIndex,
    int endIndex,
    ) {
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
