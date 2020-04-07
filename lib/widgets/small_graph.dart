
import 'package:flutter/material.dart';

//functions
import '../functions/curve_painter.dart';


class SmallGraphPanel extends StatelessWidget {
  final String label;
  final IconData icon;
  final double value;
  final Color startColor;
  final Color fontColor;
  final Color iconColor;
  final Color lineColor;
  final Color lineShadowColor;

  SmallGraphPanel({
    @required this.label, 
    @required this.icon, 
    @required this.value, 
    @required this.startColor, 
    @required this.fontColor, 
    @required this.iconColor,
    @required this.lineColor,
    @required this.lineShadowColor
  });    
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: <Color>[
            startColor,
            Colors.white
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft
        )
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(label,style: TextStyle(fontSize: 10,color: fontColor),),
                  Icon(icon,size: 16,color: iconColor,)
                ],
              ),
              Text(value.toString()+"k",style: TextStyle(color: fontColor,fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(width: 5,),
          CurvePainter(
            duration: Duration(seconds: 1),
            size: Size(40,20),
            color: lineColor,
            isIncreasing : true
          ),
          // Stack(
          //   children: <Widget>[
          //     ClipPath(
          //      clipper: GradientClipper(offsets: offsets), 
          //       child: Container(
          //         height: size.height,
          //         width: size.width,
          //         decoration: BoxDecoration(
          //           gradient: LinearGradient(
          //             colors: [
          //               //Color(0xffffb8ba),
          //               //Color(0xfffbe7e8)
          //               lineShadowColor,
          //               startColor
          //             ],
          //             begin: Alignment.topCenter,
          //             end: Alignment.bottomCenter
          //           ),
          //           //border: Border(top: BorderSide(color: Colors.red,width: 2))
          //         ),
          //       ),
          //     ),
          //     CustomPaint(
          //       painter: LinePainter(
          //         color: lineColor,
          //         offsets: offsets,
          //         lineWidth: 1
          //       ),
          //       size: size,
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}


