import 'package:flutter/material.dart';

class DialSelectButtonBar extends StatelessWidget {
  final List<String> titles = ["Active","Dead","Recovered"];
  final int selectedButtonIndex;
  final void Function(int i) onTap;
  DialSelectButtonBar({
    @required this.selectedButtonIndex,
    @required this.onTap
  });
  @override
  Widget build(BuildContext context) {
    List<DialSelectButton> buttonList = [];
    for(int i=0;i<3;i++){
      buttonList.add(
        DialSelectButton(
          isSelected: selectedButtonIndex==i ? true :false, 
          title: titles[i],
          onTap: (){
            onTap(i);
          },
        )
      );
    }
    return Container(
      padding: EdgeInsets.fromLTRB(45, 20, 45, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buttonList
      ),
    );
  }
}

class DialSelectButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final void Function() onTap;
  DialSelectButton({
    @required this.isSelected,
    @required this.title,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12) ,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffe9f4f3): Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected? Color(0xff026c5d):Color(0xff88bdb3),
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}