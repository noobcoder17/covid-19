import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//models
import '../models/summary_each_country.dart';

//providers
import '../providers/home_provider.dart';

//widgets
import '../widgets/country_list_item.dart';


 final List<ItemColorData> colordata = <ItemColorData>[
  ItemColorData(
    backgroundColor:  Color(0xff008e7b),
    gradientColor: Color(0xff009a88),
    lineColor: Color(0xff5bc8b7)
  ),
  ItemColorData(
    backgroundColor:  Color(0xffff775e),
    gradientColor: Color(0xffff8d77),
    lineColor: Color(0xffffc4b7)
  ),
  ItemColorData(
    backgroundColor:  Color(0xfff2d65d),
    gradientColor: Color(0xfff2d65d),
    lineColor: Color(0xfffeedb2)
  ),
  ItemColorData(
    backgroundColor: Color(0xff6078ff),
    gradientColor:Color(0xff758aff),
    lineColor: Color(0xffe7e9fb)
  )
];

class TopCountryList extends StatelessWidget {
  final double height = 180;
  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      child: Consumer<HomeProvider>(
        builder: (ctx,provider,_){
          List<SummaryEachCountry> list = provider.getTopSix;
          return ListView.builder(
            padding: EdgeInsets.only(left: 20,right: 20),
            primary: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (BuildContext ctx,int i){
              return CountryListItem(
                height: height,
                countryName: list[i].country,
                countrySlug: list[i].slug,
                countryCode: list[i].code,
                value: list[i].totalConfirmed,
                flagPath: list[i].flagPath,
                isIncreasing: list[i].isIncreasing,
                itemColorData: colordata[i%colordata.length],
              );
            },  
          );
        },
      ),
    );
  }
}