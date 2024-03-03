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

// 벡터 클래스
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
  late AlgoValue algoValue;
  late MapValue mapValue;
  List<String> direction = [];
  List<Vec> vector = [];
  final firstFocus = FocusNode();
  final secondFocus = FocusNode();
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  int count = 0;
  int check = 0;
  String? previousFirstValue;
  String? previousSecondValue;

  // 출발지 텍스트에 변경점이 있는 경우 _handleSubmit()를 호출하는 함수 _handleFirstTextChange
  void _handleFirstTextChange() {
    if (firstController.text != previousFirstValue) {
      previousFirstValue = firstController.text;
      _handleSubmit();
    }
  }

  // 도착지 텍스트에 변경점이 있는 경우 _handleSubmit()를 호출하는 함수 _handleFirstTextChange
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

  // 외적을 통해 얻은 각도를 이용해 방향 문자열을 반환하는 함수 getDirection
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

  // name에 해당하는 이름의 빌딩이 존재하는 지 확인하는 함수 isExistBuilding
  bool isExistBuilding(String name) => buildings.contains(name);

  // 지도에서 선택한 출발지/도착지 노드가 존재하는 지 확인하는 함수 isExistSelectFromMap
  bool isExistSelectFromMap(String name) => selectFromMap.contains(name);


  //
  void guideStartFail(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("경로탐색 실패"),
          content: const Text("출발지와 도착지를 확인하세요"),
          actions: [
            TextButton(
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //
  void guideStart() {
    algoValue.colorPath();
    algoValue.startNodeName = firstController.text;
    algoValue.endNodeName = secondController.text;
    algoValue.homeDirection = algoValue.detailDirection;
    algoValue.homeFinalPath = algoValue.finalDetailPath;
    algoValue.homeWeight = algoValue.totalWeight;
    mapValue.scale = 2;
    double middleX = ((algoValue.graph.findNode(firstController.text).x + algoValue.graph.findNode(secondController.text).x) / 2).clamp(mapValue.minX, mapValue.maxX);
    double middleY = ((algoValue.graph.findNode(firstController.text).y + algoValue.graph.findNode(secondController.text).y) / 2).clamp(mapValue.minY, mapValue.maxY);
    print('middleX: $middleX     middleY: $middleY');
    mapValue.position = Offset(middleX, middleY);
    Navigator.of(context).popUntil((route) => route.isFirst);
    algoValue.isAstared = false; // A* 알고리즘이 작동했는지 판단하는 변수 -> 작동하면 true로 초기화한다.
    algoValue.showDrawer = true; // drawer 쓸건지 안쓸건지
    mapValue.isRequired = false; // 노드 표시가 있다면 비활성화
  }


  // 출발지, 목적지가 정해지면 A* 알고리즘을 진행하는 함수 _handleSubmit
  void _handleSubmit() {
    // 만약 출발지, 목적지가 같은 경우 A* 알고리즘을 진행하지 않고 반환한다.
    if (firstController.text == secondController.text) return;

    // A* 알고리즘을 어떤 가중치를 통해서 진행할 지 설정한다.
    String weightSelect;
    if (algoValue.selectOption == 1 || algoValue.selectOption == 3) {
      weightSelect = "최단";
    } else {
      weightSelect = "최적";
    }

    // 출발지/도착지가 지도에서 선택한 출발지/도착지가 아닌 경우 지도에서 선택한 출발지/도착지 에 해당하는 노드를 삭제한다.
    if (firstController.text != '지도에서 선택한 출발지') {
      algoValue.removeSelectedFromMapNode('지도에서 선택한 출발지');
    }
    if (secondController.text != '지도에서 선택한 도착지') {
      algoValue.removeSelectedFromMapNode('지도에서 선택한 도착지');
    }

    // 출발지/도착지에 올바른 빌딩명을 입력했거나 지도에서 선택한 출발지/도착지가 제대로 입력된 경우 길찾기를 정상적으로 시작한다.
    if ((isExistBuilding(firstController.text) || isExistSelectFromMap(firstController.text)) &&
        (isExistBuilding(secondController.text) || isExistSelectFromMap(secondController.text))) {

      print("check: function handleSubmit start\n");
      algoValue.totalWeight = 0;
      algoValue.showDrawer = false;
      algoValue.erase();

      // 탐색 조건이 '최소', '최적' 인 경우
      if (algoValue.selectOption == 1 || algoValue.selectOption == 2) {
        algoValue.startNodeName = firstController.text;
        algoValue.endNodeName = secondController.text;

        algoValue.finalPath = algoValue.astarPathMaking(
          usingGraph: algoValue.graph,
          weight_select: weightSelect,
        );

        // 총 걸린 시간을 계산하는 부분
        for (int i = 0; i < algoValue.finalPath.length - 1; i++) {
          algoValue.totalWeight += algoValue.graph
              .findEdge(algoValue.finalPath[i].name, algoValue.finalPath[i + 1].name)!
              .sec_weight;
        }
      } else {
        // 탐색 조건이 '차도' 인 경우
        List<Node> temp;
        Node start = algoValue.graph.findNode(firstController.text);
        Node end = algoValue.graph.findNode(secondController.text);
        Graph roadGraph = initRoadGraph();
        Node? startClosest =
        algoValue.findClosestNode(roadGraph.nodes, start.x, start.y);
        Node? endClosest =
        algoValue.findClosestNode(roadGraph.nodes, end.x, end.y);

        // (1) [ 시작 지점 -> 가까운 차도 ] 길탐색
        algoValue.startNodeName = start.name;
        algoValue.endNodeName = startClosest.name;
        temp = algoValue.astarPathMaking(
          usingGraph: algoValue.graph,
          weight_select: weightSelect,
        );

        // [ 시작 지점 -> 시작 지점에서 가까운 차도 ] 걸린 시간을 계산
        for (int i = 0; i < temp.length - 1; i++) {
          algoValue.totalWeight += algoValue.graph
              .findEdge(temp[i].name, temp[i + 1].name)!
              .sec_weight;
        }
        int tempLength = temp.length;
        // (2) [ 시작 지점에서 가까운 차도 -> 도착 지점에서 가까운 차도 ] 길탐색
        algoValue.startNodeName = startClosest.name;
        algoValue.endNodeName = endClosest.name;
        temp.addAll(algoValue.astarPathMaking(
            usingGraph: roadGraph, weight_select: weightSelect));

        // [ 시작 지점에서 가까운 차도 -> 도착 지점에서 가까운 차도 ] 걸린 시간을 계산해서 총 시간에 갱신
        for (int i = tempLength; i < temp.length - 1; i++) {
          algoValue.totalWeight += roadGraph
              .findEdge(temp[i].name, temp[i + 1].name)!
              .sec_weight;
        }
        // (3) [ 도착 지점에서 가까운 차도 -> 도착 지점 ] 길탐색
        tempLength = temp.length;
        algoValue.startNodeName = endClosest.name;
        algoValue.endNodeName = end.name;
        temp.addAll(algoValue.astarPathMaking(
            usingGraph: algoValue.graph, weight_select: weightSelect));

        // [ 도착 지점에서 가까운 차도 -> 도착 지점 ] 걸린 시간을 계산해서 총 시간에 갱신
        for (int i = tempLength; i < temp.length - 1; i++) {
          algoValue.totalWeight += algoValue.graph
              .findEdge(temp[i].name, temp[i + 1].name)!
              .sec_weight;
        }

        // (1), (2), (3)의 경로를 합칠 때 특정 노드를 두 번 지나지 않도록 점검하여 finalPath에 넣는다.
        for (int i = 0; i < temp.length; i++) {
          if (!algoValue.finalPath.any((node) => node.name == temp[i].name)) {
            algoValue.finalPath.add(temp[i]);
          } else {
            int duplicateIndex = algoValue.finalPath.indexOf(temp[i]);
            algoValue.finalPath.removeRange(duplicateIndex + 1, algoValue.finalPath.length);
          }
        }
      }

      // A* 알고리즘이 작동했으므로 isAstared를 true로 바꾼다.
      algoValue.isAstared = true;

      // A* 알고리즘의 결과 리스트 finalPath 디버깅용 print
      print("finalPath: ${algoValue.finalPath}");

      // A* 알고리즘의 결과 리스트의 시작과 끝에 존재하는 건물명을 없애고 [ 건물명 - 입구 ] 엣지에 설정해 둔 가중치 100000을 뺀다. (save.dart 참고)
      if (isExistBuilding(firstController.text)) {
        algoValue.finalPath.removeAt(0);
        algoValue.totalWeight -= 100000;
      }
      if (isExistBuilding(secondController.text)) {
        algoValue.finalPath.removeLast();
        algoValue.totalWeight -= 100000;
      }

      // LinePainter로 선을 그리기 위해 A* 알고리즘의 결과 리스트를 startNodes, endNodes에 순서대로 넣는다.
      for (int i = 0; i < algoValue.finalPath.length; i++) {
        if (i == 0) {
          algoValue.startNodes.add(algoValue.finalPath[i]);
          if(algoValue.finalPath.length == 1) {
            algoValue.endNodes.add(algoValue.finalPath[i]);
          }
        }
        else if (i == algoValue.finalPath.length - 1){
          algoValue.endNodes.add(algoValue.finalPath[i]);
        }
        else {
          algoValue.endNodes.add(algoValue.finalPath[i]);
          algoValue.startNodes.add(algoValue.finalPath[i]);
        }
      }

      // 엣지를 벡터화한 후 엣지 간 getDirection을 통해 각도를 설명하는 문자열을 구해서 direction 벡터에 넣는다.
      vector.clear();
      direction.clear();
      for (int i = 0; i < algoValue.startNodes.length; i++) {
        double deltaX = algoValue.endNodes[i].x - algoValue.startNodes[i].x;
        double deltaY = algoValue.endNodes[i].y - algoValue.startNodes[i].y;
        vector.add(Vec(deltaX, deltaY));
      }

      // 상세 안내에 표시될 리스트들을 showDetail이 true인 것들로 채운다.
      algoValue.detailDirection.clear();
      algoValue.finalDetailPath.clear();

      direction.add("출발지");
      for (int i = 0; i < vector.length - 1; i++) {
        direction.add(getDirection(vector[i], vector[i + 1]));
      }
      direction.add("목적지");

      for (int i = 0; i < algoValue.finalPath.length; i++) {
        if (direction[i] == "출발지") {
          algoValue.finalDetailPath.add(algoValue.finalPath[i]);
          algoValue.detailDirection.add("출발지");
        } else if (direction[i] == "목적지") {
          algoValue.finalDetailPath.add(algoValue.finalPath[i]);
          algoValue.detailDirection.add("목적지");
        } else if (algoValue.finalPath[i].showDetail == true) {
          algoValue.finalDetailPath.add(algoValue.finalPath[i]);
          algoValue.detailDirection.add(direction[i]);
        }
      }

      algoValue.arrivetime = DateTime.now().add(Duration(minutes: algoValue.totalWeight ~/ 60 + 1)).toString().substring(11,16);
      algoValue.hour = int.parse(algoValue.arrivetime.substring(0,2));
      if(algoValue.hour >= 12){
        algoValue.meridiem = '오후';
        algoValue.hour -= 12;
      }
      else{
        algoValue.meridiem = '오전';
      }
    } else {
      algoValue.isAstared = false;
    }
    print(
        'total_weight: ${algoValue.totalWeight ~/ 60}분 ${(algoValue.totalWeight % 60).toInt()}초, 약 ${algoValue.totalWeight ~/ 60 + 1}분');
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    algoValue = Provider.of<AlgoValue>(context, listen: true);
    mapValue = Provider.of<MapValue>(context, listen: true);

    if (arguments != null && count == 0) {
      firstController.text = arguments['start'] ?? '';
      secondController.text = arguments['end'] ?? '';
      count++;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.orangeAccent,
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: Colors.orangeAccent,
                  child: Column(
                    children: [
                      // 최단, 최적, 차도 버튼
                      Container(
                        height: 60,
                        color: Colors.orangeAccent,
                        child: Stack(
                          children: [
                            // 버튼 속성
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: algoValue.selectOption == 1
                                        ? Colors.white
                                        : null,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: CustomText(
                                          text: '최소',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15.0,
                                          color: algoValue.selectOption == 1
                                              ? Colors.orangeAccent
                                              : Colors.white,
                                        ),
                                      ),
                                      InkWell(onTap: () {
                                        algoValue.selectOption = 1;
                                        _handleSubmit();
                                      })
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: algoValue.selectOption == 2
                                        ? Colors.white
                                        : null,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: CustomText(
                                          text: '최적',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15.0,
                                          color: algoValue.selectOption == 2
                                              ? Colors.orangeAccent
                                              : Colors.white,
                                        ),
                                      ),
                                      InkWell(onTap: () {
                                        algoValue.selectOption = 2;
                                        _handleSubmit();
                                      })
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: algoValue.selectOption == 3
                                        ? Colors.white
                                        : null,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: CustomText(
                                          text: '차도',
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15.0,
                                          color: algoValue.selectOption == 3
                                              ? Colors.orangeAccent
                                              : Colors.white,
                                        ),
                                      ),
                                      InkWell(onTap: () {
                                        algoValue.selectOption = 3;
                                        _handleSubmit();
                                      })
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // 출발지 목적지 box
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                        color: Colors.orangeAccent,
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // 출발지
                                Row(
                                  children: [
                                    Expanded(
                                      // 자동완성 기능을 제공하는 TypeAheadField 위젯 사용
                                      child: TypeAheadField(
                                        textFieldConfiguration:
                                        TextFieldConfiguration(
                                          cursorColor: Colors.orangeAccent,
                                            controller: firstController,
                                            focusNode: firstFocus,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding:
                                                const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                                hintText: '출발 지점을 입력하세요',
                                                hintStyle: const TextStyle(
                                                  fontFamily: 'Paybooc',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                filled: true,
                                                fillColor:
                                                const Color(0xffF9D5A8),
                                                suffixIcon: InkWell(
                                                  // x 버튼 터치 시 내용을 지운다
                                                  onTap: () {
                                                    firstController.text = "";
                                                  },
                                                  child: Icon(
                                                    Icons.cancel,
                                                    size: 20.0,
                                                    color: Colors.grey[600],
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
                                        const SuggestionsBoxDecoration(
                                            color: Color(0xffF9D5A8)),
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
                                            return SizedBox(
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
                                    // 지도 버튼 Align
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () async {
                                          Offset? result = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const SelectFromMap(
                                                    destination: false)),
                                          );
                                          setState(() {
                                            if (result != null) {
                                              firstController.text = "";
                                              algoValue.addSelectedFromMapNode(
                                                  result, '지도에서 선택한 출발지');
                                              firstController.text = '지도에서 선택한 출발지';
                                            }
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                                          // Add margin to all sides
                                          padding: const EdgeInsets.all(15.0),
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
/*                                Container(
                                  height: 1,
                                  color: Colors.orangeAccent,
                                ),*/
                                // 목적지
                                Row(
                                  children: [
                                    Expanded(
                                      child: TypeAheadField(
                                        textFieldConfiguration:
                                        TextFieldConfiguration(
                                          cursorColor: Colors.orangeAccent,
                                          controller: secondController,
                                          focusNode: secondFocus,
                                          decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                              border: InputBorder.none,
                                              hintText: '도착 지점을 입력하세요',
                                              hintStyle: const TextStyle(
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
                                                  color: Colors.grey[600],
                                                ),
                                              )),
                                        ),
                                        suggestionsCallback: (pattern) {
                                          return buildings.where((text) => text
                                              .toLowerCase()
                                              .contains(pattern.toLowerCase()));
                                        },
                                        suggestionsBoxDecoration:
                                        const SuggestionsBoxDecoration(
                                            color: Color(0xffF9D5A8)),
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
                                            return SizedBox(
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
                                                    const SelectFromMap(destination: true)),
                                          );
                                          setState(() {
                                            if (result != null) {
                                              secondController.text = "";
                                              algoValue.addSelectedFromMapNode(
                                                  result, '지도에서 선택한 도착지');
                                              secondController.text = '지도에서 선택한 도착지';
                                            }
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                                          // Add margin to all sides
                                          padding: const EdgeInsets.all(15.0),
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
                    ],
                  ),
                ),
                // 출발/목적지 설정 x -> 빈칸
                if (algoValue.isAstared == true) //A* 알고리즘이 작동했다면
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const SizedBox(width: 10.0),
                              const Icon(
                                Icons.access_time,
                                color: Colors.blueAccent,
                              ),
                              const SizedBox(width: 15.0),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${algoValue.totalWeight ~/ 60}',
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 20,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: '분',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' ${(algoValue.totalWeight % 60).toInt()}',
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 20,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const TextSpan(
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
                              const SizedBox(
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
                              const SizedBox(
                                width: 8.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: algoValue.meridiem,
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' ${algoValue.hour >= 10 ? '${algoValue.hour}' : '0${algoValue.hour}'}',
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ':',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${algoValue.arrivetime.substring(3,5)} ',
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15,
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const TextSpan(
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
                if (algoValue.isAstared == false)  // A* 알고리즘이 아직 돌아가지 않았을 때
                  Expanded(
                    child: Container(
                      child: Center(
                        child:
                            ((firstController.text == secondController.text) &&
                                    isExistBuilding(firstController.text))
                                ? CustomText(
                                    text: "출발지와 목적지가 같습니다.",
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
                // A* 알고리즘이 돌아갔을 때 search_screen에서 상세 안내
                else if (algoValue.isAstared == true)
                  Expanded(
                    child: DetailList(
                      items: algoValue.finalDetailPath,
                      direction:
                          algoValue.detailDirection,
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
                        if (algoValue.isAstared == false) {
                          // 경로를 찾지 않은 경우
                          guideStartFail(context);
                        } else {
                          for (String key in nowFloorData.keys) {
                            if (nowFloorData[key] != 0) nowFloorData[key] = 0;
                          }
                          for (String key in buildingFilePath.keys) {
                            buildingFilePath[key] = originalData[key]!;
                          }
                          guideStart();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent, // 주황색 배경색
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16), // 버튼 모서리를 둥글게 처리
                        ),
                      ),
                      child: CustomText(
                        text: '경로 안내 시작하기',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
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
}
