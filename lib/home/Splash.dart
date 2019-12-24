import 'package:flutter/material.dart';
import '../routers/NavigatorUtils.dart';
import '../routers/Routers.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSplash();
  }

  void _initSplash() {
    var count  = 0;
    Stream<int> stream = Stream.periodic(Duration(seconds: 1));
    stream.listen((data){
      count++;
      if(count == 2){
        NavigatorUtils.goBack(context);
        NavigatorUtils.push(context, Routers.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Center(
          child: Text("Linker"),
        ),
      ),
    );
  }
}
