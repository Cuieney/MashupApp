import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../routers/NavigatorUtils.dart';
import '../routers/Routers.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  StreamSubscription _dispose;

  @override
  void initState() {
    super.initState();
    _initSplash();
  }



  void _initSplash() {
    _dispose = Observable.just(1).delay(Duration(microseconds: 2500)).listen((_) {
      _prefs.then((SharedPreferences share) {
        var token = share.get("token");
        print("登录成功");
        print(token);
        if (token != null) {
          NavigatorUtils.push(context, Routers.home, replace: true);
        }else{
          NavigatorUtils.push(context, Routers.login, replace: true);
        }
      });
    });
  }

  @override
  void dispose() {
    _dispose?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Linker"),
        ),
      ),
    );
  }
}
