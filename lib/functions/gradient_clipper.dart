import 'package:flutter/material.dart';

class GradientClipper extends CustomClipper<Path>{
  List<Offset> offsets;
   GradientClipper({
     @required this.offsets
    });
  
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = new Path();
    path.moveTo(0, height);
    path.addPolygon(offsets, false);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}