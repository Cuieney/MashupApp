import 'package:flutter/material.dart';

import 'package:linker/routers/NavigatorUtils.dart';

class BackIcon extends StatelessWidget {
  final bool updateView;

  const BackIcon({Key key, this.updateView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Icon(Icons.arrow_back_ios, color: Colors.black),
        onTap: () {
          NavigatorUtils.goBackWithParams(
              context, updateView == null ? false : updateView);
        },
      ),
    );
  }
}
