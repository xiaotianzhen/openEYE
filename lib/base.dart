import 'package:flutter/material.dart';
import 'package:open_eye/notification/more.dart';
import 'package:open_eye/mine/user.dart';

import 'package:open_eye/community/community.dart';
import 'package:open_eye/home/home.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return HomePage();
              break;
            case 1:
              return CommunityPage();
              break;
            case 2:
              return MorePage();
              break;
            case 3:
              return UserPage();
              break;
            default:
              return HomePage();
          }
        },
        itemCount: 4,
        controller: _pageController,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: new Image.asset(
                "images/main_home.png",
                width: 32,
                height: 32,
              ),
              label:"首页"),
          BottomNavigationBarItem(
              icon: new Image.asset(
                "images/main_community.png",
                width: 32,
                height: 32,
              ),
              label: "社区"),
          BottomNavigationBarItem(
              icon: new Image.asset(
                "images/main_notify.png",
                width: 32,
                height: 32,
              ),
              label: "通知"),
          BottomNavigationBarItem(
              icon: new Image.asset(
                "images/main_user.png",
                width: 32,
                height: 32,
              ),
              label: "我的"),
        ],
        currentIndex: _currentPageIndex,
        onTap: tap,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }

  void tap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
