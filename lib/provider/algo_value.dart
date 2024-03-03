import 'dart:math';

import 'package:flutter/material.dart';
import 'package:Dubeogi/save/astar.dart';
import 'package:Dubeogi/save/save.dart';

// 알고리즘에 사용되며 지속하여 변화하는 값들을 모아놓음.
class AlgoValue with ChangeNotifier{
  Graph _graph = Graph();
  //String _showButton = "기본";
  int hour = 0;
  int open = 0;
  String _startNodeName = "";
  String _endNodeName = "";
  String meridiem = '';
  String arrivetime = '';
  final List<Offset> _startPointsRed = []; // custompaint에 사용
  final List<Offset> _endPointsRed = []; // custompaint에 사용
  final List<Offset> _startPointsBlue = []; // custompaint에 사용
  final List<Offset> _endPointsBlue = []; // custompaint에 사용
  final List<Offset> _startPointsGreen = []; // custompaint에 사용
  final List<Offset> _endPointsGreen = []; // custompaint에 사용
  List<Node> _startNodes = []; // A-B-C 일때 A-B, B-C ... 등 계속 바뀜
  List<Node> _endNodes = []; // 유효한 노드들
  List<Node> _regularPath = []; // 경로의 유효한 노드 리스트
  List<Node> _finalPath = [];
  int _selectOption = 1; // 탐색 옵션
  List<String> _detailDirection = [];
  List<Node> _finalDetailPath = [];
  List<String> _homeDirection = [];
  List<Node> _homeFinalPath = [];
  double _homeWeight = 0.0;
  double _totalWeight = 0.0;
  bool _isRequired = false; // 길을 찾는 중인지
  //bool _isInitialized = false; // 처음 한번만 실행되도록하게하는 변수
  bool _isAstared = false; // astar 알고리즘이 작동했는지 안했는지


  Graph get graph => _graph;
  //String get showButton => _showButton;
  String get startNodeName => _startNodeName;
  String get endNodeName => _endNodeName;
  List<Offset> get startPointsRed => _startPointsRed;
  List<Offset> get endPointsRed => _endPointsRed;
  List<Offset> get startPointsBlue => _startPointsBlue;
  List<Offset> get endPointsBlue => _endPointsBlue;
  List<Offset> get startPointsGreen => _startPointsGreen;
  List<Offset> get endPointsGreen => _endPointsGreen;
  List<Node> get startNodes => _startNodes;
  List<Node> get endNodes => _endNodes;
  List<Node> get regularPath => _regularPath;
  List<Node> get finalPath => _finalPath;
  int get selectOption => _selectOption;
  List<String> get detailDirection => _detailDirection;
  List<Node> get finalDetailPath => _finalDetailPath;
/*  List<Node> get startNodes_alpha => _startNodes_alpha;
  List<Node> get endNodes_alpha => _endNodes_alpha;*/
  List<String> get homeDirection => _homeDirection;
  List<Node> get homeFinalPath => _homeFinalPath;
  double get homeWeight => _homeWeight;
  double get totalWeight => _totalWeight;

  bool get showDrawer => _isRequired;
  //bool get isInitialized => _isInitialized;
  bool get isAstared => _isAstared;

