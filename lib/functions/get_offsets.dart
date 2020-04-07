import 'package:flutter/material.dart';

int min(List<int> data){
  int m = data[0];
  for(int i=0;i<data.length;i++){
    if(data[i]<m){
      m = data[i];
    }
  }
  return m;
}

int max(List<int> data){
   int m = data[0];
  for(int i=0;i<data.length;i++){
    if(data[i]>m){
      m = data[i];
    }
  }
  return m;
}

List<Offset> getOffsets(List<int> data,Size size){
  int i;
  List<Offset> offsetsList = [];
  int n = data.length;
  double widthFactor = size.width/(n-1);
  List<int> differances = [];
  List<double> percentage = [];
  int mi = min(data);
  for(i=0;i<n;i++){
    differances.add(data[i]-mi);
  }
  int m = max(differances);
  for(i=0;i<n;i++){
    double p = differances[i]/m;
    percentage.add(1-double.parse(p.toStringAsPrecision(3)));
  }
  for(i=0;i<n;i++){
    //print(0+widthFactor*i);
    offsetsList.add(
      Offset(
        0+(widthFactor*i),
        size.height*percentage[i]        
      )
    );
  }
  return offsetsList;
}