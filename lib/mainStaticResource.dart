
import 'package:flutter/material.dart';
void main(){
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hgghgh",
      home: Scaffold(
        appBar: AppBar(title: Text("static resource"),),
        body: Container(
          child:Image.asset("images/resource.jpg"),
        ),
      ),
    );
  }
}
