import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:linker/model/HomeDataResp.dart';
import 'package:linker/home/Splash.dart';
import 'package:linker/widgets/WebViewPage.dart';
import 'package:linker/login/Login.dart';
import 'package:linker/login/Register.dart';
import 'package:linker/login/ResetPassword.dart';
import 'package:linker/main/MainPage.dart';
import 'package:linker/widgets/ShowImageDetailPage.dart';
import 'package:linker/account/Setting.dart';
import 'package:linker/account/ModifyUserHeader.dart';
import 'package:linker/account/UserInfoPage.dart';
import 'FluroConvertUtils.dart';

class Routers {
  static String home = "/home";
  static String splash = "/splash";
  static String login = "/login";

  static String register = "/register";
  static String resetPassword = "/resetpassword";
  static String displayImageView = "/displayImageView";
  static String setting = "/setting";
  static String webViewPage = "/webViewPage";
  static String modifyUserHead = "/modifyUserHead";
  static String userInfoPage = "/userInfoPage";

  static void configureRoutes(Router router) {
    router.define(home,
        handler: Handler(handlerFunc: (_, params) => MainPage()));
    router.define(splash,
        handler: Handler(handlerFunc: (_, params) => Splash()));
    router.define(login,
        handler: Handler(handlerFunc: (_, params) => LoginPage()));
    router.define(register,
        handler: Handler(handlerFunc: (_, params) => RegisterPage()));
    router.define(resetPassword,
        handler: Handler(handlerFunc: (_, params) => ResetPassword()));
    router.define(setting,
        handler: Handler(handlerFunc: (_, params) => SettingPage()));
    router.define(modifyUserHead,
        handler: Handler(handlerFunc: (_, params) => ModifyUserHeader()));
    router.define(userInfoPage,
        handler: Handler(handlerFunc: (_, params) => UserInfoPage()));
    router.define(displayImageView,handler:Handler(
        handlerFunc: (
            BuildContext context, Map<String, List<String>> params) {
            var dataJson = params['key'].first;
            var homeData = HomeDataResp.homeDataRespFromJson(FluroConvertUtils.string2map(dataJson));
            return ShowImageDetailPage(rsp: homeData);
        }
    ));
    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      String title = params['title']?.first;
      String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));
  }
}
