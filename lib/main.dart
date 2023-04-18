import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
          home: ImageDrawing()));
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
  List<Offset> startPoints = [Offset(7417, 5871), Offset(7037, 6249), Offset(6837, 6809), Offset(6523, 6737), Offset(6439, 6773), Offset(6383, 6863), Offset(6201, 6795)];
  List<Offset> endPoints = [Offset(7037, 6249), Offset(6837, 6809), Offset(6523, 6737), Offset(6439, 6773), Offset(6383, 6863), Offset(6201, 6795), Offset(6165, 6681)];

  @override
  void initState() {
    super.initState();
    _getImageInfo();

    // 프로그램이 실행될 때의 _position 값을 출력합니다.
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

  double _scale = 1.0;
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
      _scale = (_previousScale * details.scale).clamp(1.0, double.infinity);

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
