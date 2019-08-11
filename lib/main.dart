
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
          child: Text(
            "欢迎回来",
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
                fontSize: 30,
              fontWeight:FontWeight.bold
            ),

          ),
          
        ),
      ),
      
    );
  }

}