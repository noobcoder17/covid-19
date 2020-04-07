import 'package:flutter/material.dart';


class PageIndicator extends StatelessWidget {
  final int indicatorCount;
  final int currentIndex;

  PageIndicator({
    @required this.indicatorCount,
    @required this.currentIndex
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> indicators = [];
    for(int i=0;i<indicatorCount;i++){
      if(i==currentIndex){
        indicators.add(CircleIndicator(isActive: true,));
      }else{
        indicators.add(CircleIndicator(isActive: false,));
      }
    }
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: indicators
      ),
    );
  }
}

class CircleIndicator extends StatelessWidget {
  final bool isActive;
  CircleIndicator({this.isActive});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      margin: EdgeInsets.symmetric(vertical: 4),
      width: isActive? 6:5,
      height: isActive? 6:5,
      decoration: BoxDecoration(
        color: isActive? Color(0xff007867) : Color(0xff87cdc0),
        shape: BoxShape.circle
      ),
    ); 
  }
}