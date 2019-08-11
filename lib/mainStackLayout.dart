import 'package:flutter/material.dart';

void main() {
  runApp(new MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var stack = new Stack(
      alignment: FractionalOffset(0.5, 0.8),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage(
              "https://upload-images.jianshu.io/upload_images/14903703-84ae346019e2044b.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1000/format/webp"),
          radius: 100,
        ),
        new Container(
          decoration: new BoxDecoration(color: Colors.lightBlue),
          padding: EdgeInsets.all(10),
          child:Text("sss"),
        )
      ],
    );
    return MaterialApp(
      title: "test",
      home: Scaffold(
          appBar: new AppBar(
            title: new Text("row layout"),
          ),
          body: Center(
            child: stack,
          )),
    );
  }
}
