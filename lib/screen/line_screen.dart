import 'package:flutter/material.dart';
import 'package:Dubeogi/algorithm/astar.dart';

class CustomListWidget extends StatefulWidget {
  final List<Node> items;

  CustomListWidget({required this.items});

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
                Text(widget.items[index].name), // 항목별로 표시되는 텍스트
              ],
            );
          },
        ),
      ),
    );
  }
}