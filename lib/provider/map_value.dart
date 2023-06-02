import 'package:flutter/material.dart';

class MapValue with ChangeNotifier{
  double _scale = 1.3;
  double _previousScale = 1.0;
  Offset _position = Offset.zero;
  Offset _previousPosition = Offset.zero;

  double get scale => _scale;
  double get previousScale => _previousScale;
  Offset get position => _position;
  Offset get previousPosition => _previousPosition;

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
}