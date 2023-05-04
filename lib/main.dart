import 'package:Dubeogi/screen/find_screen.dart';
import 'package:Dubeogi/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:Dubeogi/screen/home_screen2.dart';

// main
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/find': (context) => FindScreen(),
        '/search' : (context) => SearchScreen(),
      },
    ),
  );
}
