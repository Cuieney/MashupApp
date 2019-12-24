import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:linker/routers/FluroConvertUtils.dart';
import 'package:linker/routers/Routers.dart';
import 'package:linker/routers/Application.dart';

import 'package:linker/model/HomeDataResp.dart';


class NavigatorUtils {

  static push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    Application.router.navigateTo(context, path, replace: replace, clearStack: clearStack, transition: TransitionType.native);
  }

  static pushResult(BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    Application.router.navigateTo(context, path, replace: replace, clearStack: clearStack, transition: TransitionType.native).then((result){
      if (result == null){
        return;
      }
      function(result);
    }).catchError((error) {
      print("$error");
    });
  }

  static pushWithParams(BuildContext context, String path,Map<String, dynamic> model,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    var data = model['key'] as HomeDataResp;
    Application.router.navigateTo(context, "${path}?key=${FluroConvertUtils.object2string(HomeDataResp.HomeDataRespToJson(data))}", replace: replace, clearStack: clearStack, transition: TransitionType.native);
  }



  /// 返回
  static void goBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  /// 带参数返回
  static void goBackWithParams(BuildContext context, result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }

  /// 跳到WebView页
  static goWebViewPage(BuildContext context, String title, String url){
    //fluro 不支持传中文,需转换
    push(context, '${Routers.webViewPage}?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}');
  }
}