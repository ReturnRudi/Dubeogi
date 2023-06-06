import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

import 'package:Dubeogi/components/end_alert.dart';
import 'package:Dubeogi/provider/algo_value.dart';
import 'package:Dubeogi/provider/map_value.dart';
import 'package:Dubeogi/save/custom_text.dart';

class HomeSidebarX extends StatelessWidget {
  late AlgoValue algovalue;
  late MapValue mapvalue;

  final SidebarXController _controller;
  final double scale_offset;
  int tapcount = 0;
  int previous = -1;

  HomeSidebarX({
    Key? key,
    required SidebarXController controller,
    required this.scale_offset,
  })
      : _controller = controller,
        super(key: key);

  void endGuide(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return EndAlert(
            title: '종료?',
            message: '진짜로?',
            onOption1Pressed: () {
              algovalue.erase();
              algovalue.isRequired = false;
              Navigator.pop(context);
            },
            onOption2Pressed: () {
              Navigator.pop(context);
            },
          );
        });
  }

  List<SidebarXItem> makeList() {
    IconData? icon;
    double angle = 0.0;
    List<SidebarXItem> items = [];
    for (int i = 0; i < algovalue.homeResult.length; i++) {
      if (algovalue.homeDirection[i].contains("크게 왼쪽")) {
        icon = Icons.arrow_back;
      } else if (algovalue.homeDirection[i].contains("크게 오른쪽")) {
        icon = Icons.arrow_forward;
      } else if (algovalue.homeDirection[i].contains("왼쪽")) {
        icon = Icons.arrow_back;
        angle = pi / 4;
      } else if (algovalue.homeDirection[i].contains("오른쪽")) {
        icon = Icons.arrow_forward;
        angle = -pi / 4;
      } else if (algovalue.homeDirection[i].contains("출발지") ||
          algovalue.homeDirection[i].contains("목적지")) {
        icon = Icons.place;
        angle = 0.0;
      } else {
        icon = Icons.arrow_upward_rounded;
        angle = 0.0;
      }
      items.add(
        SidebarXItem(
          iconWidget: Transform.rotate(
            angle: angle,
            child: Icon(
              icon,
              color: Colors.blue,
            ),
          ),
          label: algovalue.homeResult[i].name,
          onTap: () {
            if(previous == -1 || previous == i){ //
              tapcount++;
            }
            if (tapcount % 2 == 0) {
              mapvalue.scale = 6.0;
              print('check: (${algovalue.homeResult[i].x},${algovalue
                  .homeResult[i].y})');
              mapvalue.position = Offset(algovalue.homeResult[i].x, algovalue.homeResult[i].y - 50);
            }
            Timer(Duration(milliseconds: 500), () {
              tapcount = 0;
              previous = -1;
            });
            previous = i;
          },
        ),
      );
    }
    return items;
  }


  @override
  Widget build(BuildContext context) {
    tapcount = 0;
    algovalue = Provider.of<AlgoValue>(context, listen: true);
    mapvalue = Provider.of<MapValue>(context, listen: true);
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        //margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: Colors.black,
        textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.orange.withOpacity(0.7),
          ),
          /*gradient: const LinearGradient(
            colors: [Color(0xFF3E3E61), Color(0xFF2E2E48)],
          ),*/
          color: Colors.orange.withOpacity(0.8),
        ),
        iconTheme: IconThemeData(
          color: Colors.blue.withOpacity(0.8),
          size: 24,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.8),
          size: 24,
        ),
      ),
      extendedTheme: SidebarXTheme(
        width: 270,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return Container(
            color: Colors.black.withOpacity(0.9),
            height: 100,
            width: double.infinity,
            child: Center(
              child: CustomText(
                text: 'total_weight: ${(algovalue.homeWeight / 60).toInt()}분 '
                    '${(algovalue.homeWeight % 60).toInt()}초, 약 ${(algovalue.homeWeight / 60).toInt() + 1}분',
                fontSize: 10.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )
        );
        /*SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('${algovalue.startNodeName} to ${algovalue.endNodeName}'),
          ),
        );*/
      },
      items: [
        ...makeList(),
      ],
      footerBuilder: (context, extended) {
        return Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange.withOpacity(0.8),
            ),
            onPressed: () => endGuide(context),
            child: CustomText(
              text: '안내종료',
              fontWeight: FontWeight.w700,
              fontSize: 11.0,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}

final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);