import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '../providers/country_details_provider.dart';

//loading screen
import 'loading_screen.dart';

//widgets
import '../widgets/details_screen_top_bar.dart';
import '../widgets/details_screen_case_type_bar.dart';
import '../widgets/details_screen_graph.dart';
import '../widgets/top_country_bar.dart';
import '../section/top_country_list.dart';
import '../widgets/graph_loader.dart';

Map<String,Map<String,Color>> graphColor = {
  'confirmed' : {
    'lineColor' : Color(0xff44b1a0),
    'gradientStart' : Color(0xff74e3cf)
  },
  'deaths' : {
    'lineColor': Color(0xffff606c),
    'gradientStart': Color(0xffdb6e71)
  },
  'recovered' : {
    'lineColor' : Color(0xff6078ff),
    'gradientStart': Color(0xff6678d1),
  }
};

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details_screen';
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Map<String,String> routeData;
  String currentGraphCaseType = 'confirmed';
  bool isGraphLoading = false;
  @override
  void initState() {
    super.initState();
  }

  void changeCaseType(String caseType,BuildContext ctx) async{
    setState(() {
      currentGraphCaseType = caseType;
      isGraphLoading = true;
    });
    await Provider.of<CountryDetailsProvider>(ctx,listen: false).initData(caseType);
    setState(() {
      isGraphLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
  routeData = ModalRoute.of(context).settings.arguments as Map<String,String>;
  double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<CountryDetailsProvider>(
      create: (ctx)=>CountryDetailsProvider(
        slug: routeData['slug'],
        country: routeData['country'],
        code : routeData['code'],
      ),
      lazy: false,
      child: Scaffold(
        backgroundColor: Color(0xff008e7b),
        body: Consumer<CountryDetailsProvider>(
          builder: (ctx,consumer,_){
            if(consumer.isIniting){
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child:Column(
                children: <Widget>[
                  DetailsScreenTopBar(
                    count: consumer.getCount,
                    country: consumer.country,
                    isIncreasing: consumer.isIncreasing,
                    code : consumer.getCountryCode,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                    ),
                    child: Column(
                      children: <Widget>[
                        DetailsScreenCaseTypebar(
                          caseType: currentGraphCaseType,
                          onChange: changeCaseType,
                        ),
                        SizedBox(height: 20,),
                        isGraphLoading ? GraphLoader() : 
                        consumer.points.length==0? 
                        Container(
                          height:230,
                          width:width,
                          alignment : Alignment.center,
                          child : Text(
                            "No $currentGraphCaseType cases till now.",
                            style : TextStyle(fontSize:20)
                          )
                        ) :
                        DetailsScreenGraph(
                          height: 230,
                          width: width,
                          points: consumer.points,
                          colors: graphColor[currentGraphCaseType],
                        ),
                        TopCountryBar(),
                        SizedBox(height: 5,),
                        TopCountryList()
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}