import 'dart:async';
import 'package:flutter/material.dart';

class CountDownTextRoute extends StatefulWidget {
  CountDownTextRoute({Key key}) : super(key: key);

  _CountDownTextRouteState createState() => _CountDownTextRouteState();
}

class _CountDownTextRouteState extends State<CountDownTextRoute> {
  var _countdownTime = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Text(_countdownTime > 0 ? '$_countdownTime后重新获取' : '获取验证码',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: _countdownTime > 0
                ? Color.fromARGB(255, 183, 184, 195)
                : Color.fromARGB(255, 2, 175, 138))),
        onTap: (){
          if(_countdownTime == 0){
            setState(() {
              _countdownTime = 60;
            });
            _startCountDown();
          }
        },
      ),
    );
  }

  _startCountDown() {
    var oneSec = Duration(seconds: 1);
    Timer _timer;
    var callback = (timer) {
      setState(() {
        if (_countdownTime < 1) {
          _timer.cancel();
        } else {
          _countdownTime = _countdownTime - 1;
        }
      });
    };
    _timer = Timer.periodic(oneSec, callback);
  }
}