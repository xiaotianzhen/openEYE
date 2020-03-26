import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:open_eye/community/recommend.dart';

import 'concern.dart';

class CommunityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CommunityPageState();
  }
}

class _CommunityPageState extends State<CommunityPage> {
  List<Tab> tab = <Tab>[
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "关注",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new DefaultTabController(
          length: tab.length,
          child: new Column(
            children: <Widget>[
              new Container(
                width: 120.0,
                child: new Center(
                    child: new TabBar(
                  tabs: this.tab,
                  labelColor: Colors.black,
                )),
              ),
              new Expanded(
                  child: new TabBarView(
                      children: tab.map((Tab tab) {
                if (tab.text == "推荐") {
                  return new RecommendPage();
                } else {
                  return new ConcernPage();
                }
              }).toList())),
            ],
          )),
    ));
  }
}