  set startNodeName(String str){
    _startNodeName = str;
    notifyListeners();
  }
  set endNodeName(String str){
    _endNodeName = str;
    notifyListeners();
  }
  set startNodes(List<Node> nodelist){
    _startNodes = nodelist;
    notifyListeners();
  }
  set endNodes(List<Node> nodelist){
    _endNodes = nodelist;
    notifyListeners();
  }
  set finalPath(List<Node> nodelist){
    _finalPath = nodelist;
    notifyListeners();
  }
  set selectOption(int option){
    _selectOption = option;
    print('check: set selectOption: $_selectOption');
    notifyListeners();
  }
  set detailDirection(List<String> strlist){
    _detailDirection = strlist;
    notifyListeners();
  }
  set finalDetailPath(List<Node> nodelist){
    _finalDetailPath = nodelist;
    notifyListeners();
  }
  set homeDirection(List<String> strlist){
    _homeDirection = strlist;
    notifyListeners();
  }
  set homeFinalPath(List<Node> nodelist){
    _homeFinalPath = nodelist;
    notifyListeners();
  }
  set homeWeight(double val){
    _homeWeight = val;
    notifyListeners();
  }
  set totalWeight(double val){
    _totalWeight = val;
    notifyListeners();
  }
  set showDrawer(bool tf){
    _isRequired = tf;
    //print('check: set isRequired: ${_isRequired}');
    notifyListeners();
  }
  set isAstared(bool tf){
    _isAstared = tf;
    print('check: set isAstared: $_isAstared');
    notifyListeners();
  }

  void initialize(){
    print('check: initialize graph');
    initGraph(_graph);
    //notifyListeners();
  }

  void erase(){
    _startPointsRed.clear();
    _endPointsRed.clear();
    _startPointsBlue.clear();
    _endPointsBlue.clear();
    _startPointsGreen.clear();
    _endPointsGreen.clear();
    _startNodes.clear();
    _endNodes.clear();
    _finalPath.clear();
  }
  void eraseNodes(){
    _startNodes.clear();
    _endNodes.clear();
    notifyListeners();
  }
  // ==============================================
  List<Node> astarPathMaking({required Graph usingGraph, required String weight_select}) {
    //시작 노드와 도착 노드를 매개변수로 받아 Astar 알고리즘을 돌린 후 reconstructPath를 통해 경로를 리스트에 순서대로 저장한 후
    //지도 위에 그림을 그릴 수 있도록 start, end 리스트에 x, y값을 각각 넣는다.
    print('function starPathMaking start');
    Node startNode = usingGraph.findNode(_startNodeName);
    Node endNode = usingGraph.findNode(_endNodeName);

    int startIndex = usingGraph.findNodeIndex(usingGraph.nodes, _startNodeName);
    int endIndex = usingGraph.findNodeIndex(usingGraph.nodes, _endNodeName);

    // Regular search
    var regularResult =
    usingGraph.aStar(usingGraph.nodes, usingGraph.edges, startNode, endNode, weight_select);
    List<double> regularDist = regularResult.item1;
    List<int> regularPrev = regularResult.item2;

    _regularPath = reconstructPath(regularPrev, usingGraph.nodes, startIndex, endIndex);
    print("Path: $_regularPath");

    notifyListeners();
    return _regularPath;
  }


