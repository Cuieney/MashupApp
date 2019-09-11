import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Color(0xffF1F1F1),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 45, bottom: 15),
              child: Center(
                child: Text("我的",
                    style: TextStyle(fontSize: 18, color: Color(0xff212121))),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, bottom: 30, top: 10),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 78.0,
                    height: 78.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://upload-images.jianshu.io/upload_images/3301720-db890fabf626e0ac.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp"),
                        //从Assets加载图片
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "xxxxxxx",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff212121)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            "xxxxxxxxxxx",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff999999)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      height: 10,
                      width: 15,
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xff999999),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 60,
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[Icon(Icons.message), Text("消息")],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[Icon(Icons.history), Text("历史")],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[Icon(Icons.star_border), Text("收藏")],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[Icon(Icons.settings), Text("设置")],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(top: 1),
                    padding: EdgeInsets.only(left: 10, right: 5),
                    color: Colors.white,
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Text("订阅列表"),
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Color(0xff999999),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(top: 1),
                    padding: EdgeInsets.only(left: 10, right: 5),
                    color: Colors.white,
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Text("我的评价"),
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Color(0xff999999),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(top: 1),
                    padding: EdgeInsets.only(left: 10, right: 5),
                    color: Colors.white,
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Text("离线缓存"),
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Color(0xff999999),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 10, right: 5),
                    color: Colors.white,
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Text("意见反馈"),
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Color(0xff999999),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(top: 1),
                    padding: EdgeInsets.only(left: 10, right: 5),
                    color: Colors.white,
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Text("APP评分"),
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Color(0xff999999),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          
          
            Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 1),
                      color: Colors.white,
                    ),
                  )
          ],
        ),
      );
  }
}
