import 'package:flutter/material.dart';
import 'package:Dubeogi/save/astar.dart';
import 'package:Dubeogi/save/custom_text.dart';
import 'dart:math';

// 노드 이름들과 방향을 받으면 이에 해당하는 리스트를 반환함
// = screen/line_screen
class DetailList extends StatefulWidget {
  final List<Node> items;
  final List<String> direction;

  const DetailList({super.key, required this.items, required this.direction});

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          IconData? icon;
          double angle = 0.0;

          // icon 정하고
          if (widget.direction[index].contains("크게 왼쪽")) {
            icon = Icons.arrow_back;
          }
          else if (widget.direction[index].contains("크게 오른쪽")) {
            icon = Icons.arrow_forward;
          }
          else if (widget.direction[index].contains("왼쪽")) {
            icon = Icons.arrow_back;
            angle = pi/4;
          }
          else if (widget.direction[index].contains("오른쪽")) {
            icon = Icons.arrow_forward;
            angle = -pi/4;
          }
          else if (widget.direction[index].contains("출발지") || widget.direction[index].contains("목적지")) {
            icon = Icons.place;
          }
          else{
            icon = Icons.arrow_upward_rounded;
          }
          // ----

          return ListTile(
            onTap: (){},
            leading: Transform.rotate(
              angle: angle,
              child: Icon(
                icon,
                color: Colors.blue,
              ),
            ),
            title: CustomText(
              text: widget.items[index].name,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
            subtitle: CustomText(
              text: widget.direction[index],
              color: Colors.grey,
              fontSize: 12.0,
              fontWeight: FontWeight.w800,
            ),
          );
        },
      ),
    );
  }
}