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
  ScrollController scrollController = new ScrollController();
  bool isRefreshing = false;
  bool isLoadingMore = false;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();
  var nextPageUrl="";

  @override
  void initState() {
    super.initState();
    items = new List<dynamic>();
    scrollController.addListener(_updateScrollPosition);
    loadData();
  }


  @override
  void dispose() {
    scrollController.removeListener(_updateScrollPosition);
    super.dispose();
  }

  void _updateScrollPosition(){
     bool isBottom=scrollController.position.pixels==scrollController.position.maxScrollExtent;
     if(!isRefreshing&&isBottom&&!isLoadingMore){
       setState(() {
         isRefreshing=false;
         isLoadingMore=true;
         _loadMore();
       });
     }
  }

  Future<Null> _loadMore() async{
    await new Future.delayed(Duration(seconds: 1));
    loadData();
    return null;
  }


   Future<Null> _handlerRefresh() async{
    if(!isLoadingMore){
      setState(() {
        isLoadingMore=false;
        isRefreshing=true;
      });
    }
    await new Future.delayed(Duration(seconds: 1));
    items.clear();
    loadData();
    scrollController.jumpTo(0.0);
    return null;
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:new RefreshIndicator(
          onRefresh: ()=>_handlerRefresh(),
          child:  ListView.builder(
            controller: scrollController,
            key: _refreshIndicatorKey,
            physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index == items.length) {
            return new Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5.0),
              child: new SizedBox(
                height: 40.0,
                width: 40.0,
                child: new Opacity(
                  opacity: isLoadingMore?1.0:0.0,
                  child: new CircularProgressIndicator(),
                ),
              ),
            );
          }
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
        itemCount: items != null ? items.length+1 : 0,
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
    Response response;
    if(isLoadingMore&&nextPageUrl.isNotEmpty){
       response = await dio.get(nextPageUrl);
    }else{
       response = await dio.get(BaseUrl.url);
    }

    if (response.statusCode != 200) {
      isLoadingMore=false;
      isRefreshing=false;
      return;
    }
    setState(() {
      String result = response.toString();
      Map<String, dynamic> data = json.decode(result);
      NotificationEntity notificationEntity = NotificationEntity.fromJson(data);
      nextPageUrl=notificationEntity.nextPageUrl;
      for (int i = 0; i < notificationEntity.messageList.length; i++) {
        items.add(notificationEntity.messageList[i]);
      }
      isLoadingMore=false;
      isRefreshing=false;
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