import 'package:flutter/material.dart';

import 'daily.dart';
import 'discover.dart';
import 'nominate.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Tab> tab = <Tab>[
    Tab(
      text: "发现",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "日报",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new DefaultTabController(
          length: tab.length,
          child: new Column(children: <Widget>[
            new HomeAppBar(tab: tab),
            new Expanded(
              child: new TabBarView(
                  children: tab.map((Tab tab) {
                    if (tab.text == "发现") {
                      return new DisCoverPage();
                    } else if (tab.text == "推荐") {
                      return new NominatePage();
                    } else {
                      return new DailyPage();
                    }
                  }).toList()),
            ),
          ]),
        ));
  }
}

class HomeAppBar extends StatefulWidget {
  List<Tab> tab;

  HomeAppBar({this.tab});

  @override
  State<StatefulWidget> createState() {
    return new _HomeAppBarState(tab: tab);
  }
}

class _HomeAppBarState extends State<HomeAppBar> {
  List<Tab> tab;

  _HomeAppBarState({this.tab});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: new Row(
        children: [
          new Icon(Icons.date_range),
          new Expanded(
              child: new Center(
            child: new Container(
              width: 200.0,
              height: 50,
              child: new TabBar(
                tabs: this.tab,
                labelColor: Colors.black,
              ),
            ),
          )),
          new Icon(Icons.search),
        ],
      ),
    );
  }
}
