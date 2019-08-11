import 'package:flutter/material.dart';

void main() {
  runApp(new MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = new Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "who  am i",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            subtitle: Text("cuieney"),
            leading: Icon(
              Icons.access_alarm,
              color: Colors.lightBlue,
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "who  am i",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            subtitle: Text("cuieney"),
            leading: Icon(
              Icons.access_alarm,
              color: Colors.lightBlue,
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "who  am i",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            subtitle: Text("cuieney"),
            leading: Icon(
              Icons.access_alarm,
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
      title: "test",
      home: Scaffold(
          appBar: new AppBar(
            title: new Text("row layout"),
          ),
          body: Center(
            child: card,
          )),
    );
  }
}
