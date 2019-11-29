import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'model/HomeDataResp.dart';

void main() {
  runApp(MaterialApp(
    color: Color(0xFFF1F1F2),
    home: NewHomePage(),
  ));
}

class NewHomePage extends StatelessWidget {
  const NewHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEFEFED),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            height: 60,
            child: Text(
              "Linker",
              style: TextStyle(color: Color(0xFF212121), fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              child: DataListContainer(),
            ),

          ),
        ],
      ),
    );
  }
}

class DataListContainer extends StatefulWidget {
  const DataListContainer({Key key}) : super(key: key);

  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataListContainer> {
  final List<HomeDataResp> dataList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataList(dataList: dataList),
    );
  }

  @override
  void initState() {
    getDataFromServer();
  }

  void getDataFromServer() async {
    List<HomeDataResp> list = [];
    for (int i = 0; i < 6; i++) {
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
          if(j == 2){
            imgs.add("https://static.cnodejs.org/FhbRjHzt02UssAWL7pa4b6rOvh78");
          }else{
            imgs.add(
                "https://upload-images.jianshu.io/upload_images/5440469-51c9d22950008274.png?imageMogr2/auto-orient/strip|imageView2/2/w/564/format/webp");
          }
        }
      }
      data.imgs = imgs;
      list.add(data);
    }
    setState(() {
      dataList.addAll(list);
    });
  }
}

class DataList extends StatelessWidget {
  final List<HomeDataResp> dataList;

  const DataList({Key key, @required this.dataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return HomeItem(homeData: dataList[index],index: index,);
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 10,
              color: Color(0xFFEFEFED),
            );
          },
          itemCount: dataList.length),
    );
  }
}
