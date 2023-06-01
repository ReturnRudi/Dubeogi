import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sidebarx/sidebarx.dart';

import 'package:Dubeogi/components/building_positioned_list.dart';
import 'package:Dubeogi/components/buildingname_positioned_list.dart';
import 'package:Dubeogi/components/detail_list.dart';
import 'package:Dubeogi/components/end_alert.dart';
import 'package:Dubeogi/components/facility_button.dart';
import 'package:Dubeogi/components/facility_offsets.dart';
import 'package:Dubeogi/components/floor_view.dart';
import 'package:Dubeogi/components/linepainter.dart';

import 'package:Dubeogi/provider/algo_value.dart';
import 'package:Dubeogi/save/save.dart';
import 'package:Dubeogi/save/custom_text.dart';

import 'package:Dubeogi/screen/building_info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // map load
  late ImageInfo _imageInfo_du;
  bool _imageLoaded_du = false;

  // 지도 확대축소
  double _scale = 1.3;
  double _previousScale = 1.0;
  Offset _position = Offset.zero;
  Offset _previousPosition = Offset.zero;
  late double _imageWidth_du;
  late double _imageHeight_du;
  late double scale_offset;

  // 건물 및 편의시설 관련
  int nowFloor = 0;
  late List<Widget> buildingPositions;
  late List<Widget> buildingNames;
  late List<Widget> vendings;
  late List<Widget> showers;
  late List<Widget> stores;
  late List<Widget> printers;
  late List<Widget> atms;
  late List<Widget> lounges;

  String _showButton = "기본";
  bool _vendingvisibility = false;
  bool _showervisibility = false;
  bool _storevisibility = false;
  bool _atmvisibility = false;
  bool _loungevisibility = false;
  bool _printervisibility = false;

  // drawer

  // gps
  double now_w = 0.0;
  double now_g = 0.0;
  bool isTrackingLocation = false;
  StreamSubscription<Position>? positionStream;
  Offset gpsToPixel = Offset.zero;

  // .
  dynamic result;
  late AlgoValue algovalue;

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

  // ================================================
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

  // ================================================
  void _vendingshow() {
    setState(() {
      _vendingvisibility = !_vendingvisibility;
      print('check: vendingvisibility: ${_vendingvisibility}');
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
    String name = "기본";
    setState(() {
      _showButton != touchedBuilding
          ? _showButton = touchedBuilding
          : _showButton = name;
    });
    print('check: showButton: ${_showButton}');
  }

  void gotoBuildingInfo({required String buildingname}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BuildingInfoScreen(
          title: buildingname,
        ),
      ),
    );
  }

  // ================================================
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getImageInfo();
  }

  @override
  void dispose() {
    positionStream
        ?.cancel(); // Don't forget to cancel the stream when disposing
    super.dispose();
  }

  // ====================================================
  Offset gps(double w, double g) {
    double pixel_x = 3000 *
        (g - 126.9962082464593) /
        (127.0046597158073 - 126.9962082464593);
    double pixel_y = 5333 *
        (37.56424922299378 - w) /
        (37.56424922299378 - 37.552279443944855);

    return Offset(pixel_x - 12, pixel_y - 5); //왼쪽 위 오른 쪽 아래 보면서 오차 수정 필요
  }

  Future<void> requestLocationPermission() async {
    print('check: requestLocationPermission();');
    var status = await Permission.location.request();
    if (!status.isGranted) {
      //status = await Permission.location.request();
      //if (!status.isGranted) {
      //return Future.error('Location permission not granted');
      //}
      print('check: GPS permission failed.');
    }
  }

  void startLocationStream() async {
    print('check: startLocationStream();');
    await requestLocationPermission();
    positionStream = Geolocator.getPositionStream(
            desiredAccuracy: LocationAccuracy.high,
            //distanceFilter: 1
            intervalDuration: Duration(milliseconds: 1000))
        .listen((Position position) {
      setState(() {
        now_w = position.latitude;
        now_g = position.longitude;
        gpsToPixel = gps(now_w, now_g);
        //print("gpsToPixel: $gpsToPixel");
      });
    });
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

  // ====================================================

  Future<bool> _onBackPressed() async {
    bool? confirmExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("앱 종료?"),
        content: Text("진짜로?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('확인'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('취소'),
          ),
        ],
      ),
    );
    return confirmExit ?? false;
  }

  bool _isInitialized = false;
  final _controller = SidebarXController(selectedIndex: 0);

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

    algovalue = Provider.of<AlgoValue>(context, listen: true);
    buildingPositions = buildingPositionedList(
        scale_offset: scale_offset, showFloorButton: _showFloorButton);
    vendings = vendingPositionedList(scale_offset: scale_offset);
    showers = showerPositionedList(scale_offset: scale_offset);
    stores = storePositionedList(scale_offset: scale_offset);
    printers = printerPositionedList(scale_offset: scale_offset);
    atms = atmPositionedList(scale_offset: scale_offset);
    lounges = loungePositionedList(scale_offset: scale_offset);
    buildingNames = buildingnamePositionedList(
      scale: _scale,
      scale_offset: scale_offset,
    );
    if (_isInitialized == false) {
      algovalue.initialize();
      _isInitialized = true;
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              GestureDetector(
                onScaleStart: _onScaleStart,
                onScaleUpdate: _onScaleUpdate,
                onScaleEnd: _onScaleEnd,
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
                                  startPointsRed: algovalue.startPointsRed,
                                  // 빈 리스트 전달
                                  endPointsRed: algovalue.endPointsRed,
                                  // 빈 리스트 전달
                                  startPointsGreen: algovalue.startPointsGreen,
                                  // 초록색 선의 점들 전달
                                  endPointsGreen: algovalue.endPointsGreen,
                                  // 초록색 선의 점들 전달
                                  startPointsBlue: algovalue.startPointsBlue,
                                  // 빈 리스트 전달
                                  endPointsBlue:
                                      algovalue.endPointsBlue, // 빈 리스트 전달
                                ),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/du.png',
                                      fit: BoxFit.cover,
                                    ),
                                    ...buildingPositions,
                                    if (_vendingvisibility) ...vendings,
                                    if (_showervisibility) ...showers,
                                    if (_storevisibility) ...stores,
                                    if (_printervisibility) ...printers,
                                    if (_atmvisibility) ...atms,
                                    if (_loungevisibility) ...lounges,
                                  ],
                                ),
                              ),
                              IgnorePointer(
                                ignoring: true,
                                child: Stack(
                                  children: [
                                    ...buildingNames,
                                  ],
                                ),
                              ),
                              if (isTrackingLocation)
                                Stack(
                                  children: [
                                    Positioned(
                                      // 투명 큰 원
                                      left: (gpsToPixel.dx * scale_offset) -
                                          4 * 1.3 / _scale,
                                      top: (gpsToPixel.dy * scale_offset) -
                                          4 * 1.3 / _scale,
                                      child: Container(
                                        width: 18 * 1.3 / _scale,
                                        height: 18 * 1.3 / _scale,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.orange.withOpacity(0.3),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      //중앙 원
                                      left: gpsToPixel.dx * scale_offset,
                                      top: gpsToPixel.dy * scale_offset,
                                      child: Container(
                                        width: 10 * 1.3 / _scale,
                                        height: 10 * 1.3 / _scale,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white,
                                              width: 1.5 * 1.3 / _scale),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // 검색하고 싶은 건물 입력
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/find');
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
                                      child: CustomText(
                                        text: '검색하고 싶은 건물을 입력하세요.',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // 길찾기 버튼
                              Container(
                                height: 43.0,
                                width: 60.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    algovalue.isFind = false;
                                    Navigator.pushNamed(
                                      context,
                                      '/search',
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.search,
                                      ),
                                      CustomText(
                                        text: '길찾기',
                                        fontSize: 8.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // 자판기 샤워실 편의점 ...
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                FacilityButton(
                                  text: '자판기',
                                  textColor: Colors.blue,
                                  onPressed: _vendingshow,
                                  onoff: _vendingvisibility,
                                ),
                                SizedBox(width: 10),
                                FacilityButton(
                                  text: '샤워실',
                                  textColor: Colors.lightBlueAccent,
                                  onPressed: _showershow,
                                  onoff: _showervisibility,
                                ),
                                SizedBox(width: 10),
                                FacilityButton(
                                  text: '편의점',
                                  textColor: Colors.purple,
                                  onPressed: _storeshow,
                                  onoff: _storevisibility,
                                ),
                                SizedBox(width: 10),
                                FacilityButton(
                                  text: '프린터',
                                  textColor: Colors.green,
                                  onPressed: _printershow,
                                  onoff: _printervisibility,
                                ),
                                SizedBox(width: 10),
                                FacilityButton(
                                  text: '라운지',
                                  textColor: Colors.brown,
                                  onPressed: _loungeshow,
                                  onoff: _loungevisibility,
                                ),
                                SizedBox(width: 10),
                                FacilityButton(
                                  text: 'ATM',
                                  textColor: Colors.red,
                                  onPressed: _atmshow,
                                  onoff: _atmvisibility,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: algovalue.isRequired
                                ? ExampleSidebarX(controller: _controller)
                                : Text(""),
                          )
                        ],
                      ),
                    ),
                    if (_showButton != "기본")
                      FloorView(
                        showbutton: _showButton,
                        onValueChanged: (String strValue, int intValue) {
                          setState(() {
                            FloorData[_showButton] = intValue;
                            if (strValue == "시설") {
                              gotoBuildingInfo(
                                buildingname: _showButton,
                              );
                            } else {
                              LookData[_showButton] = strValue;
                              algovalue.colorPath();
                              for (String key in FloorData.keys) {
                                if (FloorData[key] != 0)
                                  algovalue.floorButtonPath(
                                      FloorData[key]!, key);
                              }
                            }
                            if (intValue == 0) {
                              _showButton = "기본";
                            }
                            //algovalue.floorButtonPath(intValue, _showButton);
                          });
                        },
                      ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                  onPressed: toggleLocationTracking,
                  child: Icon(isTrackingLocation
                      ? Icons.location_off
                      : Icons.location_on),
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  late AlgoValue algovalue;

  ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  void endGuide(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return EndAlert(
            title: '종료?',
            message: '진짜로?',
            onOption1Pressed: () {
              algovalue.erase();
              algovalue.isRequired = false;
              Navigator.pop(context);
            },
            onOption2Pressed: () {
              Navigator.pop(context);
            },
          );
        });
  }


  List<SidebarXItem> makelist() {
    IconData? icon;
    double angle = 0.0;
    List<SidebarXItem> items = [];
    for (int i = 0; i < algovalue.homeResult.length; i++) {
      if (algovalue.homeDirection[i].contains("크게 왼쪽")) {
        icon = Icons.arrow_back;
      } else if (algovalue.homeDirection[i].contains("크게 오른쪽")) {
        icon = Icons.arrow_forward;
      } else if (algovalue.homeDirection[i].contains("왼쪽")) {
        icon = Icons.arrow_back;
        angle = pi / 4;
      } else if (algovalue.homeDirection[i].contains("오른쪽")) {
        icon = Icons.arrow_forward;
        angle = -pi / 4;
      } else if (algovalue.homeDirection[i].contains("출발지") ||
          algovalue.homeDirection[i].contains("목적지")) {
        icon = Icons.place;
        angle = 0.0;
      } else {
        icon = Icons.arrow_upward_rounded;
      }
      items.add(
        SidebarXItem(
          iconWidget: Transform.rotate(
            angle: angle,
            child: Icon(
              icon,
              color: Colors.blue,
            ),
          ),
          label: algovalue.homeResult[i].name,
          onTap: () {},
        ),
      );
    }
    return items;
  }

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    algovalue = Provider.of<AlgoValue>(context, listen: true);
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        //margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: Colors.black,
        textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue.withOpacity(0.6).withOpacity(0.37),
          ),
          /*gradient: const LinearGradient(
            colors: [Color(0xFF3E3E61), Color(0xFF2E2E48)],
          ),*/
          color: Colors.pink,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.blue.withOpacity(0.8),
          size: 24,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 24,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
        );
        /*SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('${algovalue.startNodeName} to ${algovalue.endNodeName}'),
          ),
        );*/
      },
      items: [
        ...makelist(),
      ],
      footerBuilder: (context, extended) {
        return ElevatedButton(
          onPressed: () => endGuide(context),
          child: CustomText(
            text: '안내종료',
            fontWeight: FontWeight.w700,
            fontSize: 11.0,
            color: Colors.white,
          ),
        );
      },
    );
  }
}

final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);







