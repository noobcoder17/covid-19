import 'package:flutter/material.dart';

///values
import '../values/case_types.dart';

class DetailsScreenCaseTypebar extends StatelessWidget {
  final String caseType;
  final void Function(String,BuildContext) onChange;
  DetailsScreenCaseTypebar({this.caseType,this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Total ${caseTypes[caseType]} Cases",style: TextStyle(color: Color(0xff006d5f),fontSize: 19,fontWeight: FontWeight.w500),),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Color(0xffe9f4f3),
              borderRadius: BorderRadius.circular(5)
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                icon: Icon(Icons.arrow_drop_down,color: Color(0xff006d5f),),
                style: TextStyle(color: Color(0xff006d5f),fontSize: 13,fontWeight: FontWeight.w500),
                value: caseType,
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem<String>(child: Text("Confirmed"),value: "confirmed",),
                  DropdownMenuItem<String>(child: Text("Recovered"),value: "recovered",),
                  DropdownMenuItem<String>(child: Text("Deaths"),value: "deaths",)
                ], 
                onChanged: (String x){
                  onChange(x,context);
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}