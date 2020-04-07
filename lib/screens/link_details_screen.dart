import 'package:flutter/material.dart';
import '../models/page_view_model.dart';

//widgets
import '../widgets/detail_card.dart';
import '../widgets/custom_back_button.dart';

class LinkDetailsScreen extends StatefulWidget {
  static const routeName = 'link_details_screen';
  @override
  _LinkDetailsScreenState createState() => _LinkDetailsScreenState();
}

class _LinkDetailsScreenState extends State<LinkDetailsScreen> {
  int tileIndex = 0;
  @override
  Widget build(BuildContext context) {
    PageContent pageContent = ModalRoute.of(context).settings.arguments as PageContent;
    List<Widget> list = [];
    for(int i=0;i<pageContent.content.length;i++){
      list.add(
        DetailCard(
          title: pageContent.content[i].title,
          details: pageContent.content[i].details,
          imagePath: pageContent.content[i].imagePath,
          isSelected: i==tileIndex?true:false,
          onTap: (){
            setState(() {
              tileIndex=i;
            });
          },
        )
      );
    }
    return Scaffold(
      //backgroundColor: Color(0xfff3f5fc),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: CustomBackButton(color: Colors.black,) 
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(pageContent.heading1,style: TextStyle(fontSize: 16),),
                        Text(pageContent.heading2,style: TextStyle(fontSize: 23)),
                        SizedBox(height: 5,),
                        Text(pageContent.heading3,style: TextStyle(fontSize: 10),)
                      ],
                    ),
                    Hero(tag: 'hero',child: Image.asset('assets/logo.png',height: 100,))
                  ],
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: list,
              )
            ],
          ),
        ),
      )
    );
  }
}


