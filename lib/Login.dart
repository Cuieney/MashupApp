import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/MainPage.dart';
import 'package:news_app/ResetPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Register.dart';
import 'http/HttpConstant.dart';
import 'http/HttpRequest.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

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

var userName;
var userPassword;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (_onLogin2HomePage(context)) {
      return null;
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 40, top: 113, bottom: 80),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "欢迎回来",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintText: "用户名或邮箱",
                  ),
                  cursorColor: Color(0xFF02AF8A),
                  onChanged: _onPhoneInputTextChange,
                  autofocus: false,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Divider(),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintText: "密码",
                  ),
                  cursorColor: Color(0xFF02AF8A),
                  onChanged: _onPasswordInputTextChange,
                  autofocus: false,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Divider(),
              ),
              RowLayout(),
              Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  padding: EdgeInsets.only(bottom: 10),
                  child: Builder(
                    builder: (context) => RaisedButton(
                      child: Text(
                        "登录",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => _onLogin(context),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      splashColor: Color(0xFF02AF8A),
                    ),
                  ))
            ],
          )),
        ));
  }

  _onPhoneInputTextChange(String name) {
    userName = name;
  }

  bool _onLogin2HomePage(BuildContext context) {
    bool status = false;
    _prefs.then((SharedPreferences share) {
      var token = share.get("token");
      print("登录成功");
      print(token);
      if (token != null) {
        status = true;
        Navigator.pop(context);
        Navigator.pushNamed(context, "home");
      }
    });
    return status;
  }

  _onPasswordInputTextChange(String password) {
    userPassword = password;
  }

  _onLogin(BuildContext context) {
    if (!isEmpty(userName) && !isEmpty(userPassword)) {
      log("login success");
      _doRegisterFromNet(context);
    } else {
      log("login fail");
      _showToast(context, "验证账号密码失败");
    }
  }

  bool isEmpty(String s) => s == null || s.isEmpty;

  _doRegisterFromNet(BuildContext context) async {
    Map<String, String> bodyParams = new Map();
    bodyParams["email"] = "$userName@163.com";
    bodyParams["username"] = userName;
    bodyParams["password"] = userPassword;

    await HttpRequest.request(HttpConstant.login, Method.POST,body: bodyParams)
        .then((dynamic jsonResponse) {
      print("jsonResponse $jsonResponse");

      int code = jsonResponse['code'];
      print("$code , ${jsonResponse['msg']}");
      if (code == 200) {
        _showToast(context, "登录成功");
        _prefs.then((SharedPreferences preferences) {
          preferences.setString("token", jsonResponse['token']);
          Navigator.pushNamed(context, "home");
          Navigator.pop(context);
        });
      } else {
        _showToast(context, "登录失败 ${jsonResponse['msg']}");
      }
    }).catchError((error) {
      print("jsonResponse $error");
      _showToast(context, "登录失败 $error");
    });
  }

  _showToast(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("${msg}")));
  }
}

class RowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(30),
            child: GestureDetector(
              child: Text("注册", style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () => Navigator.pushNamed(context, "register"),
            )),
        Expanded(
            child: Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.all(30),
                child: GestureDetector(
                  child: Text(
                    "忘记密码",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () => Navigator.pushNamed(context, "reset"),
                ))),
      ],
    );
  }
}
