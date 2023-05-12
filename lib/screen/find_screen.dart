import 'package:flutter/material.dart';
import '../component/appbar.dart';
import 'package:Dubeogi/save/save.dart';
import 'package:Dubeogi/save/building_info.dart';

// 검색창을 누르면 나오는 스크린.

class FindScreen extends StatefulWidget {
  const FindScreen({Key? key}) : super(key: key);

  @override
  State<FindScreen> createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  final Controller = TextEditingController();
  String result = '';
  dynamic getdata;

  // 해당 건물이 존재하는지 확인
  bool isExistBuilding(String name) => buildings.contains(name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: '동국대학교',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                // 1. 상단 안내문구/박스
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: 200.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: '검색하거나 아래 목록을 터치하세요',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: Controller,
                      ),
                    ),
                  ),
                ),
                // end 1

                // 2. 건물 검색 버튼
                Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      result = Controller.text;
                      if (isExistBuilding(result) == true) {
                        getdata = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                BuildingInfo(
                                  title: result,
                                ),
                          ),
                        );
                        setState(() {
                            Navigator.pop(context, getdata);
                        });
                      } else {
                        print('debug: isExistBuilding false');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Alert"),
                              content: Text("Content"),
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
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.apartment_rounded,
                        ),
                        Text(
                          '건물 검색',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // end 2
              ],
            ),
            SizedBox(height: 16.0),
            // 3. 검색창 아래 뜨는 터치할 수 있는 리스트뷰(건묾명 등)
            Expanded(
              child: ListView.builder(
                itemCount: buildings.length,
                itemBuilder: (context, index) {
                  final name = buildings[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Controller.text = name;
                      });
                    },
                    child: ListTile(
                      title: Text(name),
                      //subtitle: Text('$name'),
                    ),
                  );
                },
              ),
            ),
            // end 3
          ],
        ),
      ),
    );
  }
}

//--------------------------------------------------------------

class BuildingInfo extends StatefulWidget {
  final String title;

  const BuildingInfo({Key? key, required this.title}) : super(key: key);

  @override
  State<BuildingInfo> createState() => _BuildingInfoState();
}

class _BuildingInfoState extends State<BuildingInfo> {
  dynamic getdata;
  late BuildingInfoDetail _buildingInfoDetail;
  late List<Amenity> _displayedAmenities;

  @override
  void initState() {
    super.initState();
    _buildingInfoDetail = _getBuildingInfoDetail(widget.title);
    _displayedAmenities = [
      Amenity(
          icon: Icon(Icons.phone),
          name: '전화번호',
          description: _buildingInfoDetail.teleNumber),
      Amenity(
          icon: Icon(Icons.access_time),
          name: '이용시간',
          description: _buildingInfoDetail.operatingHours),
      ..._buildingInfoDetail.amenities,
    ];
  }

  BuildingInfoDetail _getBuildingInfoDetail(String title) {
    for (BuildingInfoDetail building in BuildingInfoDetails) {
      if (building.name == title) {
        return building;
      }
    }
    throw Exception("해당 건물이 없습니다.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "동국대학교",
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/photo/${widget.title}.png',
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15.0, width: 20.0),
          // 2개의 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () async {
                  getdata = await Navigator.pushNamed(
                    context,
                    '/search',
                    arguments: {'start': widget.title, 'end': ''},
                  );
                  setState(() {
                      Navigator.pop(context, getdata);
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minimumSize: Size(100, 0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.directions_walk, color: Colors.blue),
                    SizedBox(width: 4),
                    Text('출발', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              SizedBox(width: 25),
              OutlinedButton(
                onPressed: ()  async {
                  getdata = await Navigator.pushNamed(
                    context,
                    '/search',
                    arguments: {'start': '', 'end': widget.title},
                  );
                  setState(() {
                    Navigator.pop(context, getdata);
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minimumSize: Size(100, 0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.directions_walk, color: Colors.white),
                    SizedBox(width: 4),
                    Text('도착', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Flexible(
            child: ListView.builder(
              itemCount: _displayedAmenities.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 60.0,
                  child: ListTile(
                    leading: _displayedAmenities[index].icon,
                    title: Text('${_displayedAmenities[index].name}'),
                    subtitle: Text('${_displayedAmenities[index].description}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}