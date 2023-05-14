import 'package:flutter/material.dart';
import 'package:Dubeogi/algorithm/astar.dart';

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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 20,
                  height: 20,
                ),
                Text(widget.items[index].name),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 20,
                  height: 5,
                ),
                Text(widget.direction[index]),// 항목별로 표시되는 텍스트
              ],
            );
          },
        ),
      ),
    );
  }
}