import 'package:flutter/material.dart';

//sections
import '../section/home_data_chart.dart';
import '../section/top_country_list.dart';

//widgets
import '../widgets/topic_page_view.dart';
import '../widgets/dial_select_button_bar.dart';
import '../widgets/top_country_bar.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedDialIndex;

  @override
  void initState() {
    super.initState();
    selectedDialIndex=0;
  }

 
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30,),
            TopicPageView(),
            HomeDataChart(selectedDialIndex: selectedDialIndex,),
            DialSelectButtonBar(
              selectedButtonIndex:selectedDialIndex,
              onTap : (int i){
                setState(() {
                  selectedDialIndex=i;
                });
              }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TopCountryBar(),
            ),
            TopCountryList(),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}





