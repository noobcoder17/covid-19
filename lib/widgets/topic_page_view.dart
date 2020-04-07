import 'package:flutter/material.dart';

//values
import '../values/page_content.dart';
 
//screens
import '../screens/link_details_screen.dart';

//widgets
import 'page_indicator.dart';



class TopicPageView extends StatefulWidget {
  @override
  _TopicPageViewState createState() => _TopicPageViewState();
}

class _TopicPageViewState extends State<TopicPageView> {
  PageController _pageController;
  int currentPage;
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
    currentPage = 0;
  }

  void onPageChanged(int i){
    setState(() {
      currentPage = i;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 140,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 310,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xffe9f4f3),
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.87, 1),
              child: Container(
              //height: 150,
              //width: 90,
              child: Hero(tag: "hero",child: Image.asset('assets/logo.png',)),
            ),
          ),
          Container(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: pageContentList.length,
              onPageChanged: (int i){
                onPageChanged(i);
              },
              itemBuilder: (BuildContext ctx,int i){
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(LinkDetailsScreen.routeName,arguments: pageContentList[i]);
                  },
                  child: Align(
                    alignment: Alignment(0.5,0.3),
                      child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Color(0xff057163),fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(text: pageContentList[i].pageHeading,style: TextStyle(fontSize: 17)),
                          TextSpan(text:"\n\n"),
                          TextSpan(text: "Read More",style: TextStyle(fontSize: 13,decoration: TextDecoration.underline))
                        ]
                      ),
                    ),
                  ),
                );
              }
            ),
          ), 
          Align(
            alignment: Alignment(0.85,0.3),
            child: PageIndicator(
              indicatorCount: pageContentList.length,
              currentIndex: currentPage,
            )
          )
        ],
      ),
    );
  }
}