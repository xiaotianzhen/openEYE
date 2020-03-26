import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'bean/concern_card_viewmodel.dart';
import 'bean/concern_entity.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ConcernPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ConcernPagePageState();
  }
}

class _ConcernPagePageState extends State<ConcernPage> {
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
          final ConcernCardViewModel item = items[index];
          return new Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                new Container(child: new Center(
                  child: new Chewie(
                    new VideoPlayerController.network(item.playUrl),
                    aspectRatio: 16 / 9,
                    autoPlay: !true,
                    looping: true,
                    showControls: true,
                    // 占位图
                    placeholder: new Container(
                      child: new Image.network(item.coverUrl),
                    ),

                    // 是否在 UI 构建的时候就加载视频
                    autoInitialize: !true,

                    // 拖动条样式颜色
                    materialProgressColors: new ChewieProgressColors(
                      playedColor: Colors.red,
                      handleColor: Colors.blue,
                      backgroundColor: Colors.grey,
                      bufferedColor: Colors.lightGreen,
                    ),
                  ),
                ),),
                new Row(
                  children: <Widget>[
                    new Image.network(
                      item.avatarUrl,
                      width: 30.0,
                      height: 30.0,
                    ),
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          padding: EdgeInsets.only(left: 15.0),
                          child: new Text(item.issureName),
                        ),
                        new Row(
                          children: <Widget>[
                            new Container(
                              padding: EdgeInsets.only(left: 15.0, right: 10.0),
                              child: new Text(
                                  dateFormate(item.releaseTime) + "发布"),
                            ),
                            new Text(item.title)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                new Text(
                  item.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Image.asset("images/common_collection.png"),
                        new Text(item.collectionCount.toString()),
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        new Image.asset("images/common_collection.png"),
                        new Text(item.realCollectionCount.toString()),
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        new Image.asset("images/common_collection.png"),
                        new Text(item.realCollectionCount.toString()),
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        new Image.asset("images/common_share.png"),
                        new Text(item.shareCount.toString()),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: items == null ? 0 : items.length,
        shrinkWrap: true,
      ),
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
      Response response = await dio.get(BaseUrl.concernUrl);

      setState(() {
        String result = response.toString();
        ConcernEntity concernEntity =
            ConcernEntity.fromJson(json.decode(result));
        for (int i = 0; i < concernEntity.itemList.length; i++) {
          items.add(new ConcernCardViewModel(
            avatarUrl: concernEntity.itemList[i].data.header.icon,
            issureName: concernEntity.itemList[i].data.header.issuerName,
            releaseTime: concernEntity.itemList[i].data.header.time,
            title: concernEntity.itemList[i].data.content.data.title,
            description:
                concernEntity.itemList[i].data.content.data.description,
            coverUrl: concernEntity.itemList[i].data.content.data.cover.feed,
            playUrl: concernEntity.itemList[i].data.content.data.playUrl,
            collectionCount: concernEntity
                .itemList[i].data.content.data.consumption.collectionCount,
            replyCount: concernEntity
                .itemList[i].data.content.data.consumption.replyCount,
            realCollectionCount: concernEntity
                .itemList[i].data.content.data.consumption.realCollectionCount,
            shareCount: concernEntity
                .itemList[i].data.content.data.consumption.shareCount,
            category: concernEntity.itemList[i].data.content.data.category,
            authorDescription:
                concernEntity.itemList[i].data.content.data.author.description,
            blurredUrl:
                concernEntity.itemList[i].data.content.data.cover.blurred,
            videoId: concernEntity.itemList[i].data.content.data.cover.blurred,
          ));
        }
      });
    } catch (e) {
      print(e);
    }
  }

  String dateFormate(int time) {
    return DateTime.fromMillisecondsSinceEpoch(time).hour.toString() +
        ":" +
        DateTime.fromMillisecondsSinceEpoch(time).minute.toString();
  }
}

class BaseUrl {
  static String concernUrl =
      "http://baobab.kaiyanapp.com/api/v6/community/tab/follow";
}
