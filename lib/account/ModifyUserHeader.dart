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

import 'package:oktoast/oktoast.dart';
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
bool isWeb = (defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.android);

class ModifyUserHeader extends StatefulWidget {
  @override
  _ModifyUserHeaderState createState() => _ModifyUserHeaderState();
}

class _ModifyUserHeaderState extends State<ModifyUserHeader> {
  UserInfo userInfo = UserInfo();

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
    return Container(
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
                    child: BackIcon(
                      updateView: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "头像",
                    style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 18,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                _onActionSheetPress(context);
              },
              child: ClipOval(
                  child: CustomImageView(
                url: userInfo.head_img,
                width: 300.0,
                height: 300.0,
                fit: BoxFit.fill,
              )),
            ),
          ))
        ],
      ),
    );
  }

  takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    print("takePhoto ${image.path}");
    setState(() {
      userInfo.head_img = image.path;
      _prefs.then((share) {
        share.setString('user_info',
            FluroConvertUtils.object2string(UserInfo.userInfo2Json(userInfo)));
      });
    });
  }

  /*相册*/
  openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print("openGallery ${image.path}");
    if (image == null) {
      return;
    }
    setState(() {
      userInfo.head_img = image.path;
      _prefs.then((share) {
        share.setString('user_info',
            FluroConvertUtils.object2string(UserInfo.userInfo2Json(userInfo)));
      });
    });
  }

  Future<String> getFile() async {
    final completer = new Completer<String>();
    final InputElement input = document.createElement('input');
    input
      ..type = 'file'
      ..accept = 'image/*';
    input.onChange.listen((e) async {
      final List<File> files = input.files;
      final reader = new FileReader();
      reader.readAsDataUrl(files[0]);
      reader.onError.listen((error) => completer.completeError(error));
      await reader.onLoad.first;
      completer.complete(reader.result as String);
    });
    input.click();
    return completer.future;
  }

  void _showActionSheet({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
        if (value == 'take_photo') {
          takePhoto();
        } else if (value == 'choose_album') {
          openGallery();
        } else if (value == 'choose_picture') {
          getFile().then((value){
            print(value);
            setState(() {
              userInfo.head_img = value;
              _prefs.then((share) {
                share.setString('user_info',
                    FluroConvertUtils.object2string(UserInfo.userInfo2Json(userInfo)));
              });
            });
          }).catchError((error)=>print(error));
        }
      }
    });
  }

  void _onActionSheetPress(BuildContext context) {
    List<Widget> widges = [];
    print("platform ${io.Platform.isFuchsia}");

    if (!isWeb) {
      widges.add(CupertinoActionSheetAction(
        child: const Text('拍照'),
        onPressed: () => Navigator.pop(context, 'take_photo'),
      ));

      widges.add(CupertinoActionSheetAction(
        child: const Text('从相册选取'),
        onPressed: () => Navigator.pop(context, 'choose_album'),
      ));
    } else {
      widges.add(CupertinoActionSheetAction(
        child: const Text('选择图片'),
        onPressed: () => Navigator.pop(context, 'choose_picture'),
      ));
    }

    _showActionSheet(
      context: context,
      child: CupertinoActionSheet(
        actions: widges,
        cancelButton: CupertinoActionSheetAction(
          child: const Text('取消'),
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context, 'cancel'),
        ),
      ),
    );
  }
}
