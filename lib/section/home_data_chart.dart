import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '../providers/home_provider.dart';

//widgets
import '../widgets/circle_dial.dart';
import '../widgets/small_graph.dart';
class HomeDataChart extends StatelessWidget {
  final List<DialColorData> colorList = [
    DialColorData(
      labelColor: Color(0xff007a69),
      innerCircleColor: Color(0xffe7f2f1),
      gradientStartColor: Color(0xffb7efe5),
      gradientEndColor: Color(0xff52b9aa)
    ),
    DialColorData(
      labelColor: Color(0xff682429),
      innerCircleColor: Color(0xfffbe7e8),
      gradientStartColor: Color(0xffffb8ba),
      gradientEndColor: Color(0xffff606c)
    ),
    DialColorData(
      labelColor: Color(0xff243268),
      innerCircleColor: Color(0xffe7e9fb),
      gradientStartColor: Color(0xffb8c4ff),
      gradientEndColor: Color(0xff6078ff)
    )
  ];
  final int selectedDialIndex;
  HomeDataChart({this.selectedDialIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Consumer<HomeProvider>(
            builder: (ct,provider,_){
              double val = provider.getDialValue(selectedDialIndex);
              return  CircleDial(
                radius: 135, 
                value: val,
                dialColorData: colorList[selectedDialIndex],
              );
            }
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Consumer<HomeProvider>(
                builder: (ct,provider,_){
                  return SmallGraphPanel(
                    label: "Affected",
                    value: provider.getTotalConfirmed,
                    icon: Icons.arrow_drop_up,
                    fontColor: Color(0xff682429),
                    iconColor: Color(0xffff000f),
                    startColor: Color(0xfffbe7e8),
                    lineShadowColor: Color(0xffffb9bb),
                    lineColor: Color(0xffff4e5d),
                  ); 
                }
              ),
              SizedBox(height: 20,),
              Consumer<HomeProvider>(
                builder: (ct,provider,_){
                  return SmallGraphPanel(
                    label: "Active",
                    value: provider.getTotalActive,
                    icon: Icons.arrow_drop_up,
                    fontColor: Color(0xff027c6b),
                    iconColor: Color(0xff007867),
                    startColor: Color(0xffe8f3f2),
                    lineShadowColor: Color(0xffa2dcd1),
                    lineColor: Color(0xff7dcabd),
                  ); 
                }
              ),
              
            ],
          )
        ],
      ),
    );
  }
}