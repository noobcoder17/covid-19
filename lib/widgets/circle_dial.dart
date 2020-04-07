import 'package:flutter/material.dart';
import 'dart:math';

class DialColorData {
  final Color labelColor;
  final Color gradientStartColor;
  final Color gradientEndColor;
  final Color innerCircleColor;
  DialColorData({
    @required this.labelColor,
    @required this.innerCircleColor,
    @required this.gradientStartColor,
    @required this.gradientEndColor
  });
}

class CircleDial extends StatelessWidget {
  final double radius;
  final double value;
  final DialColorData dialColorData;


  CircleDial({
    @required this.radius,
    @required this.value,
    @required this.dialColorData
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius+25,
      width: radius+25,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: value),
        duration: Duration(seconds: 1),
        builder: (ctx, value, _) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: MyPainter(
                    angle: 2*pi*value,
                    innerCircleColor: dialColorData.innerCircleColor,
                    gradientStartColor: dialColorData.gradientStartColor,
                    gradientEndColor: dialColorData.gradientEndColor
                  ),
                  size: Size(radius,radius),
                ),
              ),
              Text(
                "${getNewValue(value)}%",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: dialColorData.labelColor
                ),
              ),
              Align(
                alignment: Alignment(
                  cos(2*pi*value-pi/2),
                  sin(2*pi*value-pi/2)
                ),
                child: Card(
                  elevation: 10,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                      color: dialColorData.gradientEndColor,
                      border: Border.all(color: Colors.white, width: 4),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
String getNewValue(double value){
  double val = value*100;
  return val.toStringAsPrecision(3);
}
class MyPainter extends CustomPainter {
  double angle;
  Color gradientStartColor;
  Color gradientEndColor;
  Color innerCircleColor;

  SweepGradient sweepGradient;
  MyPainter({
    this.angle,
    this.gradientStartColor,
    this.gradientEndColor,
    this.innerCircleColor
  }){
    sweepGradient = SweepGradient(
      colors: <Color>[
        gradientStartColor, 
        gradientEndColor
      ],
      center: Alignment.center,
      startAngle: 0,
      endAngle: 2*pi
    );
  }


  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.height / 2, size.width / 2);
    double radius = size.height / 2;

    Rect rect = Rect.fromCircle(center: center, radius: radius);
    Paint circle1 = Paint()..color = innerCircleColor;
    Paint circle2 = Paint()..color = Colors.white;

    Paint arc = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5
      ..shader = sweepGradient.createShader(rect);

    canvas.drawCircle(center, radius, circle1);
    canvas.drawCircle(center, radius / 2, circle2);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 0, angle, false, arc);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return oldDelegate.angle!=angle;
  }
}