import 'package:flutter/material.dart';
import 'model/DiscoverDataResp.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("hhhhhr"),
            DiscoverList(type: "今日推荐",),
            // DiscoverList(type: "今日推荐",),
          ],
        ),
      ),
    );
  }
}

class DiscoverList extends StatefulWidget {
  final String type;
  DiscoverList({Key key, @required this.type}) : super(key: key);

  _DiscoverListState createState() => _DiscoverListState();
}

class _DiscoverListState extends State<DiscoverList> {
  List<DiscoverDataResp> discoverDataList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: discoverDataList.length,
        itemBuilder: (context, index) {
          return Container(
            child: ListView.builder(
              itemCount: discoverDataList.length,
              itemBuilder: (context,index){
                return Container(
                  child: DiscoverListView(discoverList:discoverDataList[index].list)
                );
              },
            )
          );
        },
      ),
    );
  }

  @override
  void initState() async{
    super.initState();
    List<DiscoverDataResp> list = [];
    for (int i = 0; i < 8; i++) {
      var data = DiscoverDataResp();
      data.type = "今日推荐${i}";
      List<DiscoverItem> itemList = [];
      for (int j = 0; j < 8; j++) {
        var item = DiscoverItem();
        item.desc = "巴拉巴拉巴咯拉巴咯拉巴咯";
        item.url =
            "https://upload-images.jianshu.io/upload_images/5440469-51c9d22950008274.png?imageMogr2/auto-orient/strip|imageView2/2/w/564/format/webp";
        itemList.add(item);
      }
      data.list = itemList;
      list.add(data);
    }
    setState(() {
      discoverDataList.addAll(list);
    });
  }
}

class DiscoverListView extends StatelessWidget {
  final List<DiscoverItem> discoverList;
  const DiscoverListView({Key key, @required this.discoverList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection:Axis.horizontal,
        itemCount: discoverList.length,
        itemBuilder: (context, index) {
          return DiscoverItemView( dataItem: discoverList[index],);
        },
      ),
    );
  }
}

class DiscoverItemView extends StatelessWidget {
  final DiscoverItem dataItem;
  const DiscoverItemView({Key key, @required this.dataItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
                color: Colors.yellowAccent,
                width: 50,
                height: 50,
                child: Image.network(dataItem.url, fit: BoxFit.cover)),
            Container(
              child: Text(dataItem.desc),
            )
          ],
        ),
      ),
    );
  }
}
