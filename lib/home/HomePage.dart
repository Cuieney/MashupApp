import 'package:flutter/material.dart';
import 'package:linker/widgets/progress/flutter_rounded_progress_bar.dart';
import 'package:linker/widgets/progress/rounded_progress_bar_style.dart';

import 'package:linker/model/HomeDataResp.dart';

import 'package:linker/routers/FluroConvertUtils.dart';
import 'package:linker/routers/NavigatorUtils.dart';
import 'package:linker/routers/Routers.dart';
import 'package:linker/widgets/CustomImageView.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TopTabBar(),
    );
  }
}

class TopTabBar extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    new Tab(
      text: '推荐',
    ),
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
          actions: <Widget>[
            Container(
              width: 30,
              height: 30,
              child: Icon(
                Icons.add,
                color: Color(0xFF696969),
              ),
            ),
            Container(
              width: 30,
              height: 30,
              child: Icon(
                Icons.search,
                color: Color(0xFF696969),
              ),
            ),
          ],
          toolbarOpacity: 0.8,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          titleSpacing: 5,
          title: TabBar(
              labelStyle: TextStyle(fontSize: 18, color: Color(0xFF02AF8A)),
              unselectedLabelStyle:
                  TextStyle(fontSize: 18, color: Color(0xFF666666)),
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
    for (int i = 0; i < 3; i++) {
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
      data.like = 10;
      List<String> imgs = [];
      if (i == 1) {
        for (int j = 0; j < 6; j++) {
          if (j == 2) {
            imgs.add(
                "https://upfile.asqql.com/2009pasdfasdfic2009s305985-ts/2019-6/20196921481957978.gif");
          } else if(j == 3){
            imgs.add(
                "https://n.sinaimg.cn/tech/transform/457/w292h165/20191226/9c33-imfiehq3825223.gif");
          }else if(j == 4){
            imgs.add(
                "https://n.sinaimg.cn/tech/transform/608/w274h334/20191226/deef-imfiehq3821290.gif");
          }else {
            imgs.add(
                "https://ss1.baidu.com/-4o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=907f6e689ddda144c5096ab282b6d009/dc54564e9258d1092f7663c9db58ccbf6c814d30.jpg");
          }
        }
      }
      data.imgs = imgs;
      list.add(data);
    }
    setState(() {
      homeList.addAll(list);
    });
  }
}

class HomeItem extends StatelessWidget {
  final HomeDataResp homeData;
  final int index;

  const HomeItem({Key key, @required this.homeData, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigatorUtils.goWebViewPage(
            context, "Flutter 中文社区", "https://flutter-io.cn/");
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ClipRRect(
                            child: CustomImageView(
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                              url: homeData.headUrl,
                            ),
                              borderRadius: BorderRadius.all(Radius.circular(2)
                              ),
                          ),
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          homeData.from,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff212121)),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${homeData.userName}  ${homeData.time}",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff999999)),
                                        ),
                                      ),
                                    ],
                                  ))),
                          Container(
                              alignment: Alignment.topRight,
                              width: 55,
                              height: 0,
                              child: Material(
                                color: Color(0xFF4A90E2),
                                child: Center(
                                  child: Text(
                                    "关注",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                          Container(
                              alignment: Alignment.topRight,
                              child: Material(
                                color: Colors.white,
                                child: Center(
                                  child: Icon(Icons.more_horiz,
                                      color: Color(0xFF8E8E93)),
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        homeData.title,
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff212121)),
                      ),
                    ),
                    homeData.imgs.length > 0
                        ? Container(
                            margin: EdgeInsets.only(top: 10),
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              // physics: NeverScrollableScrollPhysics(),
                              controller:
                                  new ScrollController(keepScrollOffset: false),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 2,
                                      crossAxisSpacing: 2,
                                      childAspectRatio: 1),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    var map = Map<String,dynamic>();
                                    map['key'] = FluroConvertUtils.object2string(HomeDataResp.HomeDataRespToJson(homeData));
                                    NavigatorUtils.pushWithParams(context,
                                        Routers.displayImageView, map);
                                  },
                                  child: CustomImageView(
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    url: homeData.imgs[index],
                                  ),
                                );
                              },
                              itemCount: homeData.imgs.length,
                            ),
                          )
                        : Container(),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[


                        ClipRRect(
                          child: CustomImageView(
                            width: 35,
                            height: 35,
                            fit: BoxFit.cover,
                            url: homeData.headUrl,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              bottomLeft: Radius.circular(2))
                        ),

                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 40),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Hello",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Adele",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Opacity(
                          opacity: 0.3,
                          child: Container(
                            child: RoundedProgressBar(
                              height: 35,
                              style: RoundedProgressBarStyle(
                                  colorProgress: Color(0xDD4A90E2),
                                  backgroundProgress: Color(0x334A90E2),
                                  borderWidth: 0,
                                  widthShadow: 0),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              borderRadius: BorderRadius.circular(2),
                              percent: 60,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.play_arrow,
                            color: Color(0xFF4A90E2),
                          ),
                        )
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        homeData.desc,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff4E4E4E)),
                      ),
                    ),
//                  Container(
//                    padding: EdgeInsets.only(bottom: 10),
//                    child: new ItemBar(homeData: homeData),
//                  )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class ItemBar extends StatelessWidget {
  final HomeDataResp homeData;

  const ItemBar({Key key, @required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.thumb_up,
                color: Color(0xFF333333),
              ),
              Container(
                padding: EdgeInsets.only(right: 10, left: 5),
                child: Text("${homeData.like}",
                    style: TextStyle(color: Color(0xFF212121), fontSize: 15)),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.comment, color: Color(0xFF333333)),
              Container(
                padding: EdgeInsets.only(right: 10, left: 5),
                child: Text("${homeData.comment}",
                    style: TextStyle(color: Color(0xFF212121), fontSize: 15)),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.repeat, color: Color(0xFF333333)),
              Container(
                padding: EdgeInsets.only(right: 10, left: 5),
                child: Text("${homeData.repost}",
                    style: TextStyle(color: Color(0xFF212121), fontSize: 15)),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.star_border, color: Color(0xFF333333))
            ],
          ),
        ],
      ),
    );
  }
}
