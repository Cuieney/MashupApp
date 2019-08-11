import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "page with return params", home: FirstPage()));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("found phone number"),
      ),
      body: Center(child: RouteButton()),
    );
  }
}

class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => _navigate2Xjj(context),
      child: Text("go found xjj"),
    );
  }
}

_navigate2Xjj(BuildContext context) async {
  final result = await Navigator.push(
      context, MaterialPageRoute(builder: (context) => XjjPage()));
  Scaffold.of(context).showSnackBar(SnackBar(content: Text("${result}")));
}

class XjjPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("i am xjj"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(" big tui xjj"),
              onPressed: () {
                Navigator.pop(context, "dachangtui xjj");
              },
            ),
            RaisedButton(
              child: Text(" big daxiong xjj"),
              onPressed: () {
                Navigator.pop(context, "daxiong xjj");
              },
            ),
          ],
        ),
      ),
    );
  }
}
