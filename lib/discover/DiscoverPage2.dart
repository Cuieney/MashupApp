
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:linker/http/HttpConstant.dart';
import 'package:linker/http/HttpRequest.dart';
import 'package:linker/model/DiscoverModel.dart';

import 'package:linker/widgets/CustomImageView.dart';

import 'package:flutter/foundation.dart';

bool isWeb = (defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.android);
class DiscoverList extends StatefulWidget {
  @override
  _DiscoverListState createState() => _DiscoverListState();
}

class _DiscoverListState extends State<DiscoverList> {
  List<DiscoverModel> dataList = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: isWeb?10:45),
      child: Column(
        children: <Widget>[
          Container(
            color: Color(0x224A90E2),
            margin: EdgeInsets.all(10),
            child: Center(
              child: TextField(
                textAlign: TextAlign.left,
                maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF4A90E2),
                ),
                hintText: "搜索你感兴趣的主题吧",
                hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
              autofocus: false,
            ),
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
    List<DiscoverModel> list = [];

    await HttpRequest.request(HttpConstant.type, Method.GET)
        .then((dynamic response) {
      var data = response['data'];
      print("xxxxx ${response}");
      print("xxxxx ${data}");

      var listData = response['data'] as List;

      list = listData.map((dynamic i) {
        var data = new DiscoverModel();
        data.title = i['title'];
        data.id = i['id'];
        data.image_url = i['image_url'];
        return data;
      }).toList();

      setState(() {
        dataList.addAll(list);
      });

    }).catchError((error) {
      Future<String> json = DefaultAssetBundle.of(context).loadString("assets/discover.json");
      json.then((value){
        var response = jsonDecode(value);
        var listData = response['data'] as List;
        list = listData.map((dynamic i) {
          var data = new DiscoverModel();
          data.title = i['title'];
          data.id = i['id'];
          data.image_url = i['image_url'];
          return data;
        }).toList();

        setState(() {
          dataList.addAll(list);
        });

      }).catchError((error)=>print("error ${error}"));
      print("ssssss $error}");
    });


  }
}

class TypeList extends StatelessWidget {
  final DiscoverModel discoverDataResp;

  const TypeList({Key key, @required this.discoverDataResp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[

          ClipRRect(
              child: CustomImageView(
                width: 30,
                height: 30,
                fit: BoxFit.cover,
                url: discoverDataResp.image_url,
              ),
            borderRadius: BorderRadius.circular(5),
          ),

          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text("${discoverDataResp.title}"),
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
