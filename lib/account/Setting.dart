import 'package:flutter/material.dart';
import 'package:linker/widgets/BackIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:linker/routers/NavigatorUtils.dart';
import 'package:linker/routers/Routers.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFEFEFF4),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 50, bottom: 15),
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10),
                      child: BackIcon(updateView: true),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "设置",
                      style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 30,
              margin: EdgeInsets.only(left: 20, top: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "信息",
                style: TextStyle(color: Color(0xFF9B9B9B)),
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              padding: EdgeInsets.only(left: 20, right: 15),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: (){
                  NavigatorUtils.push(context, Routers.userInfoPage);
                },
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("编辑",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500)),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Color(0xff999999),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              height: 30,
              margin: EdgeInsets.only(left: 20, top: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "我的",
                style: TextStyle(color: Color(0xFF9B9B9B)),
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              margin: EdgeInsets.only(top:1),
              padding: EdgeInsets.only(left: 20, right: 15),
              alignment: Alignment.centerLeft,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("收藏",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Color(0xff999999),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              margin: EdgeInsets.only(top:1),
              padding: EdgeInsets.only(left: 20, right: 15),
              alignment: Alignment.centerLeft,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("关注",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Color(0xff999999),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              margin: EdgeInsets.only(top:1),
              padding: EdgeInsets.only(left: 20, right: 15),
              alignment: Alignment.centerLeft,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("黑名单",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Color(0xff999999),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: 30,
              margin: EdgeInsets.only(left: 20, top: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "其他",
                style: TextStyle(color: Color(0xFF9B9B9B)),
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              padding: EdgeInsets.only(left: 20, right: 15),
              alignment: Alignment.centerLeft,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("清除缓存",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Color(0xff999999),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              margin: EdgeInsets.only(top:1),
              padding: EdgeInsets.only(left: 20, right: 15),
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  onTap: () {
                    _onActionSheetPress(context);
                  },
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("退出登录",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xff999999),
                            ),
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _showActionSheet({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
        if (value == 'exit') {
          _prefs.then((SharedPreferences share){
            share.setString('token', null);
            share.setString('user_info', null);
            NavigatorUtils.push(context, Routers.login,replace: true,clearStack: true);
          });
        }
      }
    });
  }

  void _onActionSheetPress(BuildContext context)  {
    _showActionSheet(
      context: context,
      child: CupertinoActionSheet(
        title: const Text('要退出吗？'),
        message: const Text('真的要退出吗？'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text('退出'),
            onPressed: () => Navigator.pop(context, 'exit'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('取消'),
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context, 'cancel'),
        ),
      ),
    );
  }

}
