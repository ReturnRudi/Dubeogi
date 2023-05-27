import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Dubeogi/provider/algo_value.dart';
import 'package:Dubeogi/screen/home_screen.dart';
import 'package:Dubeogi/screen/find_screen.dart';
import 'package:Dubeogi/screen/search_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AlgoValue()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/find': (context) => FindScreen(),
          '/search': (context) => SearchScreen(),
        },
      ),
    ),
  );
}
