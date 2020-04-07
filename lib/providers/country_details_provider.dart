import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryDetailsProvider extends ChangeNotifier {
  String slug;
  String country;
  String code;
  bool isIniting = true;
  Map<String,int> timeLine;
  int total = 0;
  bool increasing = false;
  CountryDetailsProvider({this.slug,this.country,this.code}) {
    initData('confirmed');
  }

  String get getCountry {
    return country;
  }
  String get getCountryCode {
    return code;
  }
  int get getCount{
    return total;
  }
  bool get isIncreasing {
    return increasing;
  }
  List<int> get points {
    List<int> temp = [];
    timeLine.forEach((key,value){
      temp.add(value);
    });
    return temp;
  }

  Future<void> initData(String caseType) async{
    final res = await http.get('https://api.covid19api.com/total/country/$slug/status/$caseType');
    List<dynamic> data = json.decode(res.body);
    Map<String,int> tempTimeLine = {};
    int tempTotal = 0;
    int prevTotal = 0;
    data.forEach((each){
      prevTotal = tempTotal;
      tempTotal = each['Cases'];
      String date = each['Date'];
      if(tempTimeLine.containsKey(date)){
        tempTimeLine[date] += each['Cases'];
      }else{
        tempTimeLine[date] = each['Cases'];
      }
    });
    if(tempTotal-prevTotal>0){
      increasing = true;
    }
    timeLine = tempTimeLine;
    total = tempTotal;
    isIniting = false;
    notifyListeners();
  }
}