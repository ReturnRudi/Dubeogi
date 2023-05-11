import 'package:flutter/material.dart';
import 'package:Dubeogi/component/appbar.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:Dubeogi/algorithm/astar.dart';
import 'line_screen.dart';
import 'package:Dubeogi/save/save.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  late List<Node> result;
  final firstFocus = FocusNode();
  final secondFocus = FocusNode();
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  int selectOption = 1;
  int count = 0;
  int check = 0;

  List<Node> getNodes(String startNodeName,String endNodeName){
    startNodes.clear();
    endNodes.clear();

    Node startNode = graph.findNode(startNodeName);
    Node endNode = graph.findNode(endNodeName);

    int startIndex = graph.findNodeIndex(graph.nodes, startNodeName);
    int endIndex = graph.findNodeIndex(graph.nodes, endNodeName);

    // Regular search
    var regularResult = graph.aStar(graph.nodes, graph.edges, startNode, endNode);
    List<int> regularPrev = regularResult.item2;

    List<Node> regularPath = reconstructPath(regularPrev, graph.nodes, startIndex, endIndex);

    return regularPath;
  }

  bool isExistBuilding(String name) => buildings.contains(name);

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (selectOption != 1)
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
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(onTap: () {
                                setState(() {
                                  selectOption = 1;
                                });
                              })
                            ],
                          ),
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      if (selectOption == 1)
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
                                    color: Colors.orange,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(onTap: () {
                                setState(() {
                                  selectOption = 1;
                                });
                              })
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      SizedBox(
                        width: 20,
                      ),
                      if (selectOption != 2)
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
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(onTap: () {
                                setState(() {
                                  selectOption = 2;
                                });
                              })
                            ],
                          ),
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      if (selectOption == 2)
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
                                    color: Colors.orange,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(onTap: () {
                                setState(() {
                                  selectOption = 2;
                                });
                              })
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      SizedBox(
                        width: 20,
                      ),
                      if (selectOption != 3)
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
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(onTap: () {
                                setState(() {
                                  selectOption = 3;
                                });
                              })
                            ],
                          ),
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      if (selectOption == 3)
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
                                    color: Colors.orange,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(onTap: () {
                                setState(() {
                                  selectOption = 3;
                                });
                              })
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                    ],
                  )
                ],
              )),
          Container(
            //padding: EdgeInsets.all(15),
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
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 10),
                                    hintText: '출발 지점을 입력하세요',
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
                              suggestionsBoxDecoration:
                                  SuggestionsBoxDecoration(
                                      color: const Color(0xffF9D5A8)),
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  title: Text(suggestion),
                                );
                              },
                              onSuggestionSelected: (suggestion) {
                                setState(() {
                                  firstController.text = suggestion;
                                  if (isExistBuilding(firstController.text) &&
                                      isExistBuilding(secondController.text)) {
                                    _handleSubmit();
                                  }
                                });
                              },
                              noItemsFoundBuilder: (context) {
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
                              },
                            ),
                          ],
                        )),
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
                                  if (isExistBuilding(firstController.text) &&
                                      isExistBuilding(secondController.text)) {
                                    _handleSubmit();
                                  }
                                  else{
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
                                  title: Text(suggestion),
                                );
                              },
                              onSuggestionSelected: (suggestion) {
                                setState(() {
                                  secondController.text = suggestion;
                                  if (isExistBuilding(firstController.text) &&
                                      isExistBuilding(secondController.text)) {
                                    _handleSubmit();
                                  }
                                });
                              },
                              noItemsFoundBuilder: (context) {
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
                              },
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
            CustomListWidget(items: result),
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
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // 주황색 배경색
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
    String firstValue = firstController.text;
    String secondValue = secondController.text;
    Navigator.pop(context, {'start': firstValue, 'end': secondValue});
  }

  void _handleSubmit() {
    // Perform some action with the inputs
    String start_node = firstController.text;
    String end_node = secondController.text;
    result = getNodes(start_node, end_node);
    /*for (Node node in result) {
      print(node.toString());
    }*/
    setState(() {
      check = 1;
    });

  }

}
