import 'package:flutter/material.dart';
import 'package:open_eye/notification/interact.dart';
import 'package:open_eye/notification/notification.dart';
import 'package:open_eye/notification/topic.dart';

class MorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MorePageState();
  }
}

class _MorePageState extends State<MorePage> {
  List<Tab> tabs = <Tab>[
    Tab(
      text: "主题",
    ),
    Tab(
      text: "推送",
    ),
    Tab(
      text: "互动",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new DefaultTabController(
          length: tabs.length,
          child: new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                  width: 180.0,
                  child: new TabBar(
                    tabs: tabs,
                    labelColor: Colors.black,
                  ),
                ),
                new Expanded(
                    child: new TabBarView(
                        children: tabs.map((Tab tab) {
                  if (tab.text == "主题") {
                    return new TopicPage();
                  } else if (tab.text == "推送") {
                    return new NotificationPage();
                  } else if (tab.text == "互动") {
                    return new InteractPage();
                  } else {
                    return new TopicPage();
                  }
                }).toList()))
              ],
            ),
          )),
    ));
  }
}
