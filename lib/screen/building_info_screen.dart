import 'package:flutter/material.dart';
import 'package:Dubeogi/save/building_info.dart';
import 'package:Dubeogi/save/custom_text.dart';

class BuildingInfoScreen extends StatefulWidget {
  final String title;

  const BuildingInfoScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<BuildingInfoScreen> createState() => _BuildingInfoScreenState();
}

class _BuildingInfoScreenState extends State<BuildingInfoScreen> {
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
      appBar: AppBar(
        title: Text("동국대학교"),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/infophoto/${widget.title}.png',
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: CustomText(
              text: widget.title,
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 15.0, width: 20.0),
          // 2개의 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/search',
                    arguments: {'start': widget.title, 'end': ''},
                  );
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
                    CustomText(
                      text: '출발',
                      color: Colors.blue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 25),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search',
                      arguments: {'start': '', 'end': widget.title});
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
                    CustomText(
                      text: '도착',
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
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
                return InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: Column(
                      children: [
                        SizedBox(
                          height: 14,
                        ),
                        _displayedAmenities[index].icon,
                      ],
                    ),
                    title: CustomText(
                      text: '${_displayedAmenities[index].name}',
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                    subtitle: CustomText(
                      text: '${_displayedAmenities[index].description}',
                      color: Colors.grey,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                    ),
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
