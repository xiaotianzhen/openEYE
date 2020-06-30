import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_eye/home/nominatebean/follow_card_entity.dart';
import 'package:open_eye/home/nominatebean/singletitle_viewmodel.dart';
import 'package:open_eye/home/nominatebean/text_card_entity.dart';
import 'package:open_eye/home/nominatebean/titleviewmodel.dart';
import 'package:open_eye/home/nominatebean/video_small_card_entity.dart';
import 'package:open_eye/home/nominatebean/videocard_viewmodel.dart';
import 'package:open_eye/video/video_detail.dart';
import 'package:open_eye/video/videobean/videodetail_viewmodel.dart';

import 'nominatebean/followcardviewmodel.dart';
import 'nominatebean/nominate_bean_entity.dart';

class NominatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _NominatePageState();
  }
}

class _NominatePageState extends State<NominatePage> {
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
     if(!isRefreshing&&isBottom&&!isLoadingMore){
        setState(() {
          isRefreshing=false;
          isLoadingMore=true;
          _loadMore();
        });
     }
  }

  Future<Null> _loadMore() async{
    await new Future.delayed(new Duration(seconds: 1));
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

    await new Future.delayed(new Duration(seconds: 1));
    items.clear();
    loadData();
    scrollController.jumpTo(0.0);
    return null;
  }

  @override
  void dispose() {
    scrollController.removeListener(_updateScrollPosition);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:new RefreshIndicator(
          onRefresh: ()=>_handlerRefresh(),
          child: new ListView.builder(
        key: _refreshIndicatorKey,
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
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
          if (item is TitileViewModel) {
            print("TitileViewModel");
            return new Container(
                padding: EdgeInsets.all(10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      item.title,
                      style: new TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    new Container(
                      child: new Row(
                        children: <Widget>[
                          new Text(item.actionTitle),
                          new Image.asset("images/common_action_right.png",
                              fit: BoxFit.cover)
                        ],
                      ),
                    )
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
                          builder: (context) => new VideoDetailPage(videoDetailData),
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
                        new Image.asset("images/common_share.png",
                            fit: BoxFit.cover),
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
          } else if (item is VideoCardViewModel) {
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
                category: item.category,
                collectionCount: item.collectionCount,
                shareCount: item.collectionCount);

            return new Container(
              padding: EdgeInsets.all(10.0),
              child: new Row(
                children: <Widget>[
                  new GestureDetector(
                    child: new Image.network(
                      item.coverUrl,
                      width: 160.0,
                      height: 120.0,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => new VideoDetailPage(videoDetailData),
                        ),
                      );
                    },
                  ),
                  new Expanded(
                      child: new Container(
                        height: 120,
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
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Text(item.description),
                                new Image.asset("images/common_share.png",
                                    fit: BoxFit.cover),
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
            );
          } else if (item is SingleTitleViewModel) {
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
                    new Image.asset("images/common_title_right_icon.png",
                        fit: BoxFit.cover),
                  ],
                ));
          } else {
            return new Text("数据出错");
          }
        },
        itemCount: items != null ? items.length +1: 0,
      )) ,
    );
  }

  void loadData() async {
    try {
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
      print("responsecode: " + response.statusCode.toString());
      setState(() {
        String result = response.data.toString();
        Map<String, dynamic> data = json.decode(result);
        print(data["itemList"].toString());
        nextPageUrl= json.decode(json.encode(data["nextPageUrl"]).toString());
        List itemList = json.decode(json.encode(data["itemList"]).toString());

        itemList.asMap().keys.map((f) {
          switch (itemList[f]['type']) {
            case "squareCardCollection":
              Map<String, dynamic> map =
                  json.decode(json.encode(itemList[f]).toString());

              NominateBeanItemlist nominateBeanItemlist =
                  NominateBeanItemlist.fromJson(map);

              parseCollectCard(nominateBeanItemlist);
              break;
            case "textCard":
              Map<String, dynamic> map =
                  json.decode(json.encode(itemList[f]).toString());

              TextCardEntity textCardEntity = TextCardEntity.fromJson(map);
              items.add(
                  new SingleTitleViewModel(titlel: textCardEntity.data.text));
              break;
            case "videoSmallCard":
              Map<String, dynamic> map =
                  json.decode(json.encode(itemList[f]).toString());
              VideoSmallCardEntity videoSmallCardEntity =
                  VideoSmallCardEntity.fromJson(map);
              parseVideoSamllCard(videoSmallCardEntity);
              break;
            case "followCard":
              Map<String, dynamic> map =
                  json.decode(json.encode(itemList[f]).toString());
              FollowCardEntity followCardEntity =
                  FollowCardEntity.fromJson(map);
              parseFollowCardTwo(followCardEntity);
              break;
          }
        }).toList();
        isLoadingMore=false;
        isRefreshing=false;
      });
    } catch (e) {
      print(e);
    }
  }

  void parseCollectCard(NominateBeanItemlist nominateBeanItemlist) {
    items.add(new TitileViewModel(
        title: nominateBeanItemlist.data.header.title,
        actionTitle: nominateBeanItemlist.data.header.rightText));

    for (int i = 0; i < nominateBeanItemlist.data.itemList.length; i++) {
      parseFollowCard(nominateBeanItemlist.data.itemList[i]);
    }
  }

  void parseFollowCard(NominateBeanItemlistDataItemlist dataItemlist) {
    items.add(new FollowCardViewModel(
        coverUrl: dataItemlist.data.content.data.cover.detail,
        videoTime: dataItemlist.data.content.data.duration,
        authorUrl: dataItemlist.data.content.data.author.icon,
        description: dataItemlist.data.content.data.author.name +
            " / #" +
            dataItemlist.data.content.data.category,
        title: dataItemlist.data.content.data.title,
        videoDescription: dataItemlist.data.content.data.author.name,
        userDescription: dataItemlist.data.content.data.description,
        nickName: dataItemlist.data.content.data.author.description,
        playerUrl: dataItemlist.data.content.data.playUrl,
        blurredUrl: dataItemlist.data.content.data.cover.blurred,
        videoId: dataItemlist.data.content.data.id));
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

  void parseVideoSamllCard(VideoSmallCardEntity videoSmallCardEntity) {
    items.add(new VideoCardViewModel(
        coverUrl: videoSmallCardEntity.data.cover.detail,
        videoTime: videoSmallCardEntity.data.duration,
        title: videoSmallCardEntity.data.title,
        description: videoSmallCardEntity.data.author.name +
            " / #" +
            videoSmallCardEntity.data.category,
        authorUrl: videoSmallCardEntity.data.author.icon,
        userDescription: videoSmallCardEntity.data.author.description,
        nickName: videoSmallCardEntity.data.author.name,
        videoDescription: videoSmallCardEntity.data.description,
        playerUrl: videoSmallCardEntity.data.playUrl,
        blurredUrl: videoSmallCardEntity.data.cover.blurred,
        videoId: videoSmallCardEntity.data.id,
        collectionCount: videoSmallCardEntity.data.consumption.collectionCount,
        shareCount: videoSmallCardEntity.data.consumption.shareCount));
  }
}

class BaseUrl {
  // 配置默认请求地址
  static String url =
      "http://baobab.kaiyanapp.com/api/v5/index/tab/allRec"; // 测试环境
}
