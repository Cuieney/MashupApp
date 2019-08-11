import 'package:flutter/material.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:"test listview",
       home: Scaffold(
         appBar: new AppBar(title: new Text("hellow"),),
         body:Center(
           child: Container(
             height: 200,
             child: new MyList(),
           ),
         ),
         
       ),
    );
  }
}

class MyList extends StatelessWidget{
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