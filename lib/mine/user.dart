import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _UserPageState();
  }
}

class _UserPageState extends State<UserPage> {
  List<String> fuctionItems;

  @override
  void initState() {
    super.initState();
    setState(() {
      fuctionItems = ["我的关注", "我的收藏", "视频功能声明", "用户协议", "版权声明", "关于作者"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(right: 10.0, top: 10.0),
              alignment: Alignment.centerRight,
              child: Image.asset(
                "images/user_more.png",
                width: 15.0,
                height: 15.0,
              ),
            ),
            new Center(
              child: new Image.asset(
                "images/avatar.jpg",
                width: 50.0,
                height: 50.0,
              ),
            ),
            new Center(
              child: new Container(
                padding: EdgeInsets.only(
                  top: 15.0,
                ),
                child: new Text(
                  "点击登录即可评论及发布内容",
                  style: new TextStyle(fontSize: 13.0),
                ),
              ),
            ),
            new Container(
                height: 40.0,
                padding: EdgeInsets.only(top: 15.0),
                child: new Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Container(
                            child: new Center(
                                child: new Row(
                              children: <Widget>[
                                new Image.asset("images/common_collection.png"),
                                new Text("收藏"),
                              ],
                            )),
                          ),
                          new Container(
                            child: new Center(
                                child: new Row(
                              children: <Widget>[
                                new Image.asset("images/common_collection.png"),
                                new Text("收藏"),
                              ],
                            )),
                          )
                        ],
                      ),
                    ),
                    Align(
                      child: new Container(
                        child: new VerticalDivider(
                          width: 10.0,
                          color: Colors.grey,
                        ),
                      ),
                      alignment: Alignment.center,
                    )
                  ],
                )),
            new Container(
                padding: EdgeInsets.only(top: 10.0),
                child: new Divider(
                  height: 1.0,
                  color: Colors.grey,
                )),
            new Expanded(
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  String funcName = fuctionItems[index];
                  return new Container(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: new Center(child: new Text(funcName)));
                },
                itemCount: fuctionItems != null ? fuctionItems.length : 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
