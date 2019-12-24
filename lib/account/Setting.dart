
import 'package:flutter/material.dart';
import 'package:linker/widgets/BackIcon.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10, top: 50),
              child: BackIcon(),
            ),

          ],
        ),
      ),
    );
  }
}
