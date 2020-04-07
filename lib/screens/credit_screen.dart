import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:corona_virus/screens/loading_screen.dart';


class CreditScreen extends StatefulWidget {
  @override
  _CreditScreenState createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  PackageInfo packageInfo;
  bool gotInfo = false;

  @override
  void initState() {
    super.initState();
    info();
  }

  void gitHub() async {
    const url = 'https://github.com/noobcoder17/covid-19';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false,);
    } else {
      throw 'Could not launch $url';
    }
  }

  void info() async {
    packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      gotInfo=true;
    });
  }
  void licenses(BuildContext ctx){
    showAboutDialog(
      context: ctx,
      applicationIcon: Image.asset('assets/logo.png',height: 60,),
      applicationName: "COVID-19",
      applicationLegalese: "@All Copyright Reserved",
      applicationVersion: packageInfo.version,
      children: <Widget>[

      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    if(gotInfo==false){
      return LoadingScreen();
    }
    return  Container(
      padding: EdgeInsets.fromLTRB(30,50,30,30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/logo.png',height: 110,),
              SizedBox(height: 15,),
              Text(
                "COVID-19",
                style: TextStyle(
                  color: Color(0xff057163),
                  fontWeight: FontWeight.w600,
                  fontSize: 24
                ),
              ),
              Text("Version ${packageInfo.version}",style: TextStyle(color: Color(0xff057163)),),
              SizedBox(height: 20,),
              OutlineButton(
                borderSide: BorderSide(color: Color(0xff026c5d)),
                splashColor: Color(0xffe9f4f3),
                highlightColor: Color(0xffe9f4f3),
                textColor: Color(0xff026c5d),
                child: Text("License"),
                onPressed:(){licenses(context);},
              ),
              SizedBox(height: 10,),
              Text(
                "Covid-19 is an open source app made with Flutter framework to provide the status of Covid-19 pandemic all over the world. It shows all the affected, recovered and dead count for each country in a form of graph. As it is an open source app feel free to contibute in GitHub.",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff057163)
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: gitHub,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/github.png',height: 25,),
                      SizedBox(width: 10,),
                      Text("Fork the project on GitHub",style: TextStyle(fontSize: 20),),
                      SizedBox(width: 5,),
                      Icon(Icons.link)
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Made with "),
                  Icon(Icons.favorite,color: Colors.red,size: 16,),
                  Text(" by "),
                  Text("Akash Debnath",style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}