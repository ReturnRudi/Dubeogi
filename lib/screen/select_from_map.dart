import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

late double scale_offset;

class SelectFromMap extends StatefulWidget {
  final bool destination; //false 출발지, true 도착지

  SelectFromMap({required this.destination});

  @override
  State<SelectFromMap> createState() => _SelectFromMapState();
}

class _SelectFromMapState extends State<SelectFromMap> {
  late ImageInfo _imageInfo_du;
  bool _imageLoaded_du = false;
  late double _imageWidth_du;
  late double _imageHeight_du;
  double _scale = 6.0;
  double _previousScale = 6.0;
  Offset _position = Offset(101, 39);
  Offset _previousPosition = Offset(101, 39);
  double now_w = 0.0;
  double now_g = 0.0;
  Offset gpsToPixel = Offset.zero;

  Offset gps(double w, double g) {
    double pixel_x = 3000 * (g - 126.9962082464593) / (127.0046597158073 - 126.9962082464593);
    double pixel_y = 5333 * (37.56424922299378 - w) / (37.56424922299378 - 37.552279443944855);

    return Offset(pixel_x - 30, pixel_y - 15);  //왼쪽 위 오른 쪽 아래 보면서 오차 수정 필요
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

  Future<void> getCurrentLocation() async {
    try {
      await requestLocationPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      Offset newGpsToPixel = gps(position.latitude, position.longitude);

      setState(() {
        now_w = position.latitude;
        now_g = position.longitude;
        gpsToPixel = newGpsToPixel;
        _position = gpsToPixel;
      });
    } catch (e) {
      print(e);
    }
  }


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
      _scale = (_previousScale * details.scale).clamp(3.0, 8.0);
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
      print('position: $_position');
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


      _position = Offset(
        _position.dx.clamp(minX, maxX),
        _position.dy.clamp(minY, maxY),
      );
    });
  }

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
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('지도에서 찾기',
          style: TextStyle(
            fontFamily: 'Paybooc',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onScaleStart: _onScaleStart,
            onScaleUpdate: _onScaleUpdate,
            onScaleEnd: _onScaleEnd,
            child: Scaffold(
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
                              Image.asset(
                                'assets/images/du.png',
                                fit: BoxFit.cover,
                              ),
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
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: Offset(0, -15),
                        child: Image.asset(
                          'assets/images/marker.png',
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.orange, // Change the color to white or any other color
            width: double.infinity,
            child: Text(
              '지도를 움직여 학교 내의 원하는 길 위로 마커를 옮기세요',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white, // Change the text color to black or any other color
                fontFamily: 'Paybooc',
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            right: 20,
            bottom: 80,
            child: FloatingActionButton(
              onPressed: (){
                getCurrentLocation();
                print("gpsToPixel: $gpsToPixel");
                setState(() {
                  _position = gpsToPixel.scale(scale_offset, scale_offset);
                  print("_position: $_position");
                });
              },
              child: Icon(Icons.location_on),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _position = Offset(_position.dx, _position.dy - 30);
          Navigator.pop(context, _position);
        },
        label: Text(
          widget.destination ? '도착지로' : '출발지로',
          style: TextStyle(
            fontFamily: 'Paybooc',
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}