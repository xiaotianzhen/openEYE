import 'package:flutter/material.dart';
import 'package:open_eye/splash.dart';



void main() {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'openEye',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashPage(),
    );
  }
}