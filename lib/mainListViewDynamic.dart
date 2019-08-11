import 'package:flutter/material.dart';

void main() => runApp(new MyApp(
      items: new List<String>.generate(1000, (i) => "item$i"),
    ));

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "test listview",
      home: Scaffold(
        appBar: new AppBar(
          title: new Text("hellow"),
        ),
        body: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return new ListTile(title: new Text("${items[index]}"),);
            }),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        new Container(
          width: 180,
          color: Colors.yellow,
        ),
        new Container(
          width: 180,
          color: Colors.red,
        ),
        new Container(
          width: 180,
          color: Colors.redAccent,
        ),
        new Container(
          width: 180,
          color: Colors.green,
        ),
      ],
    );
  }
}
