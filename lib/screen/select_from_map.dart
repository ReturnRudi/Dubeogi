import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:Dubeogi/components/buildingname_positioned_list.dart';
import 'package:Dubeogi/save/custom_text.dart';

class SelectFromMap extends StatefulWidget {
  final bool destination; //false 출발지, true 도착지

  const SelectFromMap({super.key, required this.destination});

  @override
  State<SelectFromMap> createState() => _SelectFromMapState();
}

class _SelectFromMapState extends State<SelectFromMap> {
  late double deviceWidth = MediaQuery.of(context).size.width;
  late double deviceHeight = MediaQuery.of(context).size.height;
  late double devicePaddingTop = MediaQuery.of(context).padding.top;
  late double scr_img_diff;
  late double scale_offset;

  late ImageInfo _imageInfo_du;
  late double _imageWidth_du;
  late double _imageHeight_du;

  bool _imageLoaded_du = false;
  double _scale = 6.0;
  double _previousScale = 6.0;
  Offset _position = const Offset(101, 39);
  Offset _previousPosition = const Offset(101, 39);
  double now_w = 0.0;
  double now_g = 0.0;
  Offset nowLocationPixel = Offset.zero;

  late List<Widget> buildingNames;

  Offset gps(double w, double g) {
    double pixelX = 3000 *
        (g - 126.9962082464593) /
        (127.0046597158073 - 126.9962082464593);
    double pixelY = 5333 *
        (37.56424922299378 - w) /
        (37.56424922299378 - 37.552279443944855);

    return Offset(pixelX - 30, pixelY - 15); //왼쪽 위 오른 쪽 아래 보면서 오차 수정 필요
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
/*      status = await Permission.location.request();
      if (!status.isGranted) {
        return Future.error('Location permission not granted');
      }*/
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      await requestLocationPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        now_w = position.latitude;
        now_g = position.longitude;
        nowLocationPixel = gps(position.latitude, position.longitude);
        _position = Offset(1500 - nowLocationPixel.dx, 5333 / 2 - nowLocationPixel.dy);
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
    const AssetImage('assets/images/du.png').resolve(const ImageConfiguration());
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
/*  void _getImageInfo() {
    Image image = Image.asset('assets/images/du.png');
    Completer<ImageInfo> completer = Completer<ImageInfo>();

    image.image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((ImageInfo info, bool _) {
      _imageInfo_du = info;
      _imageLoaded_du = true;
      _imageWidth_du = info.image.width.toDouble();
      _imageHeight_du = info.image.height.toDouble();
      scale_offset = deviceWidth / _imageWidth_du;
      scr_img_diff = deviceHeight / scale_offset - _imageHeight_du;

      setState(() {});
      completer.complete(info);
    }));
  }*/

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
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          ),
        ),
      );
    }
    buildingNames = buildingnamePositionedList(
      scale: _scale,
      scale_offset: scale_offset,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: CustomText(
          text: '지도에서 찾기',
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
          color: Colors.white,
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
                              ...buildingNames,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: const Offset(0, -15),
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
            padding: const EdgeInsets.all(10.0),
            color: Colors.orange,
            // Change the color to white or any other color
            width: double.infinity,
            height: 40.0,
            child: Center(
              child: CustomText(
                text: '지도를 움직여 학교 내의 원하는 길 위로 마커를 옮기세요',
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 80,
            child: FloatingActionButton(
              onPressed: () {
                getCurrentLocation();
                print("gpsToPixel: $nowLocationPixel");
              },
              backgroundColor: Colors.orange,
              child: const Icon(Icons.location_on,
                color: Colors.white,),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _position = Offset(_position.dx, _position.dy - 30);
          Navigator.pop(context, _position);
        },
        label: CustomText(
          text: widget.destination ? '도착지로' : '출발지로',
          fontWeight: FontWeight.w800,
          color: Colors.white,
          fontSize: 14.0,
        ),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
