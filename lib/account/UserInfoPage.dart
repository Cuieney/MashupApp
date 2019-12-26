import 'package:flutter/material.dart';


import 'package:linker/widgets/BackIcon.dart';
import 'package:linker/model/UserInfo.dart';
import 'package:linker/routers/NavigatorUtils.dart';
import 'package:linker/routers/Routers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:linker/routers/FluroConvertUtils.dart';

import 'package:linker/widgets/CustomImageView.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


class UserInfoPage extends StatefulWidget {


  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> with WidgetsBindingObserver {
  UserInfo userInfo = UserInfo();

  @override
  void initState() {
    _initUserInfo();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        print('UserInfoPage.inactive');
        break;
      case AppLifecycleState.paused:
        print('UserInfoPage.paused');
        break;
      case AppLifecycleState.resumed:
        print('UserInfoPage.resumed');
        _initUserInfo();
        break;
      case AppLifecycleState.detached:
        print('UserInfoPage.detached');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }



  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  void _initUserInfo() async{
    _prefs.then((share) {
      String userInfoJson = share.get("user_info");
      if (userInfoJson == null || userInfoJson.length <= 0) {
        userInfo = UserInfo(
            head_img:
            "https://upload-images.jianshu.io/upload_images/3301720-db890fabf626e0ac.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp",
            user_name: "Linda",
            user_signature: "梦想不足以让你到达远方，但是到达远方的人一定有梦想");
        share.setString('user_info', FluroConvertUtils.object2string(UserInfo.userInfo2Json(userInfo)));
      } else {
        this.setState(() {
          userInfo =
              UserInfo.fromJson(FluroConvertUtils.string2map(userInfoJson));
        });
      }
    }).catchError((error) => userInfo = UserInfo(
        head_img:
        "https://upload-images.jianshu.io/upload_images/3301720-db890fabf626e0ac.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp",
        user_name: "Linda",
        user_signature: "梦想不足以让你到达远方，但是到达远方的人一定有梦想"));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF1F1F1),
      child: Column(
        children: <Widget>[
          Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 45, bottom: 15),
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10),
                      child: BackIcon(updateView: false),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "个人信息",
                      style: TextStyle(
                          color: Color(0xFF212121),
                          decoration: TextDecoration.none,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: GestureDetector(
              onTap: ()=>NavigatorUtils.pushResult(context, Routers.modifyUserHead,(reslut){
                _initUserInfo();
              }),
              child: Center(
                  child: Column(
                    children: <Widget>[
                      ClipOval(
                          child: CustomImageView(url: userInfo.head_img, width: 50.0,
                            height: 50.0,fit: BoxFit.cover,)),
                    ],
                  )),
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
                  child: Text("昵称",
                      style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
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
          ),Container(
            height: 50,
            color: Colors.white,
            margin: EdgeInsets.only(top:1),
            padding: EdgeInsets.only(left: 20, right: 15),
            alignment: Alignment.centerLeft,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("签名",
                      style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
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
        ],
      ),
    );
  }
}

