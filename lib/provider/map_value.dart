import 'package:flutter/material.dart';

class MapValue with ChangeNotifier{
  double _scale = 1.3;
  double _previousScale = 1.0;
  Offset _position = Offset.zero;
  Offset _previousPosition = Offset.zero;
  double _guideX = 0.0;
  double _guideY = 0.0;
  bool _isRequired = false;

  double get scale => _scale;
  double get previousScale => _previousScale;
  Offset get position => _position;
  Offset get previousPosition => _previousPosition;
  double get guideX => _guideX;
  double get guideY => _guideY;
  bool get isRequired => _isRequired;

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
    print('check: mapvlue-isRequired = ${_isRequired}');
    notifyListeners();
  }

  void initialize(double val_x, val_y){
    _position = Offset(val_x, val_y);
    _previousPosition = Offset(val_x, val_y);
  }
}