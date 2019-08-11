
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
           alignment: Alignment.topLeft,
           width: 500,
           height: 400,
           padding: const EdgeInsets.fromLTRB(40,10,20,40),
           margin: const EdgeInsets.all(20),
           decoration:  BoxDecoration(
             gradient: const LinearGradient(
                 colors: [Colors.red,Colors.white,Colors.yellow],
             ),
             border: Border.all(width: 2,color: Colors .red)
           ),
         ),
          
        ),
      ),
      
    );
  }

}