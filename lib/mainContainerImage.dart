
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
           child: Image.network(
               'https://upload-images.jianshu.io/upload_images/13061281-25021a98c052ef93.jpg',
             color: Colors.yellow,
             colorBlendMode: BlendMode.color,
             repeat: ImageRepeat.repeatX,

           ),
           width: 300,
           height: 200,

         ),
          
        ),
      ),
      
    );
  }

}