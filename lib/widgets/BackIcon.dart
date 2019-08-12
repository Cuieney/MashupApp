import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Icon(Icons.arrow_back_ios, color: Colors.black),
        onTap: (){
            Navigator.pop(context);
        },

      ),

    );
  }
}
