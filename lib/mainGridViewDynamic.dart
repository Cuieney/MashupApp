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
          body: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 0.7),
            children: <Widget>[
              new Image.network("https://image.tuguaishou.com/ips_banner/f0/0a/6e/f00a6eaea72a1d643d66a74b0f4e841f436.jpeg?e=3763399910&token=hu-a0KgUj229SEufI3iXqT7e596smcENQUh4W4sA:e_fPenNU8DK5yNgPx-bwbzYFCZk=",fit: BoxFit.cover,),
              new Image.network("https://image.tuguaishou.com/ips_banner/f0/0a/6e/f00a6eaea72a1d643d66a74b0f4e841f436.jpeg?e=3763399910&token=hu-a0KgUj229SEufI3iXqT7e596smcENQUh4W4sA:e_fPenNU8DK5yNgPx-bwbzYFCZk=",fit: BoxFit.cover,),
              new Image.network("https://image.tuguaishou.com/ips_banner/f0/0a/6e/f00a6eaea72a1d643d66a74b0f4e841f436.jpeg?e=3763399910&token=hu-a0KgUj229SEufI3iXqT7e596smcENQUh4W4sA:e_fPenNU8DK5yNgPx-bwbzYFCZk=",fit: BoxFit.cover,),
              new Image.network("https://image.tuguaishou.com/ips_banner/f0/0a/6e/f00a6eaea72a1d643d66a74b0f4e841f436.jpeg?e=3763399910&token=hu-a0KgUj229SEufI3iXqT7e596smcENQUh4W4sA:e_fPenNU8DK5yNgPx-bwbzYFCZk=",fit: BoxFit.cover,),
              new Image.network("https://image.tuguaishou.com/ips_banner/f0/0a/6e/f00a6eaea72a1d643d66a74b0f4e841f436.jpeg?e=3763399910&token=hu-a0KgUj229SEufI3iXqT7e596smcENQUh4W4sA:e_fPenNU8DK5yNgPx-bwbzYFCZk=",fit: BoxFit.cover,),

            ],
          )),
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
