
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/MainPage.dart';
import 'package:news_app/ResetPassword.dart';

import 'Login.dart';
import 'Register.dart';
void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    color: Colors.white,
    routes: {
      "register": (context) => RegisterPage(),
      "reset": (context) => ResetPassword(),
      "home": (context) => MainPage(),
    },
  ));

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF000000),
    systemNavigationBarDividerColor: null,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.white, // status bar color
  ));
}
