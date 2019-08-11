import 'dart:developer';

import 'package:flutter/material.dart';

import 'Register.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    color: Colors.white,
    routes: {
      "register":(context)=>RegisterPage()
    },
  ));
}

class LoginPage extends StatelessWidget {
  var phoneNumber;
  var userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Container(child:Column(
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
              onTap: ()=>Navigator.pushNamed(context, "register"),
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
                  onTap: _goToResetPassword,
                ))),
      ],
    );
  }

  _goToResetPassword() {
    log("go to reset password");
  }
}
class hhhh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ssss"),),
      body: Text("Sss"),
    );
  }
}
