
import 'dart:io';
import 'package:fluro/fluro.dart';

import 'package:linker/routers/Application.dart';
import 'package:linker/routers/Routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linker/main/MainPage.dart';
import 'package:linker/login/ResetPassword.dart';

import 'package:linker/login/Login.dart';
import 'package:linker/login/Register.dart';

import 'home/Splash.dart';
void main() {
  runApp(App());

//  if (Platform.isAndroid) {
//    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
//    SystemUiOverlayStyle systemUiOverlayStyle =
//    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      systemNavigationBarColor: Color(0xFF000000),
//      systemNavigationBarDividerColor: null,
//      systemNavigationBarIconBrightness: Brightness.light,
//      statusBarIconBrightness: Brightness.dark,
//      statusBarBrightness: Brightness.light,
//      statusBarColor: Colors.transparent, // status bar color
//    ));

//  }

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }

  App(){
    var router = Router();
    Routers.configureRoutes(router);
    Application.router = router;
  }
}

