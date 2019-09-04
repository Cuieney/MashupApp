import 'package:flutter/material.dart';
import 'dart:convert' show json;

import 'model/HomeDataResp.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TopTabBar(),
      ),
    );
  }
}

class TopTabBar extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: '推荐'),
    new Tab(text: '本地'),
    new Tab(text: '娱乐'),
    new Tab(text: '体育'),
    new Tab(text: '科技'),
    new Tab(text: '政治'),
    new Tab(text: '经济'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: TabBar(
              indicatorColor: Colors.white,
              labelColor: Color(0xFF02AF8A),
              unselectedLabelColor: Color(0xFF666666),
              tabs: myTabs.map((Tab tab) {
                return Text(tab.text);
              }).toList(),
              isScrollable: true),
        ),
        body: TabBarView(
            children: myTabs.map((Tab tab) {
          return HomeList(type: tab.text);
        }).toList()),
      ),
    );
  }
}

class HomeList extends StatefulWidget {
  final String type;

  const HomeList({Key key, @required this.type}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List<HomeDataResp> homeList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: homeList.length,
        itemBuilder: (context, index) {
          return HomeItem(homeData: homeList[index]);
        },
      ),
    );
  }

  @override
  void initState() {
    _getDateFromNet();
  }

  _getDateFromNet() async {
    List<HomeDataResp> list = [];
    for (int i = 0; i < 10; i++) {
      var data = HomeDataResp();
      data.desc = "21 日晚，离婚相关争议，随后具惠善也发文回击，称是自己因养的小狗去世先得的抑郁";
      data.title = "如何看待具惠善回击安宰贤?";
      data.userName = "cuieney";
      data.time = "五分钟前";
      data.headUrl =
          "https://pic2.zhimg.com/50/v2-4977a5b1688ee7b9ee49d3f2f8d23684_b.jpg";
      data.url = "https://www.zhihu.com/question/342015157";
      data.from = "知乎";
      data.repost = 10;
      data.comment = 10;
      data.like= 10;
      list.add(data);
    }
    setState(() {
      homeList.addAll(list);
    });
  }
}

class HomeItem extends StatelessWidget {
  final HomeDataResp homeData;

  const HomeItem({Key key, @required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[

        Container(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(homeData.headUrl),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      homeData.from,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 15, color: Color(0xff212121)),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "${homeData.userName}  ${homeData.time}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 10, color: Color(0xff999999)),
                                    ),
                                  ),
                                ],
                              ))),
                      Container(
                          alignment: Alignment.topRight,
                          width: 55,
                          height: 25,
                          child: Material(
                            color: Color(0xFF02AF8A),
                            child: Center(
                              child: Text(
                                "关注",
                                style:
                                TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    homeData.title,
                    style: TextStyle(fontSize: 16, color: Color(0xff212121)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    homeData.desc,
                    style: TextStyle(fontSize: 15, color: Color(0xff4E4E4E)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      
                      Row(
                        children: <Widget>[
                          Icon(Icons.thumb_up,color: Color(0xFF333333),),
                          Container(padding: EdgeInsets.only(right: 10,left: 5),child: Text("${homeData.like}",style: TextStyle(color: Color(0xFF212121),fontSize: 15)),),
                          
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          Icon(Icons.comment,color: Color(0xFF333333)),
                          Container(padding: EdgeInsets.only(right: 10,left: 5),child: Text("${homeData.comment}",style: TextStyle(color: Color(0xFF212121),fontSize: 15)),),
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          Icon(Icons.repeat,color: Color(0xFF333333)),
                          Container(padding: EdgeInsets.only(right: 10,left: 5),child: Text("${homeData.repost}",style: TextStyle(color: Color(0xFF212121),fontSize: 15)),),
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          Icon(Icons.star_border,color: Color(0xFF333333))
                        ],
                      ),
                      
                    ],
                    
                  ),

                )
              ],
            )),
        Container(
          color: Color(0xFFF1F1F1),
          height: 10,
          child: null,
        )

      ],),
    );
  }
}
