import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final String details;
  final String imagePath;
  final void Function() onTap;
  final bool isSelected;

  const DetailCard({this.title, this.details, this.imagePath, this.onTap,this.isSelected});
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: isSelected ? 3 : 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: 150,
          height: 150*(3/2),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          decoration: BoxDecoration(
            color: isSelected? 
            //Color(0xffffc960) : 
            Color(0xffe9f4f3):
            Colors.white,  
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xffe9f4f3),width: 1),
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(title,style: TextStyle(fontSize: 20,fontWeight:  FontWeight.bold,color: isSelected ?Color(0xff057163):Colors.black),),
                  SizedBox(height: 5,),
                  Text(details,style: TextStyle(color: isSelected ?Color(0xff057163):Colors.black),),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(imagePath,height: 80,))
            ],
          ),
        ),
      ),
    );
  }
}