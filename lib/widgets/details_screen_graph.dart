import 'package:flutter/material.dart';

//functions
import '../functions/line_painter.dart';
import '../functions/get_offsets.dart';
import '../functions/gradient_clipper.dart';


class DetailsScreenGraph extends StatefulWidget {
  final double height;
  final double width;
  final List<int> points;
  final Map<String,Color> colors;

  const DetailsScreenGraph({this.height, this.width,this.points,this.colors});
  
  @override
  _DetailsScreenGraphState createState() => _DetailsScreenGraphState();
}

class _DetailsScreenGraphState extends State<DetailsScreenGraph> {
  double value;
  @override
  void initState() {
    super.initState();
    value = widget.points[0].toDouble();
  }
  @override
  Widget build(BuildContext context) {
    Size canvasSize = Size(widget.width,widget.height-55);
    List<Offset> offsets = getOffsets(widget.points,canvasSize);
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: widget.height,
          width: widget.width,
        ),
        ClipPath(
        clipper: GradientClipper(offsets: offsets), 
          child: Container(
            height: canvasSize.height+100,
            width: canvasSize.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  //Color(0xffffb8ba),
                  widget.colors['gradientStart'],
                  Colors.white
                  //Color(0xfffbe7e8)
                  //lineShadowColor,
                  //startColor
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ),
          ),
        ),
        CustomPaint(
          size: canvasSize,
          painter: LinePainter(
            color: widget.colors['lineColor'],
            offsets: offsets,
            lineWidth: 2
          ),
        ),
      ],
    );
  }
}