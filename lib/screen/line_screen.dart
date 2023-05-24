import 'package:flutter/material.dart';
import 'package:Dubeogi/algorithm/astar.dart';
import 'dart:math';

class CustomListWidget extends StatefulWidget {
  final List<Node> items;
  final List<String> direction;

  CustomListWidget({required this.items, required this.direction});

  @override
  _CustomListWidgetState createState() => _CustomListWidgetState();
}

class _CustomListWidgetState extends State<CustomListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          IconData? icon;
          double angle = 0.0;

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

          return Row(
            children: [
              if (icon != null)
                Transform.rotate(
                  angle: angle, // -90도를 라디안으로 표현한 값
                  child: Icon(
                    icon,
                    color: Colors.blue,
                  ),
                ),
              SizedBox(width: icon == null ? 24.0 : 0.0),
              SizedBox(width: 8.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.items[index].name,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10.0),
                        Text(
                          widget.direction[index],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}