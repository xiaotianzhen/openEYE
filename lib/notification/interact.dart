import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_eye/notification/bean/topic_entity.dart';

import 'bean/interact_entity.dart';
import 'bean/interact_viewmodel.dart';
import 'bean/topic_viewmodel.dart';

class InteractPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InteractPageState();
  }
}

class _InteractPageState extends State<InteractPage> {
  List<dynamic> items;

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
          final InteractViewModel item = items[index];
          return new Column(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(10.0),
                  child: new Row(
                    children: <Widget>[
                      new Image.network(
                        item.cover,
                        width: 70.0,
                        height: 70.0,
                      ),
                      new Expanded(
                          child: new Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              item.title,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.none),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                            new Text(item.viewNum.toString() +
                                "人浏览/" +
                                item.joinNum.toString() +
                                "人参与"),
                          ],
                        ),
                      )),
                    ],
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
    Response response = await dio.get(BaseUrl.url);
    if (response.statusCode != 200) {
      return;
    }
    setState(() {
      String result = response.toString();
      Map<String, dynamic> data = json.decode(result);
      InteractEntity interactEntity = InteractEntity.fromJson(data);
      for (int i = 0; i < interactEntity.itemList.length; i++) {
        items.add(new InteractViewModel(
            cover: interactEntity.itemList[i].data.imageUrl,
            title: interactEntity.itemList[i].data.title,
            joinNum: interactEntity.itemList[i].data.joinCount,
            viewNum: interactEntity.itemList[i].data.viewCount));
      }
    });
  }
}

class BaseUrl {
  static String url = "http://baobab.kaiyanapp.com/api/v7/topic/list";
}