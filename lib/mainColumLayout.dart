import 'package:flutter/material.dart';

void main() {
  runApp(new MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "test",
      home: Scaffold(
        appBar: new AppBar(
          title: new Text("row layout"),
        ),
        body: Center(child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             new RaisedButton(
              onPressed: () {},
              color: Colors.green,
              child: new Text("green btn"),
            ),
            Expanded(child: new RaisedButton(
              onPressed: () {},
              color: Colors.green,
              child: new Text("green btn"),
            ),),
            new RaisedButton(
              onPressed: () {},
              color: Colors.green,
              child: new Text("green btn"),
            ),
          ],
        ),
      )),
    );
  }
}
