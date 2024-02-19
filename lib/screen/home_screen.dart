import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sidebarx/sidebarx.dart';

import 'package:Dubeogi/components/building_positioned_list.dart';
import 'package:Dubeogi/components/buildingname_positioned_list.dart';
import 'package:Dubeogi/components/facility_button.dart';
import 'package:Dubeogi/components/facility_offsets.dart';
import 'package:Dubeogi/components/floor_view.dart';
import 'package:Dubeogi/components/end_alert.dart';
import 'package:Dubeogi/components/home_sidebarx.dart';
import 'package:Dubeogi/components/linepainter.dart';
import 'package:Dubeogi/provider/algo_value.dart';
import 'package:Dubeogi/provider/map_value.dart';
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
  // 사용자 디바이스의 정보를 저장하는 변수들
  late double deviceWidth = MediaQuery.of(context).size.width;
  late double deviceHeight = MediaQuery.of(context).size.height;
  late double devicePaddingTop = MediaQuery.of(context).padding.top;

  // _getImageInfo함수를 통해 초기화되는 변수들
  late ImageInfo _imageInfo_du;
  late double _imageWidth_du;
  late double _imageHeight_du;
  late double scale_offset;
  late double scr_img_diff;
  bool _imageLoaded_du = false;


  // 건물 및 편의시설 관련
  int nowFloor = 0;
  String _showButton = "기본";
  late List<Widget> buildingPositions;
  late List<Widget> buildingNames;
  late List<Widget> vendings;
  late List<Widget> showers;
  late List<Widget> stores;
  late List<Widget> printers;
  late List<Widget> atms;
  late List<Widget> lounges;
  bool _vendingvisibility = false;
  bool _showervisibility = false;
  bool _storevisibility = false;
  bool _atmvisibility = false;
  bool _loungevisibility = false;
  bool _printervisibility = false;

  // gps 관련 변수들
  late double now_w;
  late double now_g;
  bool isTrackingLocation = false;
  StreamSubscription<Position>? positionStream;
  Offset nowLocationPixel = Offset.zero;

  // provider
  late AlgoValue algovalue;
  late MapValue mapvalue;

