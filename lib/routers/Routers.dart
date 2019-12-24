import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:linker/model/HomeDataResp.dart';
import '../widgets/WebViewPage.dart';
import '../login/Login.dart';
import '../login/Register.dart';
import '../login/ResetPassword.dart';
import '../main/MainPage.dart';
import '../widgets/ShowImageDetailPage.dart';
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

  static void configureRoutes(Router router) {
    router.define(home,
        handler: Handler(handlerFunc: (_, params) => MainPage()));
    router.define(splash,
        handler: Handler(handlerFunc: (_, params) => MainPage()));
    router.define(login,
        handler: Handler(handlerFunc: (_, params) => LoginPage()));
    router.define(register,
        handler: Handler(handlerFunc: (_, params) => RegisterPage()));
    router.define(resetPassword,
        handler: Handler(handlerFunc: (_, params) => ResetPassword()));
    router.define(displayImageView,
        handler: Handler(handlerFunc: (_, params) => ShowImageDetailPage()));
    router.define(setting,handler:Handler(
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
