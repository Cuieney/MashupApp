import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/widgets/BackIcon.dart';
import 'package:news_app/widgets/CountDownTextRoute.dart';

void main() {
  runApp(MaterialApp(color: Colors.white, home: RegisterPage()));
}

class RegisterPage extends StatelessWidget {
  var phoneNumber;
  var userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Builder(
      builder: (context) => Container(
              child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 10, top: 50),
                child: BackIcon(),
              ),
              Container(
                  margin: EdgeInsets.only(left: 40, top: 50, bottom: 80),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "注册",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    hintText: "手机号",
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
                child: Stack(
                  alignment: FractionalOffset(1, 0.5),
                  children: <Widget>[
                    Container(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                          hintText: "验证码",
                        ),
                        cursorColor: Color(0xFF02AF8A),
                        onChanged: _onPasswordInputTextChange,
                        autofocus: false,
                      ),
                    ),
                    CountDownTextRoute()
                  ],
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
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
                child: RaisedButton(
                  child: Text(
                    "登录",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => _onLogin(context),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  splashColor: Color(0xFF02AF8A),
                ),
              ),
              SwitchAndCheckBoxTestRoute(),
            ],
          )),
    )));
  }

  _onPhoneInputTextChange(String phone) {
    phoneNumber = phone;
  }

  _onPasswordInputTextChange(String password) {
    userPassword = password;
  }

  _onLogin(BuildContext context) {
    if (phoneNumber == "18365268012" && userPassword == "123456") {
      log("login success");
      _showToast(context, "登录成功");
    } else {
      log("login fail");
      _showToast(context, "验证账号密码失败");
    }
  }

  _showToast(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("${msg}")));
  }
}



class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchAndCheckBoxTestRouteState();
  }
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  var _checkBoxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 20,
            height: 35,
            margin: EdgeInsets.all(10),
            child:  Checkbox(
              value: _checkBoxSelected,
              activeColor: Color(0xFF02AF8A),
              onChanged: (value) {
                setState(() {
                  _checkBoxSelected = value;
                });
              },
            ),
          ),

          Text.rich(
            new TextSpan(
                text: '我已阅读并同意某某的',
                style: new TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 13,
                    decoration: TextDecoration.none),
                children: <TextSpan>[
                  new TextSpan(
                      text: '《用户协议》',
                      style: new TextStyle(
                          color: Color(0xFFD91A00),
                          fontSize: 13,
                          decoration: TextDecoration.none)),
                  new TextSpan(
                      text: '与',
                      style: new TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 15,
                          decoration: TextDecoration.none)),
                  new TextSpan(
                      text: '《 隐私政策》',
                      style: new TextStyle(
                          color: Color(0xFFD91A00),
                          fontSize: 13,
                          decoration: TextDecoration.none)),
                ]),
          ),
        ],
      ),
    );
  }
}