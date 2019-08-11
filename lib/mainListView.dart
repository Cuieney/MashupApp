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
         body: new ListView(
           children: <Widget>[
             new ListTile(
               leading: new Icon(Icons.perm_camera_mic),
               title: new Text("hhhh"),
             ),
             new ListTile(
               leading: new Icon(Icons.perm_camera_mic),
               title: new Text("hhhh"),
             ),
             new ListTile(
               leading: new Icon(Icons.perm_camera_mic),
               title: new Text("hhhh"),
             ),
             new ListTile(
               leading: new Icon(Icons.perm_camera_mic),
               title: new Text("hhhh"),
             ),
             new ListTile(
               leading: new Icon(Icons.perm_camera_mic),
               title: new Text("hhhh"),
             ),
             Image.network(
               'https://upload-images.jianshu.io/upload_images/13061281-25021a98c052ef93.jpg',
               color: Colors.yellow,
               colorBlendMode: BlendMode.color,
               repeat: ImageRepeat.repeatX,
               width: 200,
               height: 100,
             ),
           ],
         ),
         
       ),
    );
  }

}