/*  // 비동기
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
      _imageHeight_du =  _imageInfo_du.image.height.toDouble();
      scale_offset = deviceWidth / _imageWidth_du;
    });
    stream.removeListener(listener);
  }*/
  // _getImageInfo() 학교 지도 이미지를 불러오고 이미지의 폭, 높이, 비율을 변수에 저장
  // 동기
  void _getImageInfo() {
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
  }

  // 줌/드래그 가 시작되는 시점의 줌 레벨과 위치를 저장하는 함수 _onScaleStart
  void _onScaleStart(ScaleStartDetails details) {
    mapvalue.previousScale = mapvalue.scale;
    mapvalue.previousPosition = details.focalPoint;
  }

  // 줌/드래그가 진행될 때 제스처의 정도에 알맞게 줌/드래그 레벨을 변화시켜주는 함수 _onScaleUpdate
  // ScaleUpdateDetails details 에 사용자의 제스처 정보가 들어있다 (줌 / 드래그 한 정도)
  void _onScaleUpdate(ScaleUpdateDetails details) {
    mapvalue.scale = (mapvalue.previousScale * details.scale).clamp(1.3, 12.0);
    final ratio = deviceHeight / deviceWidth;
    // 현재 화면상에 보여지는 지도 이미지의 실제 너비 (처음 화면에 너비를 꽉맞춰 이미지 위젯을 띄우므로 너비가 기준)
    // 원래 이미지의 너비가 3000픽셀일 때 scale이 2배라면 현재 화면에 보여지는 지도의 너비는 1500픽셀에 해당함
    final screenWidth = _imageWidth_du / mapvalue.scale;
    // 폭이 기준이므로 구한 화면상에 보여지는 지도 이미지의 실제 너비 * (너비 높이 비율) 을 통해 높이를 구함
    final screenHeight = screenWidth * ratio;

    // 사용자가 드래그를 할 때 지도 이미지 밖으로 나가면 안되므로 드래그의 최소/최대 범위를 계산을 통해 구한다


    // 이미지가 화면보다 작아질 경우를 대비해 dx, dy 각각의 최소값의 최대값, 최대값의 최소값을 지정한다.
    double compX = _imageWidth_du / 2;
    double compY = _imageHeight_du / 2;

    double minX = screenWidth / 2;
    double maxX = _imageWidth_du - screenWidth / 2;

    double minY = screenHeight / 2;
    double maxY = _imageHeight_du - screenHeight / 2;

    minY = minY > compY ? compY : minY;
    maxY = maxY > compY ? maxY : compY;

    minX = minX > compX ? compX : minX;
    maxX = maxX > compX ? maxX : compX;

    print('minY: $minY');
    print('maxY: $maxY');

    mapvalue.position -= (details.focalPoint - mapvalue.previousPosition) / mapvalue.previousScale / scale_offset;

    mapvalue.position = Offset(
      mapvalue.position.dx.clamp(minX, maxX),
      mapvalue.position.dy.clamp(minY, maxY),
    );

    print("position: ${mapvalue.position}");

    mapvalue.previousPosition = details.focalPoint;
  }

  void _vendingshow() {
    setState(() {
      _vendingvisibility = !_vendingvisibility;
      print('check: vendingvisibility: $_vendingvisibility');
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


  // 건물을 터치하면 _showButton 변수를 터치한 건물명으로 바꾸는 함수 _showFloorButton
  void _showFloorButton(String touchedBuilding) {
    setState(() {
      _showButton != touchedBuilding
          ? _showButton = touchedBuilding
          : _showButton = "기본";
    });
  }

  // 리스트 뷰에서 "시설"을 터치했을 때 해당 시설 정보 화면으로 이동시켜주는 함수 gotoBuildingInfo
  void gotoBuildingInfo({required String buildingName}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BuildingInfoScreen(
          title: buildingName,
        ),
      ),
    );
  }

  // initState, dispose
  @override
  void initState() {
    super.initState();
    _getImageInfo();
  }

  @override
  void dispose() {
    positionStream
        ?.cancel();
    super.dispose();
  }

  // geolocator를 통해 얻은 경도 위도를 이미지의 픽셀로 옮겨주는 함수 gpsToPixel
  Offset gpsToPixel(double w, double g) {
    double pixelX = 3000 *
        (g - 126.9962082464593) /
        (127.0046597158073 - 126.9962082464593);
    double pixelY = 5333 *
        (37.56424922299378 - w) /
        (37.56424922299378 - 37.552279443944855);

    return Offset(pixelX - 12, pixelY - 5); //왼쪽 위 오른 쪽 아래 보면서 오차 수정 필요
  }

  // 위치 권한을 요청하는 함수 requestLocationPermission
  Future<void> requestLocationPermission() async {
    var status = await Permission.location.request();
    if (!status.isGranted) {
      //status = await Permission.location.request();
      //if (!status.isGranted) {
      //return Future.error('Location permission not granted');
      //}
    }
  }

  // 위치 스트림을 받아오는 함수 startLocationStream
  void startLocationStream() async {
    await requestLocationPermission();
    positionStream = Geolocator.getPositionStream(
        desiredAccuracy: LocationAccuracy.high,
        //distanceFilter: 1
        intervalDuration: const Duration(milliseconds: 1000))
        .listen((Position position) {
      setState(() {
        now_w = position.latitude;
        now_g = position.longitude;
        nowLocationPixel = gpsToPixel(now_w, now_g);
        //print("gpsToPixel: $gpsToPixel");
      });
    });
  }

  // GPS 기능을 활성화/비활성화 하는 함수
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
      builder: (context) => EndAlert(
        title: 'DU벅이 - 동국대학교 길찾기',
        message: '종료하시겠습니까?',
        onOption1Pressed: () { // 아니오
          Navigator.of(context).pop(false);
        },
        onOption2Pressed: () { // 예
          Navigator.of(context).pop(true);
        },
      ),
    );
    return confirmExit ?? false;
  }

  // ====================================================
  bool _isInitialized = false;
  final _controller = SidebarXController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    //세로 정방향만 사용 가능하도록 제한
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    //지도 이미지 로드시 로딩 이미지 표시
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


    algovalue = Provider.of<AlgoValue>(context, listen: true);
    mapvalue = Provider.of<MapValue>(context, listen: true);
    buildingPositions = buildingPositionedList(
        scale_offset: scale_offset, showFloorButton: _showFloorButton);
    vendings = vendingPositionedList(
        scale: mapvalue.scale,
        scale_offset: scale_offset);
    showers = showerPositionedList(
        scale: mapvalue.scale,
        scale_offset: scale_offset);
    stores = storePositionedList(
        scale: mapvalue.scale,
        scale_offset: scale_offset);
    printers = printerPositionedList(
        scale: mapvalue.scale,
        scale_offset: scale_offset);
    atms = atmPositionedList(
        scale: mapvalue.scale,
        scale_offset: scale_offset);
    lounges = loungePositionedList(
        scale: mapvalue.scale,
        scale_offset: scale_offset);
    buildingNames = buildingnamePositionedList(
      scale: mapvalue.scale,
      scale_offset: scale_offset,
    );
    if (_isInitialized == false) {
      algovalue.initialize();
      mapvalue.initialize(_imageWidth_du / 2 , _imageHeight_du / 2);
      _isInitialized = true;
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'homescreen',
        home: Scaffold(
          body: Stack(
            children: [
              GestureDetector(
                onScaleStart: _onScaleStart,
                onScaleUpdate: _onScaleUpdate,
                onTap: (){
                  setState(() {
                    _showButton = "기본";
                  });
                },
                child: Stack(
                  children: [
                    Transform.scale(
                      scale: mapvalue.scale,
                      child: Transform.translate(
                        offset: Offset(_imageWidth_du / 2 - mapvalue.position.dx, _imageHeight_du / 2 + scr_img_diff / 2 - mapvalue.position.dy).scale(scale_offset, scale_offset),
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
                                    if (mapvalue.isRequired == true)
                                      Positioned(
                                          width: 200 / mapvalue.scale,
                                          height: 20 / mapvalue.scale,
                                          left: (mapvalue.guideX * scale_offset - 100 / mapvalue.scale),
                                          top: (mapvalue.guideY * scale_offset - 2.5 - 20 / mapvalue.scale),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: <Widget>[
                                                  // 아웃라인용 텍스트
                                                  Text(mapvalue.nodeName,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 10.0 / mapvalue.scale,
                                                      fontFamily: 'Paybooc',
                                                      fontWeight: FontWeight.w700,
                                                      foreground: Paint()
                                                        ..style = PaintingStyle.stroke
                                                        ..strokeWidth = 0.8 / mapvalue.scale
                                                        ..color = Colors.black, // 아웃라인 색
                                                    ),
                                                  ),
                                                  // 실제 텍스트
                                                  Text(mapvalue.nodeName,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 10.0 / mapvalue.scale,
                                                      fontFamily: 'Paybooc',
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.orangeAccent, // 실제 텍스트 색
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                      ),
                                    if (mapvalue.isRequired == true)    //노드 안내 아코
                                      Positioned(
                                          left: mapvalue.guideX * scale_offset - 146/3 * scale_offset / mapvalue.scale,
                                          top: mapvalue.guideY * scale_offset - 146/3 * scale_offset / mapvalue.scale,
                                          width: 1522/3 * scale_offset / mapvalue.scale,
                                          height: 921/3 * scale_offset / mapvalue.scale,
                                          child: Image.asset(
                                            'assets/images/position.png',
                                          )
                                      ),
                                    if (algovalue.isRequired == true)   //출발지 마커
                                      Positioned(
                                          left: algovalue.startNodes[0].x * scale_offset - 256/2 * scale_offset / mapvalue.scale ,
                                          top: algovalue.startNodes[0].y * scale_offset - 512/2 * scale_offset / mapvalue.scale,
                                          width: 512/2 * scale_offset / mapvalue.scale,
                                          height: 512/2 * scale_offset / mapvalue.scale,
                                          child: Image.asset(
                                            'assets/images/start.png',
                                          )
                                      ),
                                    if (algovalue.isRequired == true)   //도착지 마커
                                      Positioned(
                                          left: algovalue.endNodes.last.x * scale_offset - 256/2 * scale_offset / mapvalue.scale,
                                          top: algovalue.endNodes.last.y * scale_offset - 512/2 * scale_offset / mapvalue.scale,
                                          width: 512/2 * scale_offset / mapvalue.scale,
                                          height: 512/2 * scale_offset / mapvalue.scale,
                                          child: Image.asset(
                                            'assets/images/end.png',
                                          )
                                      ),
                                    if (algovalue.isRequired == true)   //출발지 노드 이름
                                      Positioned(
                                          width: 200 / mapvalue.scale,
                                          height: 20 / mapvalue.scale,
                                          left: (algovalue.startNodes[0].x * scale_offset - 100 / mapvalue.scale),
                                          top: (algovalue.startNodes[0].y * scale_offset - 512/2 * scale_offset / mapvalue.scale - 20 / mapvalue.scale),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: <Widget>[
                                                  // 아웃라인용 텍스트
                                                  Text(algovalue.startNodes[0].name,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 10.0 / mapvalue.scale,
                                                      fontFamily: 'Paybooc',
                                                      fontWeight: FontWeight.w700,
                                                      foreground: Paint()
                                                        ..style = PaintingStyle.stroke
                                                        ..strokeWidth = 0.8 / mapvalue.scale
                                                        ..color = Colors.white, // 아웃라인 색
                                                    ),
                                                  ),
                                                  // 실제 텍스트
                                                  Text(algovalue.startNodes[0].name,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 10.0 / mapvalue.scale,
                                                      fontFamily: 'Paybooc',
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.orangeAccent, // 실제 텍스트 색
                                                    ),
                                                  ),
                                                ],
                                              ),

                                            ],
                                          )
                                      ),
                                    if (algovalue.isRequired == true)   //도착지 노드 이름
                                      Positioned(
                                          width: 200 / mapvalue.scale,
                                          height: 20 / mapvalue.scale,
                                          left: (algovalue.endNodes.last.x * scale_offset - 100 / mapvalue.scale),
                                          top: (algovalue.endNodes.last.y * scale_offset - 512/2 * scale_offset / mapvalue.scale - 20 / mapvalue.scale),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: <Widget>[
                                                  // 아웃라인용 텍스트
                                                  Text(algovalue.endNodes.last.name,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 10.0 / mapvalue.scale,
                                                      fontFamily: 'Paybooc',
                                                      fontWeight: FontWeight.w700,
                                                      foreground: Paint()
                                                        ..style = PaintingStyle.stroke
                                                        ..strokeWidth = 0.8 / mapvalue.scale
                                                        ..color = Colors.white, // 아웃라인 색
                                                    ),
                                                  ),
                                                  // 실제 텍스트
                                                  Text(algovalue.endNodes.last.name,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 10.0 / mapvalue.scale,
                                                      fontFamily: 'Paybooc',
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.orangeAccent, // 실제 텍스트 색
                                                    ),
                                                  ),
                                                ],
                                              ),

                                            ],
                                          )
                                      ),
                                    if (isTrackingLocation)
                                      Stack(
                                        children: [
                                          Positioned(
                                            // 오렌지색 투명 큰 원
                                            left: nowLocationPixel.dx * scale_offset -
                                                9 * 1.3 / mapvalue.scale,
                                            top: nowLocationPixel.dy * scale_offset -
                                                9 * 1.3 / mapvalue.scale,
                                            child: Container(
                                              width: 18 * 1.3 / mapvalue.scale,
                                              height: 18 * 1.3 / mapvalue.scale,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.orange.withOpacity(0.3),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            //중앙 오렌지색 원 및 흰색 테두리
                                            left: nowLocationPixel.dx * scale_offset -
                                                5 * 1.3 / mapvalue.scale,
                                            top: nowLocationPixel.dy * scale_offset -
                                                5 * 1.3 / mapvalue.scale,
                                            child: Container(
                                              width: 10 * 1.3 / mapvalue.scale,
                                              height: 10 * 1.3 / mapvalue.scale,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width:
                                                    1.5 * 1.3 / mapvalue.scale),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.0, // 오른쪽 패딩패딩
                            right: 4.0,
                            top: devicePaddingTop,
                          ),
                          child: Row(
                            children: [
                              // 검색하고 싶은 건물 입력
                              Expanded(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(
                                    right: 4.0, // 오른쪽 패딩패딩
                                  ),
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
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: CustomText(
                                        text: '검색하고 싶은 건물을 입력하세요.',
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // 길찾기 버튼
                              Container(
                                color: const Color(0x00ffdda2),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10), // 버튼의 모양 설정
                                      ),
                                      padding: EdgeInsets.all(0),
                                      backgroundColor: Colors.orangeAccent
                                  ),
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
                                      const Icon(
                                        Icons.search,
                                        color: Colors.white,
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
                        ),
                        // 자판기 샤워실 매점 ...
                        Padding(
                          padding: EdgeInsets.only(
                            left: 0, // 오른쪽 패딩패딩
                            right: 0,
                            top: 0,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                FacilityButton(
                                  text: '자판기',
                                  textColor: Colors.blue,
                                  onPressed: _vendingshow,
                                  onoff: _vendingvisibility,
                                  icon: Icons.local_drink,
                                ),
                                const SizedBox(width: 10),
                                FacilityButton(
                                  text: '샤워실',
                                  textColor: Colors.lightBlueAccent,
                                  onPressed: _showershow,
                                  onoff: _showervisibility,
                                  icon: Icons.shower,
                                ),
                                const SizedBox(width: 10),
                                FacilityButton(
                                  text: '매점',
                                  textColor: Colors.purple,
                                  onPressed: _storeshow,
                                  onoff: _storevisibility,
                                  icon: Icons.store,
                                ),
                                const SizedBox(width: 10),
                                FacilityButton(
                                  text: '프린터',
                                  textColor: Colors.green,
                                  onPressed: _printershow,
                                  onoff: _printervisibility,
                                  icon: Icons.print,
                                ),
                                const SizedBox(width: 10),
                                FacilityButton(
                                  text: '라운지',
                                  textColor: Colors.brown,
                                  onPressed: _loungeshow,
                                  onoff: _loungevisibility,
                                  icon: Icons.desk,
                                ),
                                const SizedBox(width: 10),
                                FacilityButton(
                                  text: 'ATM',
                                  textColor: Colors.red,
                                  onPressed: _atmshow,
                                  onoff: _atmvisibility,
                                  icon: Icons.monetization_on,
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: algovalue.isRequired
                              ? HomeSidebarX(
                            controller: _controller,
                            scale_offset: scale_offset,
                          )
                              : const Text(""),
                        )
                      ],
                    ),
                    // _showButton이 "기본"이 아닌 경우 즉, 건물이 터치된 경우 리스트 뷰 위젯 출력

                    if (_showButton != "기본")
                      FloorView(
                        showButton: _showButton,
                        onValueChanged: (String strValue, int intValue) {
                          setState(() {
                            nowFloorData[_showButton] = intValue;
                            if (strValue == "시설") {
                              gotoBuildingInfo(
                                buildingName: _showButton,
                              );
                            } else {
                              buildingFilePath[_showButton] = strValue;
                              algovalue.colorPath();
                              for (String key in nowFloorData.keys) {
                                if (nowFloorData[key] != 0) {
                                  algovalue.floorButtonPath(
                                      nowFloorData[key]!, key);
                                }
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
                right: 12,
                bottom: 20,
                child: FloatingActionButton(
                  onPressed: toggleLocationTracking,
                  backgroundColor: Colors.orangeAccent.withOpacity(0.9),
                  child: Icon(isTrackingLocation
                      ? Icons.location_off
                      : Icons.location_on),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
