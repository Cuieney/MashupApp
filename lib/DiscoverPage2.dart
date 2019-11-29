import 'package:flutter/material.dart';

import 'model/DiscoverDataResp.dart';
import 'model/HomeDataResp.dart';
import 'widgets/CustomeListView.dart';

void main() {
  runApp(MaterialApp(
    color: Color(0xFFF1F1F1),
    home: DiscoverList(),
  ));
}

class DiscoverList extends StatefulWidget {
  @override
  _DiscoverListState createState() => _DiscoverListState();
}

class _DiscoverListState extends State<DiscoverList> {
  List<DiscoverDataResp> dataList = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
          ),
          Container(
            height: 40,
            margin: EdgeInsets.all(10),
            child: TextField(
              maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 10),
                prefixIcon: Icon(Icons.search),
                hintText: "搜索",
              ),
              autofocus: false,
            ),
          ),
          Container(
            height: 80,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  child: DiscoverListView(
                    discoverDataResp: dataList[index],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container();
              },
              itemCount: dataList.length,
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    child: TypeList(
                      discoverDataResp: dataList[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    color: Color(0xFFF1F1F2),
                  );
                },
                itemCount: dataList.length,
              ),
            ),
          )
        ],
      ),
    ));
  }

  @override
  void initState() {
    getDataFromServer();
  }

  void getDataFromServer() async {
    List<DiscoverDataResp> list = [];
    for (int i = 0; i < 10; i++) {
      var data = DiscoverDataResp();
      data.type = "今日推荐${i}";
      data.url =
          "https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg";
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
      dataList.addAll(list);
    });
  }
}

class TypeList extends StatelessWidget {
  final DiscoverDataResp discoverDataResp;

  const TypeList({Key key, @required this.discoverDataResp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                      'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg',
                      width: 30,
                      height: 30))),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text("好奇心日报"),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            child: Container(
                alignment: Alignment.topRight,
                width: 55,
                height: 25,
                child: Material(
                  color: Color(0xFF4A90E2),
                  child: Center(
                    child: Text(
                      "关注",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                )),
          ))
        ],
      ),
    );
  }
}

class DiscoverListView extends StatelessWidget {
  final DiscoverDataResp discoverDataResp;

  const DiscoverListView({Key key, @required this.discoverDataResp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 80,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(discoverDataResp.url),
          ),
          Text(discoverDataResp.type, overflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }
}
