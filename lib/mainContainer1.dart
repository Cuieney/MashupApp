
import 'package:flutter/material.dart';
void main() {
  runApp(new MyHomePage());
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "test",
      home: Scaffold(
        body: Center(
         child: Container(
           child: Text("欢迎回来",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight:FontWeight.bold),),
           alignment: Alignment.bottomCenter,
           width: 500,
           height: 400,
           color: Colors.blue,
         ),
          
        ),
      ),
      
    );
  }

}