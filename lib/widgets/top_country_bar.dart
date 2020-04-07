import 'package:flutter/material.dart';

//screen
import '../screens/view_all_screen.dart';

class TopCountryBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Top Country",style: TextStyle(color: Color(0xff026c5d),fontSize: 18,fontWeight: FontWeight.w500),),
          FlatButton(
            color: Colors.white,
            textColor: Color(0xff026c5d),
            splashColor: Color(0xffe9f4f3),
            child: Text("View All"),
            onPressed: (){
              Navigator.of(context).pushNamed(ViewAll.routeName);
            },
          )
        ],
      ),
    );
  }
}