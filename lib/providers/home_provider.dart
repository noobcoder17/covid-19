import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/summary_each_country.dart';

class HomeProvider extends ChangeNotifier {

  int _totalConfirmed = 0;
  int _totalDead = 0;
  int _totalRecovered = 0;
  int _totalActive = 0;
  List<SummaryEachCountry> _summeryList = [];
  List<SummaryEachCountry> _topSix = [];

  List<SummaryEachCountry> get getTopSix {
    return _topSix;
  }

  double getDialValue(int dialIndex){
    if(dialIndex==0){
      return double.parse((_totalActive/_totalConfirmed).toStringAsPrecision(3));
    }else if(dialIndex==1){
      return double.parse((_totalDead/_totalConfirmed).toStringAsPrecision(3));
    }else{
      return double.parse((_totalRecovered/_totalConfirmed).toStringAsPrecision(3));
    }
  }

  double get getTotalConfirmed {
    return double.parse((_totalConfirmed/1000).toStringAsPrecision(5));
  }

  int get getTotalDead {
    return _totalDead;
  }

  int get getTotalRecovered {
    return _totalRecovered;
  }

  double get getTotalActive {
    return double.parse((_totalActive/1000).toStringAsPrecision(5));
  }

  List<SummaryEachCountry>  getSummeryList(String filterKey) {
    if(filterKey!=null){
      String key = filterKey.toLowerCase();
      List<SummaryEachCountry> tempList = [];
      _summeryList.forEach((item){
        String name = item.country.toLowerCase();
        if(name.startsWith(key)){
          tempList.add(item);
        }
      });
      return tempList;
    }
    return _summeryList;
  }

  Future<void> getData() async{
    try {
      final response = await http.get("https://api.covid19api.com/summary");
      final Map<String,dynamic> jsonData =  json.decode(response.body);
      final List<dynamic> data = jsonData['Countries'];

      List<SummaryEachCountry> tempSummeryList = [];
      List<SummaryEachCountry> tempTopSix = [];
      int tempTotalConfirmed = 0;
      int tempTotalDead = 0;
      int tempTotalRecovered = 0;

      SummaryEachCountry temp;

      
      data.forEach((countrySummary){
        if(countrySummary['Country']!=''){
          temp = new SummaryEachCountry().formMap(countrySummary);
          tempSummeryList.add(temp);
          tempTotalConfirmed+=temp.totalConfirmed;
          tempTotalDead+=temp.totalDeaths;
          tempTotalRecovered+=temp.totalRecovered;
          if(tempTopSix.isEmpty){
            tempTopSix.add(temp);
          }else if(tempTopSix[tempTopSix.length-1].totalConfirmed<temp.totalConfirmed && tempTopSix.length<6){
            tempTopSix.add(temp);
          }else if(tempTopSix[tempTopSix.length-1].totalConfirmed<temp.totalConfirmed){
            tempTopSix.removeLast();
            tempTopSix.add(temp);
          }
          tempTopSix.sort((item1,item2){
            if(item1.totalConfirmed<item2.totalConfirmed){
              return 1;
            }
            return 0;
          });
        }
      });
    
      _totalConfirmed = tempTotalConfirmed;
      _totalDead = tempTotalDead;
      _totalRecovered = tempTotalRecovered;
      _summeryList = tempSummeryList;
      _totalActive = tempTotalConfirmed - (tempTotalDead+tempTotalRecovered);
     _topSix = tempTopSix;
      notifyListeners();
    }catch(e){
      print("error");
      throw e;
    }
  }
}