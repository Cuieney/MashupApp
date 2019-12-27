import 'dart:html';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:linker/home/HomePage2.dart';
import 'package:linker/widgets/BackIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:linker/model/UserInfo.dart';
import 'package:linker/routers/NavigatorUtils.dart';
import 'package:linker/routers/Routers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linker/routers/FluroConvertUtils.dart';
import 'dart:io' as io;
import 'package:linker/widgets/CustomImageView.dart';
import 'package:flutter/foundation.dart';

bool isWeb = (defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.android);
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class ModifyUserInfo extends StatefulWidget {
  final String title;
  final bool isModifyUserName;

  const ModifyUserInfo({Key key, this.title, this.isModifyUserName})
      : super(key: key);

  @override
  _ModifyUserInfoState createState() => _ModifyUserInfoState();
}

class _ModifyUserInfoState extends State<ModifyUserInfo> {
  UserInfo userInfo = UserInfo();
  String info = '';

  @override
  void initState() {
    _initUserInfo();
    super.initState();
  }

  void _initUserInfo() {
    _prefs.then((share) {
      String userInfoJson = share.get("user_info");
      if (userInfoJson == null || userInfoJson.length <= 0) {
        userInfo = UserInfo(
            head_img:
                "https://upload-images.jianshu.io/upload_images/3301720-db890fabf626e0ac.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp",
            user_name: "Linda",
            user_signature: "梦想不足以让你到达远方，但是到达远方的人一定有梦想");
        share.setString('user_info',
            FluroConvertUtils.object2string(UserInfo.userInfo2Json(userInfo)));
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
    return Scaffold(
      body: Container(
        color: Color(0xFFEFEFF4),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 50, bottom: 15,right: 10),
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10),
                      child: BackIcon(
                        updateView: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget.isModifyUserName) {
                            userInfo.user_name = info;
                          } else {
                            userInfo.user_signature = info;
                          }
                          _prefs.then((share) {
                            share.setString(
                                'user_info',
                                FluroConvertUtils.object2string(
                                    UserInfo.userInfo2Json(userInfo)));
                          });
                        });
                        NavigatorUtils.goBack(context);
                      },
                      child: Icon(
                        Icons.check,
                        color: Color(0xFF4A90E2),
                      ),
                    )),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 30),
              child: TextField(
                textAlign: TextAlign.left,
                maxLines: widget.isModifyUserName ? 1 : 20,
                onChanged: _onTextChange,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText:
                      "${(widget.isModifyUserName) ? userInfo.user_name : userInfo.user_signature}",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
                autofocus: false,
              ),
            )
          ],
        ),
      ),
    );
  }

  _onTextChange(String value) {
    info = value;
  }
}
