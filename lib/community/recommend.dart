import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../screen_util.dart';
import 'bean/columns_card_viewmodel.dart';
import 'bean/communitycard_entity.dart';
import 'bean/scrollcard_entity.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RecommendPageState();
  }
}

class _RecommendPageState extends State<RecommendPage> {
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
      body: new Container(
        child: new ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            print("items length" + items.length.toString());
            if (item is ScrollcardEntity) {
              return new Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                height: 80.0,
                child: new ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      padding: (index + 1) % 2 == 0
                          ? EdgeInsets.only(left: 5.0)
                          : EdgeInsets.only(right: 5.0),
                      width: ScreenUtil.getScreenWidth(context) / 2 - 10,
                      height: 180.0,
                      child: new Image.network(
                          item.data.itemList[index].data.bgPicture),
                    );
                  },
                  itemCount: item.data.itemList.length,
                ),
              );
            } else if (item is List<ColumnsCardViewModel>) {
              print("ColumnsCardViewModel");
              print("screenwidth" +
                  ScreenUtil.getScreenWidth(context).toString());
              print("screenheight" +
                  ScreenUtil.getScreenHeight(context).toString());
              return StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(8),
                crossAxisCount: 4,
                itemCount: item.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Column(
                    children: <Widget>[
                      new Image.network(
                        item[index].coverUrl,
                        height: item[index].imgHeight *
                            ((ScreenUtil.getScreenWidth(context) / 2 - 12) /
                                item[index].imgWidth),
                      ),
                      new Container(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                item[index].description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              new Container(
                                padding: EdgeInsets.only(
                                    top: 10.0, bottom: 10.0),
                                child: new Row(
                                  children: <Widget>[
                                    new Expanded(

                                      child: new Row(
                                        children: <Widget>[
                                          new Image.network(
                                            item[index].avatarUrl,
                                            width: 30.0,
                                            height: 30.0,
                                          ),
                                          new Text(
                                            item[index].nickName,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    new Text(
                                      item[index].collectionCount.toString(),
                                      style: new TextStyle(fontSize: 12.0),),
                                    new Image.asset(
                                      "images/common_collection.png",
                                      width: 15.0, height: 15.0,)
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  );
                },
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              );
            } else {
              return new Text("数据解析异常");
            }
          },
          itemCount: items.length,
        ),
      ),
    );
  }

  void loadData() async{
    try {
      Map<String, dynamic> headers = {
        "Accept": "application/json",
        "User-Agent": "insomnia/6.4.1"
      };

      BaseOptions options =
      BaseOptions(headers: headers, responseType: ResponseType.plain);
      Dio dio = new Dio(options);
      Response response = await dio.get(BaseUrl.url);
      print("responsecode: " + response.statusCode.toString());

      setState(() {
        String result =response.data.toString();

        Map<String, dynamic> data = json.decode(result);
        List dataList = json.decode(json.encode(data["itemList"]).toString());
        List<ColumnsCardViewModel> columnsCardList =
        new List<ColumnsCardViewModel>();
        dataList
            .asMap()
            .keys
            .map((f) {
          switch (dataList[f]["type"]) {
            case "horizontalScrollCard":
              print("horizontalScrollCard");
              ScrollcardEntity scrollcardEntity = ScrollcardEntity.fromJson(
                  json.decode(json.encode(dataList[f]).toString()));
              if(scrollcardEntity.data.itemList[0].data.bgPicture!=null){
                items.add(scrollcardEntity);
              }
              break;
            case "communityColumnsCard":
              print("communityColumnsCard");
              CommunitycardEntity communitycardEntity =
              CommunitycardEntity.fromJson(
                  json.decode(json.encode(dataList[f]).toString()));
              columnsCardList.add(new ColumnsCardViewModel(
                  coverUrl: communitycardEntity.data.content.data.cover.feed,
                  nickName: communitycardEntity.data.content.data.owner
                      .nickname,
                  description: communitycardEntity.data.content.data
                      .description,
                  avatarUrl: communitycardEntity.data.content.data.owner.avatar,
                  collectionCount: communitycardEntity
                      .data.content.data.consumption.collectionCount,
                  imgWidth: communitycardEntity.data.content.data.width,
                  imgHeight: communitycardEntity.data.content.data.height));
              break;
          }
        }).toList();

        items.add(columnsCardList);
      });
    } catch (e) {
      print(e);
    }
  }
}


class BaseUrl {
  static String url =
      "http://baobab.kaiyanapp.com/api/v7/community/tab/rec";
}