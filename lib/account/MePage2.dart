import 'package:flutter/material.dart';

import 'package:linker/home/HomePage2.dart';

import 'package:linker/model/UserInfo.dart';
import 'package:linker/routers/NavigatorUtils.dart';
import 'package:linker/routers/Routers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:linker/routers/FluroConvertUtils.dart';

import 'package:linker/widgets/CustomImageView.dart';


Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class MePage2 extends StatefulWidget {
  @override
  _MePage2State createState() => _MePage2State();
}

class _MePage2State extends State<MePage2> with WidgetsBindingObserver {
  UserInfo userInfo = new UserInfo();

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
        print('MePage2.inactive');
        break;
      case AppLifecycleState.paused:
        print('MePage2.paused');
        break;
      case AppLifecycleState.resumed:
        print('MePage2.resumed');
        _initUserInfo();
        break;
      case AppLifecycleState.detached:
        print('MePage2.detached');

        break;
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _initUserInfo() async{
     await _prefs.then((share) {
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
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 45, bottom: 15),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("我的",
                          style: TextStyle(
                              color: Color(0xFF212121),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        NavigatorUtils.pushResult(context, Routers.setting,(result){
                            _initUserInfo();
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.settings,
                            color: Color(0xFF4A90E2),
                          )),
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Center(
                child: Column(
              children: <Widget>[
                ClipOval(
                    child: CustomImageView(url: userInfo.head_img, width: 50.0,
                      height: 50.0,fit: BoxFit.cover,)),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    userInfo.user_name,
                    style: TextStyle(
                        color: Color(0xFF515151),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "关注 719 | 被 200 关注",
                    style: TextStyle(color: Color(0xFF515151)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(userInfo.user_signature,
                      style: TextStyle(color: Color(0xFF515151), fontSize: 15)),
                ),
              ],
            )),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 1),
              color: Colors.white,
              child: DataListContainer(),
            ),
          )
        ],
      ),
    );
  }
}
