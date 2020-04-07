import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Color color;
  CustomBackButton({this.color});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(4)
        ),
        child: Icon(Icons.arrow_back_ios,size: 18,color: color,),
      ),
    );
  }
}