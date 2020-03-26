import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_eye/notification/bean/topic_entity.dart';

import 'bean/topic_viewmodel.dart';

class TopicChildPage extends StatefulWidget {
  String pageUrl;

  TopicChildPage(this.pageUrl);

  @override
  State<StatefulWidget> createState() {
    return new _TopicChildPageState(pageUrl);
  }
}

class _TopicChildPageState extends State<TopicChildPage> {
  String pageUrl;
  List<dynamic> items;

  _TopicChildPageState(this.pageUrl);

  @override
  void initState() {
    super.initState();
    items = new List<dynamic>();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final TopicViewModel item = items[index];
          return new Column(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(10.0),
                  child: IntrinsicHeight(
                    child: new Row(
                      children: <Widget>[
                        new Image.network(
                          item.coverUrl,
                          width: 70.0,
                          height: 70.0,
                        ),
                        new Expanded(
                            child: new Container(
                              padding: EdgeInsets.only(left: 10.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Expanded(
                                  flex: 1,
                                  child: new Text(
                                    item.title,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 14,
                                        decoration: TextDecoration.none),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                  )),
                              new Text(item.description==null?"":item.description),
                            ],
                          ),
                        )),
                      ],
                    ),
                  )),
              Divider(
                height: 1.0,
                indent: 10.0,
                endIndent: 10.0,
                color: Colors.grey,
              ),
            ],
          );
        },
        itemCount: items != null ? items.length : 0,
      ),
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
    Response response = await dio.get(pageUrl);
    if (response.statusCode != 200) {
      return;
    }
    setState(() {
      String result = response.toString();
      Map<String, dynamic> data = json.decode(result);
      TopicEntity topicEntity = TopicEntity.fromJson(data);
      for (int i = 0; i < topicEntity.itemList.length; i++) {
        items.add(new TopicViewModel(
            coverUrl: topicEntity.itemList[i].data.icon,
            title: topicEntity.itemList[i].data.title,
            description: topicEntity.itemList[i].data.description));
      }
    });
  }
}
