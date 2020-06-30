import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_eye/home/nominatebean/singletitle_viewmodel.dart';
import 'package:open_eye/home/nominatebean/text_card_entity.dart';
import 'package:open_eye/video/video_detail.dart';
import 'package:open_eye/video/videobean/videodetail_viewmodel.dart';

import 'nominatebean/follow_card_entity.dart';
import 'nominatebean/followcardviewmodel.dart';

class DailyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DailyPageState();
  }
}

class _DailyPageState extends State<DailyPage> {
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

  void _updateScrollPosition(){
    bool isBottom=scrollController.position.pixels==scrollController.position.maxScrollExtent;
    if(!isLoadingMore&&isBottom&&!isRefreshing){
      setState(() {
        isLoadingMore=true;
        isRefreshing=true;
        _loadMore();
      });
    }

  }

  Future<Null> _loadMore()async{

    await new Future.delayed(new Duration(seconds: 1));
    loadData();
    return null;
  }

  @override
  void dispose() {
    scrollController.removeListener(_updateScrollPosition);
    super.dispose();
  }

  Future<Null> _handleRefresh() async{
    if(!isLoadingMore){
      setState(() {
        isLoadingMore=false;
        isRefreshing=true;
      });
    }
    await new Future.delayed(new Duration(seconds: 1));
    items.clear();
    loadData();
    scrollController.jumpTo(0.0);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new RefreshIndicator(
        onRefresh: ()=>_handleRefresh(),
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
          final item = items[index];
          if (item is SingleTitleViewModel) {
            return new Container(
                padding: EdgeInsets.all(10.0),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: new Text(
                        item.titlel,
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    new Image.asset("images/common_title_right_icon.png"),
                  ],
                ));
          } else if (item is FollowCardViewModel) {
            VideoDetialViewModel videoDetailData = new VideoDetialViewModel(
                coverUrl: item.coverUrl,
                videoTime: item.videoTime,
                title: item.title,
                description: item.description,
                authorUrl: item.authorUrl,
                userDescription: item.userDescription,
                nickName: item.nickName,
                videoDescription: item.videoDescription,
                playerUrl: item.playerUrl,
                blurredUrl: item.blurredUrl,
                videoId: item.videoId,
                collectionCount: item.collectionCount,
                shareCount: item.collectionCount);

            return new Container(
              padding: EdgeInsets.all(10.0),
              child: new Column(
                children: <Widget>[
                  new GestureDetector(
                    child: new Image.network(item.coverUrl),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          new VideoDetailPage(videoDetailData),
                        ),
                      );
                    },
                  ),
                  new Container(
                    padding: EdgeInsets.all(10.0),
                    child: new Row(
                      children: <Widget>[
                        new Image.network(
                          item.authorUrl,
                          width: 50,
                          height: 50,
                        ),
                        new Expanded(
                            child: new Container(
                              padding: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(item.title),
                                  new Text(item.description),
                                ],
                              ),
                            )),
                        new Image.asset("images/common_share.png"),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            );
          } else {
            return new Text("数据格式异常");
          }
        },
        itemCount: items.length+1,
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
      response = await dio.get(BaseUrl.dailyUrl);
    }
    print(response.statusCode.toString());
    setState(() {
      String result = response.data.toString();

      Map<String, dynamic> data = json.decode(result);
      nextPageUrl = json.decode(json.encode(data["nextPageUrl"]).toString());
      List itemList = json.decode(json.encode(data["itemList"]).toString());
      itemList.asMap().keys.map((f) {
        switch (itemList[f]["type"]) {
          case "textCard":
            Map<String, dynamic> map =
                json.decode(json.encode(itemList[f]).toString());

            TextCardEntity textCardEntity = TextCardEntity.fromJson(map);
            if (textCardEntity.data.text != "今日社区精选") {
              items.add(
                  new SingleTitleViewModel(titlel: textCardEntity.data.text));
            }
            break;
          case "followCard":
            Map<String, dynamic> map =
                json.decode(json.encode(itemList[f]).toString());
            FollowCardEntity followCardEntity = FollowCardEntity.fromJson(map);
            parseFollowCardTwo(followCardEntity);
            break;
        }
      }).toList();
      isLoadingMore=false;
      isRefreshing=false;
    });
  }

  void parseFollowCardTwo(FollowCardEntity followCardEntity) {
    items.add(new FollowCardViewModel(
        coverUrl: followCardEntity.data.content.data.cover.detail,
        videoTime: followCardEntity.data.content.data.duration,
        authorUrl: followCardEntity.data.content.data.author.icon,
        description: followCardEntity.data.content.data.author.name +
            " / #" +
            followCardEntity.data.content.data.category,
        title: followCardEntity.data.content.data.title,
        videoDescription: followCardEntity.data.content.data.author.name,
        userDescription: followCardEntity.data.content.data.description,
        nickName: followCardEntity.data.content.data.author.description,
        playerUrl: followCardEntity.data.content.data.playUrl,
        blurredUrl: followCardEntity.data.content.data.cover.blurred,
        videoId: followCardEntity.data.content.data.id));
  }
}

class BaseUrl {
  static String dailyUrl = "http://baobab.kaiyanapp.com/api/v5/index/tab/feed";
}
