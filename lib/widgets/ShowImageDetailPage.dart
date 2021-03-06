import 'package:flutter/material.dart';
import 'package:linker/model/HomeDataResp.dart';

import 'package:linker/routers/NavigatorUtils.dart';

class ShowImageDetailPage extends StatefulWidget {
  final HomeDataResp rsp;

  const ShowImageDetailPage({Key key, this.rsp}) : super(key: key);

  @override
  _ShowImageDetailPageState createState() => _ShowImageDetailPageState();
}

class _ShowImageDetailPageState extends State<ShowImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.black,
        child: Container(
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Stack(
            children: <Widget>[
              PageView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          color: Colors.yellowAccent,
                          child: Image.network(widget.rsp.imgs[index],
                              fit: BoxFit.cover)),
                    )
                  ]));
                },
                itemCount: widget.rsp.imgs.length,
              ),

              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    NavigatorUtils.goBack(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    NavigatorUtils.goBack(context);
                  },
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
