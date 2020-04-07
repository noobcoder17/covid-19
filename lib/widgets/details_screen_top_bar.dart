import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//widgets
import '../widgets/custom_back_button.dart';

class DetailsScreenTopBar extends StatelessWidget {
  final formatter = new NumberFormat("#,###");
  final String country;
  final String code;
  final int count;
  final bool isIncreasing;

  DetailsScreenTopBar({
    this.country,
    this.code,
    this.count,
    this.isIncreasing
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(-0.85, -0.5),
            child: CustomBackButton(color: Colors.white70,)
          ),
          Align(
            alignment: Alignment(0,-0.5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset('assets/flags/'+code+'.png',width: 25,),
                SizedBox(width: 15,),
                Text(country,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),)
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.2,0.4),
              child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(formatter.format(count),style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                Icon(isIncreasing ? Icons.arrow_upward : Icons.arrow_downward,color: Colors.white,)
              ],
            ),
          )
        ],
      ),
    );
  }
}