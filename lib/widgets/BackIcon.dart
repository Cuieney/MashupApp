import 'package:flutter/material.dart';

import 'package:linker/routers/NavigatorUtils.dart';

class BackIcon extends StatelessWidget {
  final bool updateView;
  final Color color;
  const BackIcon({Key key, this.updateView,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colors = color;
    if(colors == null){
      colors = Color(0xFF4A90E2);
    }
    return Container(
      child: GestureDetector(
        child: Icon(Icons.arrow_back_ios, color: colors),
        onTap: () {
          NavigatorUtils.goBackWithParams(
              context, updateView == null ? false : updateView);
        },
      ),
    );
  }
}
