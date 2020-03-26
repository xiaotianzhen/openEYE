import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_eye/notification/bean/notification_entity.dart';

import '../screen_util.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _NotificationPageState();
  }
}

class _NotificationPageState extends State<NotificationPage> {
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
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final NotificationMessagelist item = items[index];
          return new Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: new IntrinsicHeight(
                child: new Row(
                  children: <Widget>[
                    new Image.network(
                      item.icon,
                      width: 30.0,
                      height: 30.0,
                    ),
                    new Expanded(
                        child: new Container(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(item.title,
                              style: new TextStyle(
                                  fontSize: 15.0, color: Colors.black)),
                          new Text(
                            dateFormate(item.date),
                            style: new TextStyle(
                                fontSize: 13.0, color: Colors.grey),
                          ),
                          new Expanded(
                            child: new Text(
                              item.content,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey,
                                  decoration: TextDecoration.none),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            ),
                          ),
                          new Container(
                              padding: EdgeInsets.only(top: 10.0),
                              child: new Divider(
                                height: 1.0,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ))
                  ],
                ),
              ));
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
      NotificationEntity notificationEntity = NotificationEntity.fromJson(data);
      for (int i = 0; i < notificationEntity.messageList.length; i++) {
        items.add(notificationEntity.messageList[i]);
      }
    });
  }

  String dateFormate(int time) {
    if (DateTime.fromMillisecondsSinceEpoch(time).day != 0) {
      return DateTime.fromMillisecondsSinceEpoch(time).day.toString() + "天前";
    } else if (DateTime.fromMillisecondsSinceEpoch(time).minute != 0) {
      return DateTime.fromMillisecondsSinceEpoch(time).day.toString() + "分钟前";
    } else {
      return "刚刚";
    }
  }
}

class BaseUrl {
  static String url = "http://baobab.kaiyanapp.com/api/v3/messages";
}