import 'package:flutter/material.dart';
import 'dart:async';

import 'base.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SplashPageState();
  }
}

/**
 *
 * 图片填充整个布局的方式,另一种方式为ConstrainedBox
 */
class _SplashPageState extends State<SplashPage> {

  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = new Timer(new Duration(milliseconds: 1500), () {
      Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
          builder: (BuildContext context) => new MainPage()), (
          Route route) => route == null);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Image.asset(
        "images/main_splash_bg.webp",
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        fit: BoxFit.cover,
      ),
    );
  }
}
