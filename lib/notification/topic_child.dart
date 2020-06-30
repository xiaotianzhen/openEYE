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
  ScrollController scrollController = new ScrollController();
  bool isRefreshing = false;
  bool isLoadingMore = false;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();
  var nextPageUrl="";

  _TopicChildPageState(this.pageUrl);

  @override
  void initState() {
    super.initState();
    items = new List<dynamic>();
    scrollController.addListener(_updateScrollPosition);
    loadData();
  }

  void _updateScrollPosition(){
    bool isBottom=scrollController.position.pixels==scrollController.position.maxScrollExtent;
    if(!isRefreshing&&isBottom&&!isLoadingMore){
      setState(() {
         isRefreshing=false;
         isLoadingMore=true;
         _loadmore();
      });
    }
  }


  @override
  void dispose() {
    scrollController.removeListener(_updateScrollPosition);
    super.dispose();
  }

  Future<Null> _loadmore() async{
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
      body: new RefreshIndicator(
          onRefresh: ()=>_handlerRefresh(),
          child: new ListView.builder(
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
    if(nextPageUrl.isNotEmpty&&isLoadingMore){
       response = await dio.get(nextPageUrl);
    }else{
       response = await dio.get(pageUrl);
    }

    if (response.statusCode != 200) {
       isRefreshing=false;
       isLoadingMore=false;
      return;
    }
    setState(() {


      String result = response.toString();
      Map<String, dynamic> data = json.decode(result);
      TopicEntity topicEntity = TopicEntity.fromJson(data);
      nextPageUrl=topicEntity.nextPageUrl;
      for (int i = 0; i < topicEntity.itemList.length; i++) {
        items.add(new TopicViewModel(
            coverUrl: topicEntity.itemList[i].data.icon,
            title: topicEntity.itemList[i].data.title,
            description: topicEntity.itemList[i].data.description));
      }
      isRefreshing=false;
      isLoadingMore=false;
    });
  }
}
