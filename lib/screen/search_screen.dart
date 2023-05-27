import 'package:Dubeogi/components/detail_list.dart';
import 'package:Dubeogi/screen/select_from_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:Dubeogi/save/astar.dart';
import 'package:Dubeogi/save/save.dart';
import 'package:Dubeogi/provider/algo_value.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class Vec {
  double x;
  double y;

  Vec(this.x, this.y);
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Node> result;
  late AlgoValue algovalue;
  List<String> direction = [];
  List<Vec> vector = [];
  final firstFocus = FocusNode();
  final secondFocus = FocusNode();
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  int count = 0;
  int check = 0;

  @override
  void initState() {
    super.initState();
    firstController.addListener(_handleSubmit);
    secondController.addListener(_handleSubmit);
  }

  @override
  void dispose() {
    super.dispose();
    firstController.removeListener(_handleSubmit);
    firstController.dispose();
    secondController.removeListener(_handleSubmit);
    secondController.dispose();
  }

  String getDirection(Vec current, Vec next) {
    double crossProduct = current.x * next.y - current.y * next.x;
    double dotProduct = current.x * next.x + current.y * next.y;

    double currentLength = sqrt(current.x * current.x + current.y * current.y);
    double nextLength = sqrt(next.x * next.x + next.y * next.y);

    double cosTheta = dotProduct / (currentLength * nextLength);
    double degree = (acos(cosTheta) * 180) / pi;

    if (degree < 45) {
      return "직진";
    } else if (degree >= 45 && degree < 90) {
      if (crossProduct > 0) {
        return "오른쪽";
      } else {
        return "왼쪽";
      }
    } else {
      if (crossProduct > 0) {
        return "크게 오른쪽";
      } else {
        return "크게 왼쪽";
      }
    }
  }

  bool isExistBuilding(String name) => buildings.contains(name);

  bool isExistSelectFromMap(String name) => selectFromMap.contains(name);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    algovalue = Provider.of<AlgoValue>(context, listen: true);

    if (arguments != null && count == 0) {
      firstController.text = arguments['start'] ?? '';
      secondController.text = arguments['end'] ?? '';
      count++;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('동국대학교'),
      ),
      body: Column(
        children: [
          // 최단.최적.차도
          Container(
            height: 60,
            color: Colors.orange,
            child: Stack(
              children: [
                // 버튼 속성
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 80,
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              '최단',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Paybooc',
                                fontWeight: FontWeight.w800,
                                color: algovalue.selectOption == 1
                                    ? Colors.orange
                                    : Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          InkWell(onTap: () {
                            algovalue.selectOption = 1;
                            _handleSubmit();
                          })
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: algovalue.selectOption == 1 ? Colors.white : null,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 80,
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              '최적',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Paybooc',
                                fontWeight: FontWeight.w800,
                                color: algovalue.selectOption == 2
                                    ? Colors.orange
                                    : Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          InkWell(onTap: () {
                            algovalue.selectOption = 2;
                            _handleSubmit();
                          })
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: algovalue.selectOption == 2 ? Colors.white : null,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 80,
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              '차도',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Paybooc',
                                fontWeight: FontWeight.w800,
                                color: algovalue.selectOption == 3
                                    ? Colors.orange
                                    : Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          InkWell(onTap: () {
                            algovalue.selectOption = 3;
                            _handleSubmit();
                          })
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: algovalue.selectOption == 3 ? Colors.white : null,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // 출발지 목적지 box
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            color: Colors.orange,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 츌발지
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      decoration: BoxDecoration(
                        color: Color(0xFFF8D4A8),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        children: [
                          TypeAheadField(
                            textFieldConfiguration: TextFieldConfiguration(
                                controller: firstController,
                                focusNode: firstFocus,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  hintText: '출발 지점을 입력하세요',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Paybooc',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xffF9D5A8),
                                ),
                                onSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(secondFocus);
                                }),
                            suggestionsCallback: (pattern) {
                              return buildings.where((text) => text
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase()));
                            },
                            suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                color: const Color(0xffF9D5A8)),
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: Text(suggestion),
                              );
                            },
                            onSuggestionSelected: (suggestion) {
                              setState(() {
                                firstController.text = suggestion;
                              });
                            },
                            noItemsFoundBuilder: (context) {
                              if (firstController.text == '') {
                                return Container();
                              } else {
                                return Container(
                                  height: 45.0,
                                  child: Center(
                                    child: Text(
                                      '건물명을 정확히 입력해주세요.',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () async {
                                Offset? result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SelectFromMap(destination: false)),
                                );
                                setState(() {
                                  if (result != null) {
                                    firstController.text = "";
                                    algovalue.pickandUpdateGraph(result, '지도에서 선택한 출발지');
                                    firstController.text = '지도에서 선택한 출발지';
                                  }
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(5, 5, 10, 5),
                                // Add margin to all sides
                                padding: EdgeInsets.all(15.0),
                                // Add padding to the container
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(
                                      10), // Add borderRadius
                                ),
                                child: Text('지도',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Paybooc',
                                      fontWeight: FontWeight.w700,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.orange,
                    ),
                    // 목적지
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      decoration: BoxDecoration(
                        color: Color(0xFFF8D4A8),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        children: [
                          TypeAheadField(
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: secondController,
                              focusNode: secondFocus,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                border: InputBorder.none,
                                hintText: '도착 지점을 입력하세요',
                                hintStyle: TextStyle(
                                  fontFamily: 'Paybooc',
                                  fontWeight: FontWeight.w400,
                                ),
                                filled: true,
                                fillColor: const Color(0xffF9D5A8),
                              ),
                            ),
                            suggestionsCallback: (pattern) {
                              return buildings.where((text) => text
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase()));
                            },
                            suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                color: const Color(0xffF9D5A8)),
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: Text(suggestion),
                              );
                            },
                            onSuggestionSelected: (suggestion) {
                              setState(() {
                                secondController.text = suggestion;
                              });
                            },
                            noItemsFoundBuilder: (context) {
                              if (secondController.text == '지도에서 선택한 도착지') {
                                return Container();
                              } else {
                                return Container(
                                  height: 45.0,
                                  child: Center(
                                    child: Text(
                                      '건물명을 정확히 입력해주세요.',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () async {
                                Offset? result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SelectFromMap(destination: true)),
                                );
                                setState(() {
                                  if (result != null) {
                                    secondController.text = "";
                                    algovalue.pickandUpdateGraph(result, '지도에서 선택한 도착지');
                                    secondController.text = '지도에서 선택한 도착지';
                                  }
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(5, 5, 10, 5),
                                // Add margin to all sides
                                padding: EdgeInsets.all(15.0),
                                // Add padding to the container
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(
                                      10), // Add borderRadius
                                ),
                                child: Text('지도',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Paybooc',
                                      fontWeight: FontWeight.w900,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 출발/목적지 설정 x -> 빈칸
          if (algovalue.isFind == false)
            Expanded(
              child: Container(
                child: Center(
                  child: ((firstController.text == secondController.text)&& isExistBuilding(firstController.text)) ? Text("출발지와 목적지가 같음.") : Text(""),
                ),
              ),
            )
          // else 경로 미리 표시
          else if (algovalue.isFind == true)
            Expanded(
              child: DetailList(
                items: algovalue.finalPath, // List<Node> : 경로에 속하는 모든 노드의 이름들이 들어가있는 리스트
                direction: algovalue.direction, // List<String> : 방향 설명
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 4.0),
            child: SizedBox(
              width: double.infinity,
              height: 35.0,
              child: ElevatedButton(
                onPressed: () {
                  if (algovalue.isFind == false){ // 경로를 찾지 않은 경우
                    notHandleInput(context);
                  }
                  else{
                    handleInput();
                  }
                },
                child: Text(
                  '경로 안내 시작하기',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Paybooc',
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // 주황색 배경색
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // 버튼 모서리를 둥글게 처리
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void notHandleInput(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("경로탐색 실패"),
          content: Text("다시 입력"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void handleInput() {
    // # TextField에 값을 넣는 순간부터 경로를 다 찾아놔서 다시 돌릴 필요가 없어서 일단 주석처리 해놓았음
    // # search_screen과 home_screen + drawer에 차별점을 주려면 놔둘 필요는 있음.
    // # reconstruct path를 새로하면 됨.

    /*
    var nodelist = Provider.of<NodeList>(context, listen: false);
    nodelist.StartNodeName = firstController.text;
    nodelist.EndNodeName = secondController.text;
    nodelist.Astar_pathMaking();
    */
    algovalue.colorPath();
    
    Navigator.of(context).popUntil((route) => route.isFirst);
    algovalue.isFind = false; // searchscreen에서의 값
    algovalue.isRequired = true; // drawer 쓸건지 안쓸건지
    //dispose();
  }

  void _handleSubmit() {
    int selectOption = algovalue.selectOption;
    List<Node> result = [];
    if (firstController.text == secondController.text){
      algovalue.erase();
      algovalue.isFind = false;
      return;
    }

    if (firstController.text != '지도에서 선택한 출발지') {
      algovalue.removePickedPointFromGraph('지도에서 선택한 출발지');
    } // 지우기
    if (secondController.text != '지도에서 선택한 도착지') {
      algovalue.removePickedPointFromGraph('지도에서 선택한 도착지');
    } // 지우기

    if ((isExistBuilding(firstController.text) || isExistSelectFromMap(firstController.text)) &&
        (isExistBuilding(secondController.text) || isExistSelectFromMap(secondController.text))) {
      print("check: function handleSubmit start\n");

      if(selectOption == 1 || selectOption == 2) {
        algovalue.startNodeName = firstController.text;
        algovalue.endNodeName = secondController.text;

        result = algovalue.astarPathMaking(
          usingGraph: algovalue.graph,
        );
      }
      else{ // option 3
        List<Node> temp;
        Node start = algovalue.graph.findNode(firstController.text);
        Node end = algovalue.graph.findNode(secondController.text);
        Graph driveWayGraph = initDriveWayGraph();
        Node? startClosest = algovalue.findClosestNode(driveWayGraph.nodes, start.x, start.y);
        Node? endClosest = algovalue.findClosestNode(driveWayGraph.nodes, end.x, end.y);

        // 시작 -> 가까운 차도
        algovalue.startNodeName = start.name;
        algovalue.endNodeName = startClosest.name;
        temp = algovalue.astarPathMaking(
          usingGraph: algovalue.graph,
        );
        // 차도
        algovalue.startNodeName = startClosest.name;
        algovalue.endNodeName = endClosest.name;
        temp.addAll(algovalue.astarPathMaking(
            usingGraph: driveWayGraph));
        // 차도 끝 -> 도착
        algovalue.startNodeName = endClosest.name;
        algovalue.endNodeName = end.name;
        temp.addAll(algovalue.astarPathMaking(
            usingGraph: algovalue.graph));

        // temp 바탕으로 result 정리
        for (int i = 0; i < temp.length; i++) {
          if (!result.any((node) => node.name == temp[i].name)) {
            result.add(temp[i]);
          } else {
            int duplicateIndex = result.indexOf(temp[i]);
            result.removeRange(duplicateIndex + 1, result.length);
          }
        }
      }
      algovalue.isFind = true;

      List<Node> startNodes = [];
      List<Node> endNodes = [];

      for (int i = 0; i < result.length; i++) {
        if (i == 0)
          startNodes.add(result[i]);
        else if (i == result.length - 1)
          endNodes.add(result[i]);
        else {
          endNodes.add(result[i]);
          startNodes.add(result[i]);
        }
      }

      for (Node str in result) {
        print("print name: ${str.name}");
      }
      vector.clear();
      direction.clear();
      for (int i = 0; i < startNodes.length; i++) {
        double deltaX = endNodes[i].x - startNodes[i].x;
        double deltaY = endNodes[i].y - startNodes[i].y;
        vector.add(Vec(deltaX, deltaY));
      }
      direction.add("출발지");
      for (int i = 0; i < vector.length - 1; i++) {
        direction.add(getDirection(vector[i], vector[i + 1]));
      }
      direction.add("목적지");

      algovalue.startNodes = startNodes;
      algovalue.endNodes = endNodes;
      algovalue.finalPath = result;
      algovalue.direction = direction;
    }
    else{
      algovalue.erase();
      algovalue.isFind = false;
    }
  }
}
