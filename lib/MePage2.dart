import 'package:flutter/material.dart';

import 'HomePage2.dart';

class MePage2 extends StatelessWidget {
  const MePage2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF1F1F1),
      child: Column(
        children: <Widget>[
          Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 45, bottom: 15),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("我的",
                          style: TextStyle(
                              fontSize: 18, color: Color(0xff212121))),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 15,
                        height: 15,
                        child: Icon(
                          Icons.settings,
                          color: Color(0xFF4A90E2),
                        )),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                  width: 50.0,
                  height: 50.0,
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
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Linda",
                    style: TextStyle(
                        color: Color(0xFF515151),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "关注 719 | 被 200 关注",
                    style: TextStyle(color: Color(0xFF515151)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text("梦想不足以让你到达远方，但是到达远方的人一定有梦想",
                      style: TextStyle(color: Color(0xFF515151), fontSize: 15)),
                ),
              ],
            )),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 1),
              color: Colors.white,
              child: DataListContainer(),
            ),
          )
        ],
      ),
    );
  }
}
