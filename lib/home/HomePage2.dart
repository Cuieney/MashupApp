import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'package:linker/model/HomeDataResp.dart';

//void main() {
//  runApp(MaterialApp(
//    color: Color(0xFFF1F1F2),
//    home: NewHomePage(),
//  ));
//}
import 'package:flutter/foundation.dart';

bool isWeb = (defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.android);
class NewHomePage extends StatelessWidget {
  const NewHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: isWeb?20:45),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: Colors.white,
              alignment: Alignment.center,

              child: Text(
                "Linker",
                style: TextStyle(
                    color: Color(0xFF212121),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                child: DataListContainer(),
              ),
            ),
          ],
        ),
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
        for (int j = 0; j < 9; j++) {
          if (j == 0) {
            imgs.add("https://static.cnodejs.org/FhbRjHzt02UssAWL7pa4b6rOvh78");
          } else if (j == 2) {
            imgs.add(
                "https://f.sinaimg.cn/tech/transform/539/w219h320/20191226/e091-imfiehq3800840.gif");
          } else if (j == 3) {
            imgs.add(
                "https://n.sinaimg.cn/tech/transform/457/w292h165/20191226/9c33-imfiehq3825223.gif");
          } else if (j == 6) {
            imgs.add(
                "https://n.sinaimg.cn/tech/transform/312/w200h112/20191226/f489-imfiehq3795843.gif");
          } else if (j == 4) {
            imgs.add(
                "https://n.sinaimg.cn/tech/transform/608/w274h334/20191226/deef-imfiehq3821290.gif");
          } else {
            imgs.add(
                "https://ss1.baidu.com/-4o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=907f6e689ddda144c5096ab282b6d009/dc54564e9258d1092f7663c9db58ccbf6c814d30.jpg");
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
            return HomeItem(
              homeData: dataList[index],
              index: index,
            );
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
