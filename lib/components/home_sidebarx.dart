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
  })  : _controller = controller,
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
              mapvalue.isRequired = false;
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
            if (previous == -1 || previous == i) {
              //
              tapcount++;
            }
            if (tapcount % 2 == 0) {
              mapvalue.scale = 6.0;
              print(
                  'check: (${algovalue.homeResult[i].x},${algovalue.homeResult[i].y})');
              mapvalue.position = Offset(
                  algovalue.homeResult[i].x, algovalue.homeResult[i].y - 50);
              mapvalue.guideX = algovalue.homeResult[i].x;
              mapvalue.guideY = algovalue.homeResult[i].y;
              mapvalue.isRequired = true;
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
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
      return FutureBuilder<void>(
        future: Future.delayed(Duration(milliseconds: 400)),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: 50.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.blueAccent,
                  ),
                  Text(
                    '시간',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 12,
                      fontFamily: 'Paybooc',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          }
          else {
            if (extended == true)
              return Container(
                  color: Colors.white.withOpacity(0.9),
                  height: 100,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                          child: Column(
                            children: [
                              SizedBox(height: 3.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.blueAccent,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    '출발 : ${algovalue.startNodeName}\n도착 : ${algovalue.endNodeName}',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 12,
                                      fontFamily: 'Paybooc',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                          '${(algovalue.totalWeight / 60).toInt()}',
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
                                          text:
                                          ' ${(algovalue.totalWeight % 60).toInt()}',
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
                                  SizedBox(width: 10.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 20.0,
                                    width: 3.0,
                                  ),
                                  SizedBox(width: 10.0),
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
                                          text: algovalue.arrivetime.substring(3, 5) +
                                              ' ',
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
            else
              return Container(
                height: 50.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.blueAccent,
                    ),
                    Text(
                      '시간',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 12,
                        fontFamily: 'Paybooc',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      );
    },
      items: [
        ...makeList(),
      ],
      footerBuilder: (context, extended) {
        return Container(
          width: MediaQuery.of(context).size.width,
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
