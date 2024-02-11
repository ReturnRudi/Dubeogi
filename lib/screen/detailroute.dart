import 'package:flutter/material.dart';

class DetailRoute extends StatelessWidget{
  const DetailRoute({Key? key,}):super(key:key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Text('hi'),
      ),
    );
  }
}