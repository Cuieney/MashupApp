import 'package:flutter/material.dart';
import 'WebViewPage.dart';
import 'model/DiscoverDataResp.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            padding: EdgeInsets.only(top: 30, bottom: 15),
            child: Text(
              "发现",
              style: TextStyle(color: Color(0xFF212121), fontSize: 18),
            ),
          ),
          Container(
            height: 1,
            color: Color(0xFFF1F1F1),
          ),
          Expanded(
              child: Container(
            child: DiscoverChildPage(),
          ))
        ],
      ),
    );
  }
}

class DiscoverChildPage extends StatefulWidget {
  DiscoverChildPage({Key key}) : super(key: key);

  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverChildPage> {
  List<DiscoverDataResp> discoverDataList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DiscoverList(discoverDataList: discoverDataList),
    );
  }

  @override
  void initState() {
    syncData();
  }

  syncData() async {
    List<DiscoverDataResp> list = [];
    for (int i = 0; i < 3; i++) {
      var data = DiscoverDataResp();
      data.type = "今日推荐${i}";
      List<DiscoverItem> itemList = [];
      for (int j = 0; j < 5; j++) {
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

class DiscoverList extends StatelessWidget {
  final List<DiscoverDataResp> discoverDataList;
  const DiscoverList({Key key, @required this.discoverDataList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: ListView.separated(
        padding: EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) {
          if (index == 0) {
            return Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              color: Color(0xFFF1F1F1),
              child: Container(
                height: 70,
                alignment: Alignment.bottomCenter,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Icon(Icons.message), Text("消息")],
                      ),
                    ),
                    Container(
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Icon(Icons.history), Text("历史")],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Icon(Icons.star_border), Text("收藏")],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Icon(Icons.settings), Text("设置")],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              height: 1,
              color: Color(0xFFF1F1F1),
            );
          }
        },
        shrinkWrap: true,
        itemCount: discoverDataList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Text(discoverDataList[index].type,style: TextStyle(fontSize: 16,color: Color(0xFF212121),fontWeight: FontWeight.bold),),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("全部"),
                            Icon(Icons.keyboard_arrow_right)
                          
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                DiscoverListView(discoverList: discoverDataList[index].list)
              ],
            ),
          );
        },
      ),
    );
  }
}

class DiscoverListView extends StatelessWidget {
  final List<DiscoverItem> discoverList;
  const DiscoverListView({Key key, @required this.discoverList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: discoverList.length,
        itemBuilder: (context, index) {
          return DiscoverItemView(
            dataItem: discoverList[index],
          );
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
      child: GestureDetector(
        onTap: (){
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (_) {
            return WebViewPage(
              url: "https://flutter-io.cn/",
              title: "Flutter 中文社区",
            );
          }));
        },
        child: Container(

          margin: EdgeInsets.only(right: 10),
          child: Stack(
            alignment: FractionalOffset(0, 1),
            children: <Widget>[
              Container(
                  width: 230,
                  height: 230,
                  color: Colors.yellowAccent,
                  child: Image.network(dataItem.url, fit: BoxFit.cover)),
              Container(
                height: 60,
                width: 230,
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.black,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          dataItem.desc,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
