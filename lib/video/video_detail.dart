import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_eye/home/nominatebean/singletitle_viewmodel.dart';
import 'package:open_eye/home/nominatebean/text_card_entity.dart';
import 'package:open_eye/home/nominatebean/video_small_card_entity.dart';
import 'package:open_eye/home/nominatebean/videocard_viewmodel.dart';
import 'package:open_eye/video/videobean/comment_viewmodel.dart';
import 'package:open_eye/video/videobean/video_comment_entity.dart';
import 'package:open_eye/video/videobean/video_comment_title_entity.dart';
import 'package:open_eye/video/videobean/videodetail_viewmodel.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoDetailPage extends StatefulWidget {
  final VideoDetialViewModel data;

  VideoDetailPage(this.data);

  @override
  State<StatefulWidget> createState() {
    return new _VideoDetailPageState(data);
  }
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  VideoDetialViewModel data;
  List<dynamic> items;

  _VideoDetailPageState(this.data);

  @override
  void initState() {
    super.initState();
    items = new List<dynamic>();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    var imgHeight = MediaQuery.of(context).size.width * 9.0 / 16;
    var barHeight = MediaQuery.of(context).padding.top;

    return new Scaffold(
        body: new Column(
      children: <Widget>[
        Container(
          height: imgHeight + barHeight,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Colors.black,
              ),
              new Expanded(
                child: new Center(
                  child: new Chewie(
                    new VideoPlayerController.network(data.playerUrl),
                    aspectRatio: 16 / 9,
                    autoPlay: !true,
                    looping: true,
                    showControls: true,
                    // 占位图
                    placeholder: new Container(
                      child: new Image.network(data.coverUrl),
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
                ),
              )
            ],
          ),
        ),
        new Expanded(
          child: new Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new NetworkImage(data.blurredUrl),
                    fit: BoxFit.cover)),
            child: new ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return new Column(
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.all(10.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              data.title,
                              style: new TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                            ),
                            new Text(
                                data.category == null ? "目录" : data.category,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.white)),
                            new Text(data.videoDescription,
                                maxLines: 4,
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.white)),
                            new Container(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  new Row(
                                    children: <Widget>[
                                      new Image.asset(
                                        "images/ic_action_favorites.png",
                                        width: 18.0,
                                        height: 18.0,
                                      ),
                                      new Container(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: new Text(
                                            data.shareCount.toString(),
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.white)),
                                      )
                                    ],
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      new Image.asset(
                                        "images/ic_action_share.png",
                                        width: 18.0,
                                        height: 18.0,
                                      ),
                                      new Container(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: new Text(
                                              data.collectionCount.toString(),
                                              style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white))),
                                    ],
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      new Image.asset(
                                        "images/ic_action_reply.png",
                                        width: 18.0,
                                        height: 18.0,
                                      ),
                                      new Container(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: new Text("缓存",
                                              style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white))),
                                    ],
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      new Image.asset(
                                        "images/ic_action_offline.png",
                                        width: 18.0,
                                        height: 18.0,
                                      ),
                                      new Container(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: new Text("缓存",
                                              style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            new IntrinsicHeight(
                              child: new Row(
                                children: <Widget>[
                                  new Image.network(
                                    data.authorUrl == null
                                        ? ""
                                        : data.authorUrl,
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                  new Expanded(
                                      child: new Container(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              new Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  new Text(data.nickName,
                                                      style: new TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.white)),
                                                  new Text(data.userDescription,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: new TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.white))
                                                ],
                                              ),
                                              new Text("+关注",
                                                  style: new TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.white))
                                            ],
                                          )))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: new Divider(
                          height: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                } else {
                  final item = items[index - 1];
                  if (item is SingleTitleViewModel) {
                    return new Column(
                      children: <Widget>[
                        new Divider(
                          height: 1.0,
                          color: Colors.grey,
                        ),
                        new Row(
                          children: <Widget>[
                            new Container(
                              padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 5.0,
                                  bottom: 5.0),
                              child: new Text(item.titlel,
                                  style: new TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      decoration: TextDecoration.none)),
                            ),
                            new Image.asset("images/player_action_go.png"),
                          ],
                        )
                      ],
                    );
                  } else if (item is VideoCardViewModel) {
                    VideoDetialViewModel videoDetailData =
                        new VideoDetialViewModel(
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
                                  builder: (context) =>
                                      new VideoDetailPage(videoDetailData),
                                ),
                              );
                            },
                          ),
                          new Expanded(
                              child: new Container(
                                  height: 120,
                                  child: new Container(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Expanded(
                                            flex: 1,
                                            child: new Text(
                                              item.title,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  decoration:
                                                      TextDecoration.none),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                            )),
                                        new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            new Expanded(
                                                child: new Text(
                                                    item.description,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: new TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.white))),
                                            new Image.asset(
                                                "images/player_like.png",
                                                fit: BoxFit.cover),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))),
                        ],
                      ),
                    );
                  } else if (item is CommentViewModel) {
                    return new IntrinsicHeight(
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 5.0, right: 10.0),
                            child: new Image.network(
                              item.avatar == null ? "" : item.avatar,
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                          new Expanded(
                              child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Text(item.nickName,
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          decoration: TextDecoration.none)),
                                  new Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        item.likeCount.toString(),
                                        style: new TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.white),
                                      ),
                                      new Container(
                                        padding: EdgeInsets.only(
                                            left: 5.0, right: 10.0),
                                        child: new Image.asset(
                                            "images/player_like.png"),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              new Expanded(
                                  child: new Container(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 5.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Expanded(
                                        child: new Text(
                                      item.replyMessage,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey,
                                          decoration: TextDecoration.none),
                                    )),
                                    item.releaseTime == 0
                                        ? new Text(
                                            "发布于 " +
                                                _dateFormate(item.releaseTime),
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.none))
                                        : new Text("发布于 未知",
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.none)),
                                    new Divider(
                                      height: 1.0,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ))
                            ],
                          )),
                        ],
                      ),
                    );
                  } else {
                    return new Text("数据解析异常");
                  }
                }
              },
              itemCount: getItemCount(),
            ),
          ),
        )
      ],
    ));
  }

  String _dateFormate(int time) {
    return DateTime.fromMillisecondsSinceEpoch(time).hour.toString() +
        ":" +
        DateTime.fromMillisecondsSinceEpoch(time).minute.toString();
  }

  int getItemCount() {
    return items != null ? items.length + 1 : 1;
  }

  void loadData() async {
    Map<String, dynamic> headers = {
      "Accept": "application/json",
      "User-Agent": "insomnia/6.4.1"
    };

    BaseOptions options =
        BaseOptions(headers: headers, responseType: ResponseType.plain);
    Dio dio = new Dio(options);
    Response response = await dio
        .get(BaseUrl.video_recomment + "?id=" + data.videoId.toString());
    Response commentResponse = await dio
        .get(BaseUrl.video_comment + "?videoId=" + data.videoId.toString());

    setState(() {
      String nominateResult = response.data.toString();

      Map<String, dynamic> nominateData = json.decode(nominateResult);
      List nominateList =
          json.decode(json.encode(nominateData["itemList"]).toString());
      nominateList.asMap().keys.map((index) {
        switch (nominateList[index]["type"]) {
          case "textCard":
            Map<String, dynamic> map =
                json.decode(json.encode(nominateList[index]).toString());

            TextCardEntity textCardEntity = TextCardEntity.fromJson(map);
            items.add(
                new SingleTitleViewModel(titlel: textCardEntity.data.text));
            break;
          case "videoSmallCard":
            Map<String, dynamic> map =
                json.decode(json.encode(nominateList[index]).toString());
            VideoSmallCardEntity videoSmallCardEntity =
                VideoSmallCardEntity.fromJson(map);
            parseVideoSamllCard(videoSmallCardEntity);
            break;
        }
      }).toList();

      String commentResult = commentResponse.data.toString();
      Map<String, dynamic> commentData = json.decode(commentResult);
      List commentList =
          json.decode(json.encode(commentData["itemList"]).toString());
      commentList.asMap().keys.map((index) {
        switch (commentList[index]["type"]) {
          case "leftAlignTextHeader":
            VideoCommentTitleEntity commentTitleEntity =
                VideoCommentTitleEntity.fromJson(
                    json.decode(json.encode(commentList[index]).toString()));
            items.add(
                new SingleTitleViewModel(titlel: commentTitleEntity.data.text));
            break;
          case "reply":
            VideoCommentEntity videoCommentEntity = VideoCommentEntity.fromJson(
                json.decode(json.encode(commentList[index]).toString()));
            print(videoCommentEntity.data.user.releaseDate);
            items.add(new CommentViewModel(
                avatar: videoCommentEntity.data.user.avatar,
                nickName: videoCommentEntity.data.user.nickname,
                replyMessage: videoCommentEntity.data.message,
                releaseTime: videoCommentEntity.data.user.releaseDate,
                likeCount: videoCommentEntity.data.likeCount));
            break;
        }
      }).toList();
    });
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
  static String video_comment =
      'http://baobab.kaiyanapp.com/api/v2/replies/video';
  static String video_recomment =
      'http://baobab.kaiyanapp.com/api/v4/video/related';
}
