import 'package:Dubeogi/components/detail_list.dart';
import 'package:Dubeogi/screen/select_from_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:Dubeogi/save/astar.dart';
import 'package:Dubeogi/save/save.dart';
import 'package:Dubeogi/save/custom_text.dart';
import 'package:Dubeogi/provider/algo_value.dart';
import 'package:Dubeogi/provider/map_value.dart';
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
  late MapValue mapvalue;
  List<String> direction = [];
  late List<Node> detail_items; // result
  late List<String> detail_direction; // direction
  List<Vec> vector = [];
  final firstFocus = FocusNode();
  final secondFocus = FocusNode();
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  int count = 0;
  int check = 0;
  String? previousFirstValue;
  String? previousSecondValue;

  List<String> direction_alpha = [];
  List<Node> result_alpha = [];
  List<Node> startNodes_alpha = [];
  List<Node> endNodes_alpha = [];

  void _handleFirstTextChange() {
    if (firstController.text != previousFirstValue) {
      previousFirstValue = firstController.text;
      _handleSubmit();
    }
  }

  void _handleSecondTextChange() {
    if (secondController.text != previousSecondValue) {
      previousSecondValue = secondController.text;
      _handleSubmit();
    }
  }

  @override
  void initState() {
    super.initState();
    firstController.addListener(_handleFirstTextChange);
    secondController.addListener(_handleSecondTextChange);
  }

  @override
  void dispose() {
    super.dispose();
    firstController.removeListener(_handleFirstTextChange);
    firstController.dispose();
    secondController.removeListener(_handleSecondTextChange);
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
    } else if (degree >= 45 && degree < 80) {
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
    mapvalue = Provider.of<MapValue>(context);

    if (arguments != null && count == 0) {
      firstController.text = arguments['start'] ?? '';
      secondController.text = arguments['end'] ?? '';
      count++;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text('동국대학교'),
      // ),
      body: Container(
        color: Colors.orange,
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
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
                                  child: CustomText(
                                    text: '최소',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15.0,
                                    color: algovalue.selectOption == 1
                                        ? Colors.orange
                                        : Colors.white,
                                  ),
                                ),
                                InkWell(onTap: () {
                                  algovalue.selectOption = 1;
                                  _handleSubmit();
                                })
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: algovalue.selectOption == 1
                                  ? Colors.white
                                  : null,
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
                                  child: CustomText(
                                    text: '최적',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15.0,
                                    color: algovalue.selectOption == 2
                                        ? Colors.orange
                                        : Colors.white,
                                  ),
                                ),
                                InkWell(onTap: () {
                                  algovalue.selectOption = 2;
                                  _handleSubmit();
                                })
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: algovalue.selectOption == 2
                                  ? Colors.white
                                  : null,
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
                                  child: CustomText(
                                    text: '차도',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15.0,
                                    color: algovalue.selectOption == 3
                                        ? Colors.orange
                                        : Colors.white,
                                  ),
                                ),
                                InkWell(onTap: () {
                                  algovalue.selectOption = 3;
                                  _handleSubmit();
                                })
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: algovalue.selectOption == 3
                                  ? Colors.white
                                  : null,
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
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                  color: Colors.orange,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 츌발지
                          Row(
                            children: [
                              Expanded(
                                child: TypeAheadField(
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                          controller: firstController,
                                          focusNode: firstFocus,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 16,
                                                      horizontal: 10),
                                              hintText: '출발 지점을 입력하세요',
                                              hintStyle: TextStyle(
                                                fontFamily: 'Paybooc',
                                                fontWeight: FontWeight.w400,
                                              ),
                                              filled: true,
                                              fillColor:
                                                  const Color(0xffF9D5A8),
                                              suffixIcon: InkWell(
                                                onTap: () {
                                                  firstController.text = "";
                                                },
                                                child: Icon(
                                                  Icons.cancel,
                                                  size: 20.0,
                                                ),
                                              )),
                                          onSubmitted: (_) {
                                            FocusScope.of(context)
                                                .requestFocus(secondFocus);
                                          }),
                                  suggestionsCallback: (pattern) {
                                    return buildings.where((text) => text
                                        .toLowerCase()
                                        .contains(pattern.toLowerCase()));
                                  },
                                  suggestionsBoxDecoration:
                                      SuggestionsBoxDecoration(
                                          color: const Color(0xffF9D5A8)),
                                  itemBuilder: (context, suggestion) {
                                    return ListTile(
                                      title: CustomText(
                                        text: suggestion,
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                      ),
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
                                          child: CustomText(
                                            text: '건물명을 정확히 입력해주세요',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () async {
                                    Offset? result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SelectFromMap(
                                              destination: false)),
                                    );
                                    setState(() {
                                      if (result != null) {
                                        firstController.text = "";
                                        algovalue.pickandUpdateGraph(
                                            result, '지도에서 선택한 출발지');
                                        firstController.text = '지도에서 선택한 출발지';
                                      }
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                    // Add margin to all sides
                                    padding: EdgeInsets.all(15.0),
                                    // Add padding to the container
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(
                                          10), // Add borderRadius
                                    ),
                                    child: CustomText(
                                      text: '지도',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 2,
                            color: Colors.orange,
                          ),
                          // 목적지
                          Row(
                            children: [
                              Expanded(
                                child: TypeAheadField(
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                    controller: secondController,
                                    focusNode: secondFocus,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 10),
                                        border: InputBorder.none,
                                        hintText: '도착 지점을 입력하세요',
                                        hintStyle: TextStyle(
                                          fontFamily: 'Paybooc',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xffF9D5A8),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            secondController.text = "";
                                          },
                                          child: Icon(
                                            Icons.cancel,
                                            size: 20.0,
                                          ),
                                        )),
                                  ),
                                  suggestionsCallback: (pattern) {
                                    return buildings.where((text) => text
                                        .toLowerCase()
                                        .contains(pattern.toLowerCase()));
                                  },
                                  suggestionsBoxDecoration:
                                      SuggestionsBoxDecoration(
                                          color: const Color(0xffF9D5A8)),
                                  itemBuilder: (context, suggestion) {
                                    return ListTile(
                                      title: CustomText(
                                        text: suggestion,
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    );
                                  },
                                  onSuggestionSelected: (suggestion) {
                                    setState(() {
                                      secondController.text = suggestion;
                                    });
                                  },
                                  noItemsFoundBuilder: (context) {
                                    if (secondController.text ==
                                        '지도에서 선택한 도착지') {
                                      return Container();
                                    } else {
                                      return Container(
                                        height: 45.0,
                                        child: Center(
                                          child: CustomText(
                                            text: '건물명을 정확히 입력해주세요',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
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
                                        algovalue.pickandUpdateGraph(
                                            result, '지도에서 선택한 도착지');
                                        secondController.text = '지도에서 선택한 도착지';
                                      }
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                    // Add margin to all sides
                                    padding: EdgeInsets.all(15.0),
                                    // Add padding to the container
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(
                                          10), // Add borderRadius
                                    ),
                                    child: CustomText(
                                      text: '지도',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // 출발/목적지 설정 x -> 빈칸
                if (algovalue.isFind == true)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: 10.0),
                              Icon(
                                Icons.access_time,
                                color: Colors.blueAccent,
                              ),
                              SizedBox(width: 15.0),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${(algovalue.totalWeight / 60).toInt()}',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 20,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '분',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' ${(algovalue.totalWeight % 60).toInt()}',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 20,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '초',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 20.0,
                                width: 3.0,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: algovalue.meridiem,
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' ' + (algovalue.hour >= 10 ? '${algovalue.hour}' : '0${algovalue.hour}'),
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ':',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: algovalue.arrivetime.substring(3,5) + ' ',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '도착',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (algovalue.isFind == false)
                  Expanded(
                    child: Container(
                      child: Center(
                        child:
                            ((firstController.text == secondController.text) &&
                                    isExistBuilding(firstController.text))
                                ? CustomText(
                                    text: "출발지와 목적지가 같음.",
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  )
                                : CustomText(
                                    text: "출발지와 목적지를 입력하세요.",
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.0,
                                  ),
                      ),
                    ),
                  )
                // else 경로 미리 표시
                else if (algovalue.isFind == true)
                  Expanded(
                    child: DetailList(
                      items: algovalue.result_alpha,
                      // List<Node> : 경로에 속하는 모든 노드의 이름들이 들어가있는 리스트
                      direction:
                          algovalue.direction_alpha, // List<String> : 방향 설명
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 3.0, vertical: 4.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 35.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (algovalue.isFind == false) {
                          // 경로를 찾지 않은 경우
                          notHandleInput(context);
                        } else {
                          for (String key in FloorData.keys) {
                            if (FloorData[key] != 0) FloorData[key] = 0;
                          }
                          for (String key in LookData.keys) {
                            LookData[key] = OriginalData[key]!;
                          }
                          handleInput();
                        }
                      },
                      child: CustomText(
                        text: '경로 안내 시작하기',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange, // 주황색 배경색
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16), // 버튼 모서리를 둥글게 처리
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
    );
  }

  void notHandleInput(BuildContext context) {
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

    algovalue.colorPath();
    //
    algovalue.startNodeName = firstController.text;
    algovalue.endNodeName = secondController.text;
    algovalue.homeDirection = algovalue.direction_alpha;
    algovalue.homeResult = algovalue.result_alpha;
    algovalue.homeWeight = algovalue.totalWeight;
    mapvalue.position = Offset((algovalue.graph.findNode(firstController.text).x + algovalue.graph.findNode(secondController.text).x) / 2, (algovalue.graph.findNode(firstController.text).y + algovalue.graph.findNode(secondController.text).y) / 2);
    mapvalue.scale = 2;
    //
    Navigator.of(context).popUntil((route) => route.isFirst);
    algovalue.isFind = false; // searchscreen에서의 값
    algovalue.isRequired = true; // drawer 쓸건지 안쓸건지
    mapvalue.isRequired = false; // 노드 표시가 있다면 비활성화
    //dispose();
  }

  void _handleSubmit() {
    int selectOption = algovalue.selectOption;
    String weight_select;
    double total_weight = 0;

    if (selectOption == 1 || selectOption == 3) {
      weight_select = "최단";
    } else {
      weight_select = "최적";
    }

    List<Node> result = [];
    if (firstController.text == secondController.text) {
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

    if ((isExistBuilding(firstController.text) ||
            isExistSelectFromMap(firstController.text)) &&
        (isExistBuilding(secondController.text) ||
            isExistSelectFromMap(secondController.text))) {
      print("check: function handleSubmit start\n");

      if (selectOption == 1 || selectOption == 2) {
        algovalue.startNodeName = firstController.text;
        algovalue.endNodeName = secondController.text;

        result = algovalue.astarPathMaking(
          usingGraph: algovalue.graph,
          weight_select: weight_select,
        );

        for (int i = 0; i < result.length - 1; i++) {
          //총 걸린 시간을 계산하는 부분
          total_weight += algovalue.graph
              .findEdge(result[i].name, result[i + 1].name)!
              .time_weight;
        }
      } else {
        // option 3
        List<Node> temp;
        Node start = algovalue.graph.findNode(firstController.text);
        Node end = algovalue.graph.findNode(secondController.text);
        Graph driveWayGraph = initDriveWayGraph();
        Node? startClosest =
            algovalue.findClosestNode(driveWayGraph.nodes, start.x, start.y);
        Node? endClosest =
            algovalue.findClosestNode(driveWayGraph.nodes, end.x, end.y);

        // 시작 -> 가까운 차도
        algovalue.startNodeName = start.name;
        algovalue.endNodeName = startClosest.name;
        print("startClosest.name: ${startClosest.name}");
        temp = algovalue.astarPathMaking(
          usingGraph: algovalue.graph,
          weight_select: weight_select,
        );

        for (int i = 0; i < temp.length - 1; i++) {
          //총 걸린 시간을 계산하는 부분
          total_weight += algovalue.graph
              .findEdge(temp[i].name, temp[i + 1].name)!
              .time_weight;
        }
        int length_temp = temp.length;
        // 차도
        algovalue.startNodeName = startClosest.name;
        algovalue.endNodeName = endClosest.name;
        temp.addAll(algovalue.astarPathMaking(
            usingGraph: driveWayGraph, weight_select: weight_select));
        for (int i = length_temp; i < temp.length - 1; i++) {
          //총 걸린 시간을 계산하는 부분
/*          //디버그용 출력
          print('temp[i].name: ${temp[i].name}     temp[i + 1].name: ${temp[i + 1].name}');
          print(driveWayGraph.findEdge(temp[i].name, temp[i + 1].name));*/
          total_weight += driveWayGraph
              .findEdge(temp[i].name, temp[i + 1].name)!
              .time_weight;
        }
        // 차도 끝 -> 도착
        length_temp = temp.length;
        algovalue.startNodeName = endClosest.name;
        algovalue.endNodeName = end.name;
        temp.addAll(algovalue.astarPathMaking(
            usingGraph: algovalue.graph, weight_select: weight_select));
        for (int i = length_temp; i < temp.length - 1; i++) {
          //총 걸린 시간을 계산하는 부분
          total_weight += algovalue.graph
              .findEdge(temp[i].name, temp[i + 1].name)!
              .time_weight;
        }

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

      if (isExistBuilding(firstController.text)) {
        result.removeAt(0);
        total_weight -= 100000;
      }
      if (isExistBuilding(secondController.text)) {
        result.removeLast();
        total_weight -= 100000;
      }

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
/*        if(i != result.length - 1){ //총 걸린 시간을 계산하는 부분
          total_weight += algovalue.graph.findEdge(result[i].name, result[i + 1].name)!.time_weight;
        }*/
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
      //
      algovalue.finalPath = result;
      algovalue.direction = direction;
      //
      direction_alpha.clear();
      result_alpha.clear();
      startNodes_alpha.clear();
      endNodes_alpha.clear();
      for (int i = 0; i < result.length; i++) {
        if (direction[i] == "출발지") {
          startNodes_alpha.add(result[i]);
          result_alpha.add(result[i]);
          direction_alpha.add("출발지");
        } else if (direction[i] == "목적지") {
          endNodes_alpha.add(result[i]);
          result_alpha.add(result[i]);
          direction_alpha.add("목적지");
        } else if (result[i].showRoute == true) {
          endNodes_alpha.add(result[i]);
          startNodes_alpha.add(result[i]);
          result_alpha.add(result[i]);
          direction_alpha.add(direction[i]);
        }
      }
      algovalue.endNodes_alpha = endNodes_alpha;
      algovalue.startNodes_alpha = startNodes_alpha;
      algovalue.result_alpha = result_alpha;
      algovalue.direction_alpha = direction_alpha;
      algovalue.totalWeight = total_weight;
      algovalue.arrivetime = DateTime.now().add(Duration(minutes: (total_weight / 60).toInt() + 1)).toString().substring(11,16);
      algovalue.hour = int.parse(algovalue.arrivetime.substring(0,2));
      if(algovalue.hour >= 12){
        algovalue.meridiem = '오후';
        algovalue.hour -= 12;
      }
      else{
        algovalue.meridiem = '오전';
      }
    } else {
      algovalue.isFind = false;
    }
    print(
        'total_weight: ${(total_weight / 60).toInt()}분 ${(total_weight % 60).toInt()}초, 약 ${(total_weight / 60).toInt() + 1}분');
  }
}
