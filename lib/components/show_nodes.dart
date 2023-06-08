import 'package:Dubeogi/provider/map_value.dart';
import 'package:Dubeogi/save/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Dubeogi/provider/map_value.dart';

// sidebar에서 더블 탭 시 나오는 노드 이름과 동그라미

class ShowNodes extends StatelessWidget{
  late MapValue mapvalue;

  @override
  Widget build(BuildContext context){
    mapvalue = Provider.of<MapValue>(context, listen: true);
    return Container(
      child: Column(
        children: [
          Center(
            child: CustomText(
              text: 'NODE NAME',
              fontSize: 6.0/mapvalue.scale,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Container(
            width: 100,
            height: 5,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                    color: Colors.red,
                    width: 0.5
                )
            ),
          ),
        ],
      ),
    );
  }
}