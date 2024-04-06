import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Dubeogi/save/building_info.dart';
import 'package:Dubeogi/save/custom_text.dart';
import 'package:Dubeogi/provider/algo_value.dart';

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
  late AlgoValue algovalue;

  @override
  void initState() {
    super.initState();
    _buildingInfoDetail = _getBuildingInfoDetail(widget.title);
    _displayedAmenities = [
      Amenity(
          icon: const Icon(Icons.phone),
          name: '전화번호',
          description: _buildingInfoDetail.teleNumber),
      Amenity(
          icon: const Icon(Icons.access_time),
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
    algovalue = Provider.of<AlgoValue>(context, listen: true);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("동국대학교"),
      // ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'assets/images/infophoto/${widget.title}.png',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: CustomText(
                  text: widget.title,
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15.0, width: 20.0),
              // 2개의 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      algovalue.isDijkstra = false;
                      Navigator.pushNamed(
                        context,
                        '/search',
                        arguments: {'start': widget.title, 'end': ''},
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size(100, 0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.directions_walk, color: Colors.blue),
                        const SizedBox(width: 4),
                        CustomText(
                          text: '출발',
                          color: Colors.blue,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 25),
                  OutlinedButton(
                    onPressed: () {
                      algovalue.isDijkstra = false;
                      Navigator.pushNamed(context, '/search',
                          arguments: {'start': '', 'end': widget.title});
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size(100, 0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.directions_walk, color: Colors.white),
                        const SizedBox(width: 4),
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
              const SizedBox(height: 10),
              Flexible(
                child: ListView.builder(
                  itemCount: _displayedAmenities.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: Column(
                          children: [
                            const SizedBox(
                              height: 14,
                            ),
                            _displayedAmenities[index].icon,
                          ],
                        ),
                        title: CustomText(
                          text: _displayedAmenities[index].name,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        ),
                        subtitle: CustomText(
                          text: _displayedAmenities[index].description,
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
        ),
      ),
    );
  }
}
