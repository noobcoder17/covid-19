import 'package:flutter/material.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  final List<CustomBottomNavigationBarItem> items;
  final IconData popUpMenuIcon;
  final bool isPopUpEnable;
  final int currentIndex;
  final void Function(int i) onTap;
  CustomBottomNavigationBar({
    this.currentIndex=0,
    this.items,
    this.isPopUpEnable,
    this.popUpMenuIcon,
    this.onTap
  });
  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  
  @override
  Widget build(BuildContext context) {
    List<CustomBottomNavigationBarItem> activatedList = [];
    for(int i=0;i<widget.items.length;i++){
      activatedList.add(
       CustomBottomNavigationBarItem(
          icon: widget.items[i].icon,
          isActive: i==widget.currentIndex?true : false,
          title: widget.items[i].title,
          onTap: (){
            widget.onTap(i);
          },
        )
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
        height: 85,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xffe9f4f3),
          borderRadius: BorderRadius.vertical(top: Radius.circular(35))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: activatedList
        )
      );
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  final bool isActive;
  final Icon icon;
  final String title;
  final void Function() onTap;

  CustomBottomNavigationBarItem({
    this.isActive=false, 
    @required this.icon, 
    @required this.title,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: isActive ? const EdgeInsets.symmetric(horizontal: 16,vertical: 11) : const EdgeInsets.all(0),
        decoration: isActive? BoxDecoration(
          color: Color(0xffcae9e5),
          borderRadius: BorderRadius.circular(10)
        ) : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon.icon,color: Color(0xff057163),size: isActive? 17:21,),
            isActive ? SizedBox(width: 4,) : SizedBox(width: 0,),
            isActive? Text(title,style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff057163),fontSize: 13),) : SizedBox(width: 0,)
          ],
        ),
      ),
    );
  }
}