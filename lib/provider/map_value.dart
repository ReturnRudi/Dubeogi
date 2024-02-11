import 'package:flutter/material.dart';

class MapValue with ChangeNotifier{
  double _scale = 1.3;
  double _previousScale = 1.0;
  Offset _position = Offset.zero;
  Offset _previousPosition = Offset.zero;
  double _guideX = 0.0;
  double _guideY = 0.0;
  bool _isRequired = false;
  bool _isAnimating = false;
  String _nodeName = "";

  double get scale => _scale;
  double get previousScale => _previousScale;
  Offset get position => _position;
  Offset get previousPosition => _previousPosition;
  double get guideX => _guideX;
  double get guideY => _guideY;
  bool get isRequired => _isRequired;
  String get nodeName => _nodeName;

  set scale(double val){
    _scale = val;
    notifyListeners();
  }
  set previousScale(double val){
    _previousScale = val;
    notifyListeners();
  }
  set position(Offset val){
    _position = val;
    notifyListeners();
  }
  set previousPosition(Offset val){
    _previousPosition = val;
    notifyListeners();
  }
  set guideX(double val){
    _guideX = val;
    notifyListeners();
  }
  set guideY(double val){
    _guideY = val;
    notifyListeners();
  }
  set isRequired(bool tf){
    _isRequired = tf;
    print('check: mapvlue-isRequired = $_isRequired');
    notifyListeners();
  }
  set nodeName(String name){
    _nodeName = name;
    notifyListeners();
  }

  void initialize(double valX, valY){
    _position = Offset(valX, valY);
    _previousPosition = Offset(valX, valY);
  }

  void guide_animation(Offset end, double scale) async {
    if (_isAnimating) {
      return;
    }

    _isAnimating = true;

    int num = 1000;

    double xChange = (end.dx - _position.dx) / num;
    double yChange = (end.dy - _position.dy) / num;
    double scaleChange = (scale - _scale) / num;
    print('x_change: $xChange    y_change: $yChange');

    for(int i = 1; i <= num; i++){
      await Future.delayed(const Duration(microseconds: 750));  // 10 milliseconds의 지연시간을 설정
      _position = Offset(_position.dx + xChange, _position.dy + yChange);
      _scale += scaleChange;
      notifyListeners(); // position이 변경되었음을 알려 화면을 갱신
      print("_position: $_position");
    }

    _isAnimating = false;
  }
}