import 'package:flutter/material.dart';
import 'package:Dubeogi/component/appbar.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:Dubeogi/algorithm/astar.dart';
import 'line_screen.dart';
import 'package:Dubeogi/save/save.dart';
import 'dart:math';
import 'package:Dubeogi/screen/select_from_map.dart';

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
  List<Node> result = [];
  late List<Node> temp;
  List<String> direction = [];
  List<Vec> vector = [];
  List<Offset> startPoints = [];
  List<Offset> endPoints = [];
  final firstFocus = FocusNode();
  final secondFocus = FocusNode();
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  int selectOption = 1;
  int count = 0;
  int check = 0;
  Graph? newGraph;

  Graph selectFromMapNewGraph(String newName, double dx, double dy, Node closest) {
    Graph newGraph = Graph();
    newGraph.nodes = List.from(graph.nodes);
    newGraph.edges = List.from(graph.edges);
    double weight = sqrt((dx - closest.x) * (dx - closest.x) + (dy - closest.y) * (dy - closest.y));
    int weight_int = weight.toInt();

    newGraph.addEdge(closest.name, newName, weight_int, "평지", "도보",
        node2X: dx,
        node2Y: dy,
        isInside2: 0,
        building2: "실외",
        showRoute2: false);
    newGraph.addEdge(newName, closest.name, weight_int, "평지", "도보");

    return newGraph;
  }

  Node? findClosestNode(List<Node> nodes, double dx, double dy) {
    Node? closest;
    double closestDistance = double.infinity;

    for (Node node in nodes) {
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

/*  List<Node> Astar_pathMaking(String startNodeName, String endNodeName) {
    //시작 노드와 도착 노드를 매개변수로 받아 Astar 알고리즘을 돌린 후 reconstructPath를 통해 경로를 리스트에 순서대로 저장한 후
    //지도 위에 그림을 그릴 수 있도록 start, end 리스트에 x, y값을 각각 넣는다.

    startPoints.clear();
    endPoints.clear();
    startNodes.clear();
    endNodes.clear();

    Node startNode = graph.findNode(startNodeName);
    Node endNode = graph.findNode(endNodeName);

    int startIndex = graph.findNodeIndex(graph.nodes, startNodeName);
    int endIndex = graph.findNodeIndex(graph.nodes, endNodeName);

    // Regular search
    var regularResult =
    graph.aStar(graph.nodes, graph.edges, startNode, endNode);
    List<int> regularDist = regularResult.item1;
    List<int> regularPrev = regularResult.item2;

    List<Node> regularPath =
    reconstructPath(regularPrev, graph.nodes, startIndex, endIndex);

    for (int i = 0; i < regularPath.length; i++) {
      if (i == 0)
        startNodes.add(regularPath[i]);
      else if (i == regularPath.length - 1)
        endNodes.add(regularPath[i]);
      else {
        endNodes.add(regularPath[i]);
        startNodes.add(regularPath[i]);
      }
    }

    for (int i = 0; i < startNodes.length; i++) {
      print(
          "(${startNodes[i].x}, ${startNodes[i].y}) -> (${endNodes[i].x}, ${endNodes[i].y})");
      print("!!!!");
    }
    return regularPath;
  }*/

  List<Node> Astar_pathMaking(Graph graph, String startNodeName, String endNodeName, bool clear) {
    //clear가 true면 clear(), false면 clear() 안함
    if(clear == true){
      startPoints.clear();
      endPoints.clear();
    }
    startNodes.clear();
    endNodes.clear();

    Node startNode = graph.findNode(startNodeName);
    Node endNode = graph.findNode(endNodeName);

    int startIndex = graph.findNodeIndex(graph.nodes, startNodeName);
    int endIndex = graph.findNodeIndex(graph.nodes, endNodeName);

    var regularResult =
    graph.aStar(graph.nodes, graph.edges, startNode, endNode);
    List<int> regularDist = regularResult.item1;
    List<int> regularPrev = regularResult.item2;

    List<Node> regularPath =
    reconstructPath(regularPrev, graph.nodes, startIndex, endIndex);

    if(clear == true){
      for (int i = 0; i < regularPath.length; i++) {
        if (i == 0)
          startNodes.add(regularPath[i]);
        else if (i == regularPath.length - 1)
          endNodes.add(regularPath[i]);
        else {
          endNodes.add(regularPath[i]);
          startNodes.add(regularPath[i]);
        }
      }
    }

/*    for (int i = 0; i < startNodes.length; i++) {
      print(
          "(${startNodes[i].x}, ${startNodes[i].y}) -> (${endNodes[i].x}, ${endNodes[i].y})");
      print("!!!!");
    }*/
/*    for (int i = 0; i < startNodes.length; i++) {
      //실내 노드를 넣을 때 이곳을 수정해야함
      if (startNodes[i].isInside == 0 && endNodes[i].isInside == 0) {
        //엣지의 출발지, 도착지가 모두 밖일 때만 우선 startPoints, endPoints에 넣어서 외부 경로만 보이도록 한다.
        startPoints.add(Offset(startNodes[i].x, startNodes[i].y));
        endPoints.add(Offset(endNodes[i].x, endNodes[i].y));
      }
    }*/

    return regularPath;
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
    if (arguments != null && count == 0) {
      firstController.text = arguments['start'] ?? '';
      secondController.text = arguments['end'] ?? '';
      count++;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: '동국대학교',
      ),
      body: Column(
        children: [
          Container(
              height: 60,
              color: Colors.orange,
              child: Stack(
                children: [
                  Row(  //최단, 최적, 차도 Row
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
                                  color: selectOption == 1 ? Colors.orange : Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            InkWell(onTap: () {
                              setState(() {
                                selectOption = 1;
                                if ((isExistBuilding(firstController.text) || isExistSelectFromMap(firstController.text))
                                    && (isExistBuilding(secondController.text) || isExistSelectFromMap(secondController.text))) {
                                  _handleSubmit();
                                }
                              });
                            })
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: selectOption == 1 ? Colors.white : null,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
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
                                  color: selectOption == 2 ? Colors.orange : Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            InkWell(onTap: () {
                              setState(() {
                                selectOption = 2;
                                if ((isExistBuilding(firstController.text) || isExistSelectFromMap(firstController.text))
                                    && (isExistBuilding(secondController.text) || isExistSelectFromMap(secondController.text))) {
                                  _handleSubmit();
                                }
                              });
                            })
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: selectOption == 2 ? Colors.white : null,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
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
                                  color: selectOption == 3 ? Colors.orange : Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            InkWell(onTap: () {
                              setState(() {
                                selectOption = 3;
                                if ((isExistBuilding(firstController.text) || isExistSelectFromMap(firstController.text))
                                    && (isExistBuilding(secondController.text) || isExistSelectFromMap(secondController.text))) {
                                  _handleSubmit();
                                }
                              });
                            })
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: selectOption == 3 ? Colors.white : null,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  )
                ],
              )),
          Container(  //출발,도착 지점 입력 Container
            padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            color: Colors.orange,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                  hintText: '출발 지점을 입력하세요',
                                  filled: true,
                                  fillColor: const Color(0xffF9D5A8),
                                  hintStyle: TextStyle(
                                    fontFamily: 'Paybooc',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                onSubmitted: (_) {
                                  FocusScope.of(context).requestFocus(secondFocus);
                                }),
                            suggestionsCallback: (pattern) {
                              return buildings.where((text) => text
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase()));
                            },
                            suggestionsBoxDecoration: SuggestionsBoxDecoration(color: const Color(0xffF9D5A8)),
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: Text(suggestion,
                                  style: TextStyle(
                                    fontFamily: 'Paybooc',
                                    fontWeight: FontWeight.w400,
                                  ),),
                              );
                            },
                            onSuggestionSelected: (suggestion) {
                              setState(() {
                                firstController.text = suggestion;
                                if ((isExistBuilding(firstController.text) || isExistSelectFromMap(firstController.text))
                                    && (isExistBuilding(secondController.text) || isExistSelectFromMap(secondController.text))) {
                                  _handleSubmit();
                                } else {
                                  setState(() {
                                    check = 0;
                                  });
                                }
                              });
                            },
                            noItemsFoundBuilder: (context) {
                              if (firstController.text == '지도에서 선택한 출발지') {
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
                                        fontFamily: 'Paybooc',
                                        fontWeight: FontWeight.w700,
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
                                  MaterialPageRoute(builder: (context) => SelectFromMap(destination: false)),
                                );
                                setState(() {
                                  if (result != null) {
                                    //firstController.text = '${result.dx}, ${result.dy}';
                                    firstController.text = '지도에서 선택한 출발지';
                                    double dx_pixel = 1500 - result.dx;
                                    double dy_pixel = 5333/2 - result.dy;
                                    Node? closestNode = findClosestNode(graph.nodes, dx_pixel, dy_pixel);
                                    if (closestNode == null) {
                                      throw Exception('No closest node found.');
                                    } else {
                                      if (newGraph == null) {
                                        newGraph = selectFromMapNewGraph(firstController.text, dx_pixel, dy_pixel, closestNode);
                                      } else {
                                        double weight = sqrt((dx_pixel - closestNode.x) * (dx_pixel - closestNode.x) + (dy_pixel - closestNode.y) * (dy_pixel - closestNode.y));
                                        int weight_int = weight.toInt();
                                        int isExist = newGraph!.findNodeIndex(newGraph!.nodes, '지도에서 선택한 출발지');
                                        if(isExist != -1) {
                                          newGraph!.removeNode('지도에서 선택한 출발지');
                                        }

                                        newGraph!.addEdge(closestNode.name, firstController.text, weight_int, "평지", "도보",
                                            node2X: dx_pixel,
                                            node2Y: dy_pixel,
                                            isInside2: 0,
                                            building2: "실외",
                                            showRoute2: false);
                                        newGraph!.addEdge(firstController.text, closestNode.name, weight_int, "평지", "도보");
                                      }
                                      if ((isExistBuilding(firstController.text) || isExistSelectFromMap(firstController.text))
                                          && (isExistBuilding(secondController.text) || isExistSelectFromMap(secondController.text))) {
                                        _handleSubmit();
                                      } else {
                                        setState(() {
                                          check = 0;
                                        });
                                      }
                                    }
                                  }
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(5, 5, 10, 5), // Add margin to all sides
                                padding: EdgeInsets.all(15.0), // Add padding to the container
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10), // Add borderRadius
                                ),
                                child: Text('지도', style: TextStyle(color: Colors.white,
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
                                onSubmitted: (_) {
                                  if ((isExistBuilding(firstController.text) || isExistSelectFromMap(firstController.text))
                                      && (isExistBuilding(secondController.text) || isExistSelectFromMap(secondController.text))) {
                                    _handleSubmit();
                                  } else {
                                    setState(() {
                                      check = 0;
                                    });
                                  }
                                },
                                controller: secondController,
                                focusNode: secondFocus,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: '도착 지점을 입력하세요',
                                  filled: true,
                                  fillColor: const Color(0xffF9D5A8),
                                  hintStyle: TextStyle(
                                    fontFamily: 'Paybooc',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
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
                                  title: Text(suggestion,
                                    style: TextStyle(
                                      fontFamily: 'Paybooc',
                                      fontWeight: FontWeight.w400,
                                    ),),
                                );
                              },
                              onSuggestionSelected: (suggestion) {
                                setState(() {
                                  secondController.text = suggestion;
                                  if ((isExistBuilding(firstController.text) || isExistSelectFromMap(firstController.text))
                                      && (isExistBuilding(secondController.text) || isExistSelectFromMap(secondController.text))) {
                                    _handleSubmit();
                                  } else {
                                    setState(() {
                                      check = 0;
                                    });
                                  }
                                });
                              },
                              noItemsFoundBuilder: (context) {
                                if (firstController.text == '지도에서 선택한 도착지') {
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
                                          fontFamily: 'Paybooc',
                                          fontWeight: FontWeight.w700,
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
                                    MaterialPageRoute(builder: (context) => SelectFromMap(destination: true)),
                                  );
                                  setState(() {
                                    if (result != null) {
                                      //secondController.text = '${result.dx}, ${result.dy}';
                                      secondController.text = '지도에서 선택한 도착지';
                                      double dx_pixel = 1500 - result.dx;
                                      double dy_pixel = 5333/2 - result.dy;
                                      Node? closestNode = findClosestNode(graph.nodes, dx_pixel, dy_pixel);
                                      if (closestNode == null) {
                                        throw Exception('No closest node found.');
                                      } else {
                                        if (newGraph == null) {
                                          newGraph = selectFromMapNewGraph(secondController.text, dx_pixel, dy_pixel, closestNode);
                                        } else {
                                          double weight = sqrt((dx_pixel - closestNode.x) * (dx_pixel - closestNode.x) + (dy_pixel - closestNode.y) * (dy_pixel - closestNode.y));
                                          int weight_int = weight.toInt();
                                          int isExist = newGraph!.findNodeIndex(newGraph!.nodes, '지도에서 선택한 도착지');
                                          if(isExist != -1) {
                                            newGraph!.removeNode('지도에서 선택한 도착지');
                                          }

                                          newGraph!.addEdge(closestNode.name, secondController.text, weight_int, "평지", "도보",
                                              node2X: dx_pixel,
                                              node2Y: dy_pixel,
                                              isInside2: 0,
                                              building2: "실외",
                                              showRoute2: false);
                                          newGraph!.addEdge(secondController.text, closestNode.name, weight_int, "평지", "도보");
                                        }
                                        if ((isExistBuilding(firstController.text) || isExistSelectFromMap(firstController.text))
                                            && (isExistBuilding(secondController.text) || isExistSelectFromMap(secondController.text))) {
                                          _handleSubmit();
                                        } else {
                                          setState(() {
                                            check = 0;
                                          });
                                        }
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(5, 5, 10, 5), // Add margin to all sides
                                  padding: EdgeInsets.all(15.0), // Add padding to the container
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(10), // Add borderRadius
                                  ),
                                  child: Text('지도', style: TextStyle(color: Colors.white,
                                    fontFamily: 'Paybooc',
                                    fontWeight: FontWeight.w900,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                )
              ],
            ),
          ),
          if (check == 0)
            Expanded(
              child: Container(),
            )
          else if (check != 0)
            CustomListWidget(
              items: result,
              direction: direction,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 4.0),
            child: SizedBox(
              width: double.infinity,
              height: 35.0,
              child: ElevatedButton(
                onPressed: () {
                  handleInput();
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

  void handleInput() {
/*    String firstValue = firstController.text;
    String secondValue = secondController.text;*/
    Navigator.pop(context, {'selectOption': selectOption});
  }


  void _handleSubmit() {  //경로 텍스트 안내 영역
    // Perform some action with the inputs
    String start_node = firstController.text;
    String end_node = secondController.text;
    Graph activeGraph = newGraph ?? graph;
    print("start_node: $start_node   end_node: $end_node");
    if(selectOption == 1 || selectOption == 2){
      result = Astar_pathMaking(activeGraph, start_node, end_node, true);
      //추후 Astar_pathMaking이 수정되면 가중치를 selectOption에 따라 지정하게됨
      //result = Astar_pathMaking(start_node, end_node, selectOption);
    }
    else{ //selectOption == 3인 경우 즉 차도 탐색
      Node start = activeGraph.findNode(start_node);
      Node End = activeGraph.findNode(end_node);
      Graph driveway = activeGraph.includeEdgesByType("차도");
      Node? StartClosest = findClosestNode(driveway.nodes, start.x, start.y);
      Node? EndClosest = findClosestNode(driveway.nodes, End.x, End.y);
      temp = Astar_pathMaking(activeGraph, start.name, StartClosest!.name, true);
      //temp.removeLast();
      temp.addAll(Astar_pathMaking(driveway, StartClosest!.name, EndClosest!.name, false));
      //temp.removeLast();
      temp.addAll(Astar_pathMaking(activeGraph, EndClosest!.name, End.name, false));

      for (int i = 0; i < temp.length; i++) {
        if (!result.any((node) => node.name == temp[i].name)) {
          result.add(temp[i]);
        } else {
          int duplicateIndex = result.indexOf(temp[i]);
          result.removeRange(duplicateIndex + 1, result.length);
        }
      }
      endNodes.clear();
      startNodes.clear();
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
    }

    print("result: ");
    for (Node node in result) {
      print(node.toString());
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
      print(getDirection(vector[i], vector[i + 1]));
      direction.add(getDirection(vector[i], vector[i + 1]));
      print("????");
    }
    direction.add("목적지");

    setState(() {
      check = 1;
    });
  }
}
