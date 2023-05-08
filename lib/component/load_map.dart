import 'dart:async';
import 'package:Dubeogi/algorithm/astar.dart';
import 'package:Dubeogi/component/draw_line.dart';
import 'package:flutter/material.dart';

class ImageDrawing extends StatefulWidget {
  // 지도 화면 불러오는 클래스
  const ImageDrawing({
    Key? key,
  }) : super(key: key);

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

  double _scale = 4.0;
  double _previousScale = 1.0;
  Offset _position = Offset.zero;
  Offset _previousPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _getImageInfo();
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
      child: Scaffold(
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
    );
  }
}
