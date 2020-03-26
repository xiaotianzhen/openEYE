import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_eye/home/nominatebean/titleviewmodel.dart';
import 'package:open_eye/home/nominatebean/video_small_card_entity.dart';
import 'package:open_eye/home/nominatebean/videocard_viewmodel.dart';
import 'package:open_eye/video/video_detail.dart';
import 'package:open_eye/video/videobean/videodetail_viewmodel.dart';
import 'dart:convert';

import 'discorverbean/brief_card_viewmodel.dart';
import 'discorverbean/briefcard_entity.dart';
import 'discorverbean/category_cart_entity.dart';
import 'discorverbean/content_banner_entity.dart';
import 'discorverbean/content_banner_viewmodel.dart';
import 'discorverbean/subject_card_entity.dart';
import 'discorverbean/titleview_entity.dart';
import 'discorverbean/top_banner_entity.dart';
import 'discorverbean/topbanner_viewmodel.dart';

class DisCoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DisCoverPageState();
  }
}

class _DisCoverPageState extends State<DisCoverPage> {
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
          final item = items[index];
          if (item is TopBeanViewModel) {
            return new Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: new Image.network(item.bannerUrl),
            );
          } else if (item is CategoryCartEntity) {
            return new Container(
                padding: EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          item.data.header.title,
                          style: new TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        new Container(
                          child: new Row(
                            children: <Widget>[
                              new Text(item.data.header.rightText == null
                                  ? ""
                                  : item.data.header.rightText),
                              new Image.asset("images/common_action_right.png"),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      height: 200.0,
                      child: GridView.builder(
                          //physics: new NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 0.9),
                          itemCount: item.data.itemList.length,
                          itemBuilder: (context, index) {
                            return new Container(
                              child: new Image.network(
                                item.data.itemList[index].data.image,
                              ),
                            );
                          }),
                    )
                  ],
                ));
          } else if (item is SubjectCardEntity) {
            return new Container(
              padding: EdgeInsets.all(10.0),
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        item.data.header.title,
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new Container(
                        child: new Row(
                          children: <Widget>[
                            new Text(item.data.header.rightText == null
                                ? ""
                                : item.data.header.rightText),
                            new Image.asset("images/common_action_right.png"),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 180.0,
                    child: GridView.builder(
                        physics: new NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 2,
                        ),
                        itemCount: item.data.itemList.length,
                        itemBuilder: (context, index) {
                          return new Image.network(
                            item.data.itemList[index].data.image,
                            fit: BoxFit.cover,
                          );
                        }),
                  )
                ],
              ),
            );
          } else if (item is TitileViewModel) {
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
                          new Text(
                              item.actionTitle == null ? "" : item.actionTitle),
                          new Image.asset("images/common_action_right.png")
                        ],
                      ),
                    )
                  ],
                ));
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
                collectionCount: item.collectionCount,
                shareCount: item.collectionCount);

            return new Container(
                padding: EdgeInsets.all(10.0),
                child: new IntrinsicHeight(
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Expanded(
                                    child: new Text(
                                  item.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )),
                                new Image.asset("images/common_share.png"),
                              ],
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ));
          } else if (item is BriefCardViewModel) {
            return new Column(
              children: <Widget>[
                new Container(
                    padding: EdgeInsets.all(10.0),
                    child: new IntrinsicHeight(
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
                                new Text(item.description),
                              ],
                            ),
                          )),
                          new Text(("+关注"))
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
          } else if (item is ContentBannerViewModel) {
            return new Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: new Image.network(item.bannerUrl),
            );
          } else {
            return new Text("未知数据");
          }
        },
        itemCount: items.length,
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
    Response response = await dio.get(BaseUrl.discoverUrl);
    setState(() {
      String result = response.data.toString();
      Map<String, dynamic> data = json.decode(result);

      List itemList = json.decode(json.encode(data["itemList"]).toString());
      itemList.asMap().keys.map((f) {
        switch (itemList[f]["type"]) {
          case "horizontalScrollCard":
            Map<String, dynamic> map =
                json.decode(json.encode(itemList[f]).toString());
            TopBannerEntity topBannerEntity = TopBannerEntity.fromJson(map);
            items.add(new TopBeanViewModel(
                bannerUrl: topBannerEntity.data.itemList[0].data.image));
            break;
          case "specialSquareCardCollection":
            Map<String, dynamic> map =
                json.decode(json.encode(itemList[f]).toString());
            CategoryCartEntity cartEntity = CategoryCartEntity.fromJson(map);
            items.add(cartEntity);
            break;
          case "columnCardList":
            Map<String, dynamic> map =
                json.decode(json.encode(itemList[f]).toString());
            SubjectCardEntity subjectCardEntity =
                SubjectCardEntity.fromJson(map);
            items.add(subjectCardEntity);
            break;
          case "textCard":
            Map<String, dynamic> map =
                json.decode(json.encode(itemList[f]).toString());
            TitleviewEntity titleviewEntity = TitleviewEntity.fromJson(map);
            items.add(new TitileViewModel(
                title: titleviewEntity.data.text,
                actionTitle: titleviewEntity.data.rightText));
            break;
          case "banner":
            Map<String, dynamic> map =
                json.decode(json.encode(itemList[f]).toString());
            ContentBannerEntity contentBannerEntity =
                ContentBannerEntity.fromJson(map);
            items.add(new ContentBannerViewModel(
                bannerUrl: contentBannerEntity.data.image));
            break;
          case "videoSmallCard":
            Map<String, dynamic> map =
                json.decode(json.encode(itemList[f]).toString());
            VideoSmallCardEntity videoSmallCardEntity =
                VideoSmallCardEntity.fromJson(map);
            parseVideoSamllCard(videoSmallCardEntity);
            break;
          case "briefCard":
            Map<String, dynamic> map =
                json.decode(json.encode(itemList[f]).toString());
            BriefcardEntity briefcardEntity = BriefcardEntity.fromJson(map);
            items.add(new BriefCardViewModel(
                coverUrl: briefcardEntity.data.icon,
                title: briefcardEntity.data.title,
                description: briefcardEntity.data.description));
            break;
          default:
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
  static String discoverUrl =
      "http://baobab.kaiyanapp.com/api/v7/index/tab/discovery?udid=fa53872206ed42e3857755c2756ab683fc22d64a&vc=591&vn=6.2.1&size=720X1280&deviceModel=Che1-CL20&first_channel=eyepetizer_zhihuiyun_market&last_channel=eyepetizer_zhihuiyun_market&system_version_code=19";
}
