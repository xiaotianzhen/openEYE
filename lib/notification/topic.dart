import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_eye/notification/topic_child.dart';

import 'bean/category_entity.dart';

class TopicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TopicPageState();
  }
}

class _TopicPageState extends State<TopicPage> {
  List<dynamic> categoryList;
  List<Tab> tabs;

  @override
  void initState() {
    super.initState();
    categoryList = new List<dynamic>();
    tabs = new List<Tab>();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    print("tabs length" + tabs.length.toString());
    return new Scaffold(
      body: new DefaultTabController(
          length: tabs.length,
          child: new Column(
            children: <Widget>[
              tabs.length == 0
                  ? new Center(
                      child: new Text("加载中..."),
                    )
                  : new TabBar(
                      isScrollable: true,
                      tabs: tabs,
                      labelColor: Colors.black,
                    ),
              new Expanded(
                  child: tabs.length == 0
                      ? new Center(
                          child: new Text("加载中..."),
                        )
                      : new TabBarView(
                          children: tabs.map((Tab tab) {
                          for (int i = 0; i < tabs.length; i++) {
                            final CategoryTabinfoTablist item = categoryList[i];
                            if (item.name != null && item.name == tab.text) {
                              return new Center(
                                child: new TopicChildPage(item.apiUrl),
                              );
                            }
                          }
                          return new Text("数据错误");
                        }).toList()))
            ],
          )),
    );
  }

  void loadData() async {
    Map<String, dynamic> headers = {
      "Accept": "application/json",
      "User-Agent": "insomnia/6.4.1"
    };

    BaseOptions options =
        BaseOptions(headers: headers, responseType: ResponseType.plain);
    Dio dio = new Dio(options);
    Response response = await dio.get(BaseUrl.url);
    print("topic" + response.statusCode.toString());
    if (response.statusCode != 200) {
      return;
    }
    setState(() {
      String result = response.data.toString();
      CategoryEntity categoryEntity =
          CategoryEntity.fromJson(json.decode(result));
      for (int i = 0; i < categoryEntity.tabInfo.tabList.length; i++) {
        tabs.add(new Tab(
          text: categoryEntity.tabInfo.tabList[i].name,
        ));
        categoryList.add(categoryEntity.tabInfo.tabList[i]);
      }
    });
  }
}

class BaseUrl {
  static String url = "http://baobab.kaiyanapp.com/api/v7/tag/tabList";
}