  void colorPath(){
    _startPointsRed.clear();
    _endPointsRed.clear();
    _startPointsGreen.clear();
    _endPointsGreen.clear();
    _startPointsBlue.clear();
    _endPointsBlue.clear();

    if(_selectOption == 1 || _selectOption == 2){
      for (int i = 0; i < _startNodes.length; i++) {
        if(_startNodes[i].isInside == 0 && _endNodes[i].isInside == 0){
          if (_graph.findEdge(_startNodes[i].name, _endNodes[i].name)?.type == "계단위" || _graph.findEdge(_startNodes[i].name, _endNodes[i].name)?.type == "오르막") {
            _startPointsRed.add(Offset(_startNodes[i].x, _startNodes[i].y));
            _endPointsRed.add(Offset(_endNodes[i].x, _endNodes[i].y));
          }
          else{
            _startPointsGreen.add(Offset(_startNodes[i].x, _startNodes[i].y));
            _endPointsGreen.add(Offset(_endNodes[i].x, _endNodes[i].y));
          }
        }
      }
    }
    else{
      for (int i = 0; i < _startNodes.length; i++) {
        if (_graph.findEdge(_startNodes[i].name, _endNodes[i].name)?.isRoad == true) {
          _startPointsBlue.add(Offset(_startNodes[i].x, _startNodes[i].y));
          _endPointsBlue.add(Offset(_endNodes[i].x, _endNodes[i].y));
        }
        else{
          _startPointsGreen.add(Offset(_startNodes[i].x, _startNodes[i].y));
          _endPointsGreen.add(Offset(_endNodes[i].x, _endNodes[i].y));
        }
      }
    }
  }
  void floorButtonPath(int nowFloor, String nowBuilding) {
    //층 단면도를 보여주는 버튼을 눌렀을 때 해당하는 경로를 보여주는 함수

    for (int i = 0; i < _startNodes.length; i++) {
      if (_startNodes[i].isInside != 0 || _endNodes[i].isInside != 0) {
        if(nowFloor != 0){
          if ((_startNodes[i].isInside == nowFloor || _endNodes[i].isInside == nowFloor) && (_startNodes[i].building == nowBuilding || _endNodes[i].building == nowBuilding)) {
            String? type = _graph.findEdge(_startNodes[i].name, _endNodes[i].name)?.type;
            if(type == "계단위" || type == "오르막"){
              _startPointsRed.add(Offset(_startNodes[i].x, _startNodes[i].y));
              _endPointsRed.add(Offset(_endNodes[i].x, _endNodes[i].y));
            }else if(type == "평지" || type == "계단아래" || type == "내리막"){
              _startPointsGreen.add(Offset(_startNodes[i].x, _startNodes[i].y));
              _endPointsGreen.add(Offset(endNodes[i].x, _endNodes[i].y));
            }
          }
        }
      }
    }
  }

  Graph selectFromMapNewGraph(String newName, double dx, double dy, Node closest) {
    Graph newGraph = Graph();
    newGraph.nodes = List.from(graph.nodes);
    newGraph.edges = List.from(graph.edges);
    double weight = sqrt((dx - closest.x) * (dx - closest.x) + (dy - closest.y) * (dy - closest.y));

    newGraph.addEdge(closest.name, newName, weight, weight, "평지", false,
        node2X: dx,
        node2Y: dy,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    newGraph.addEdge(newName, closest.name, weight, weight, "평지", false);


    return newGraph;
  }

  Node findClosestNode(List<Node> nodes, double dx, double dy) {
    Node? closest;
    double closestDistance = double.infinity;

    for (Node node in nodes) {
      if(buildings.contains(node.name) || node.isInside != 0){
        continue;
      }
      double distance = (node.x - dx) * (node.x - dx) + (node.y - dy) * (node.y - dy);
      if (distance < closestDistance) {
        closestDistance = distance;
        closest = node;
      }
    }

    if (closest == null) {
      throw Exception('Node list is empty.');
    }

    return closest;
  }

  // '지도에서 선택'으로 선택된 위치에 노드를 추가하는 함수 addSelectedFromMapNode
  void addSelectedFromMapNode(Offset newpoint, String str){
    print("check: pickandUpdateGraph($str)");
    Graph tempGraph = Graph();
    double dxPixel = 1500 - newpoint.dx;
    double dyPixel = 5333/2 - newpoint.dy;
    Node closestNode = findClosestNode(_graph.nodes, dxPixel, dyPixel);
    int isExist = _graph.findNodeIndex(_graph.nodes, str);
    if(isExist != -1) {
      _graph.removeNode(str);
    }

    tempGraph = selectFromMapNewGraph(str, dxPixel, dyPixel, closestNode); // 그래프에 엣지 추가
    _graph = tempGraph;
    notifyListeners();
  }

  // '지도에서 선택'으로 추가했던 노드를 다시 삭제하는 함수 removeSelectedFromMapNode
  void removeSelectedFromMapNode(String str){
    int isExist = _graph.findNodeIndex(_graph.nodes, str);
    if(isExist != -1) {
      _graph.removeNode(str);
      print("check: removePickedPointFromGraph('$str')");
      notifyListeners();
    }
    return;
  }
}