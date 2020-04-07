import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//provider
import '../providers/home_provider.dart';

//models
import '../models/summary_each_country.dart';

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

class ViewAll extends StatefulWidget {
  static const routeName = 'view-all';
  @override
  _ViewAllState createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String filterKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 35,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              cursorColor: Color(0xff52b9aa),
              style: TextStyle(color: Color(0xff52b9aa)),
              decoration: InputDecoration(
                hintText: "Country Name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color:Color(0xff52b9aa),width: 1.4,style: BorderStyle.solid)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color(0xff52b9aa),width: 1.4,style: BorderStyle.solid)
                ),
                prefixIcon: Icon(Icons.search,color: Color(0xff52b9aa),size: 17,),
              ),
              onChanged: (String val){
                setState(() {
                  filterKey = val;
                });
              },
            ),
          ),
          Expanded(
            child: Consumer<HomeProvider>(
              builder: (ctx,provider,_){
                List<SummaryEachCountry> list = provider.getSummeryList(filterKey);
                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    childAspectRatio: 2/2.9,
                  ), 
                  itemCount: list.length,
                  itemBuilder: (ctx,i){
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 17),                
                      //color: colordata[i%colordata.length].backgroundColor,
                      child: CountryListItem(
                        height: 180,
                        countryName: list[i].country,
                        countrySlug: list[i].slug,
                        countryCode: list[i].code,
                        value: list[i].totalConfirmed,
                        flagPath: list[i].flagPath,
                        isIncreasing: list[i].isIncreasing,
                        itemColorData: colordata[i%colordata.length],
                      ),
                    );
                  }
                );
              },
            ),
          ),
          
          
        ],
      ),
      
    );
  }
}

