import 'package:flutter/material.dart';
import 'custom_bottom_navigation_bar.dart';

class NavigationBar extends StatelessWidget {
  final int index;
  final void Function(int i) onTap;
  NavigationBar({
    @required this.index,
    this.onTap
  });
  @override
  Widget build(BuildContext context) {
    return CustomBottomNavigationBar(
      onTap: onTap,
      currentIndex: index,
      items: <CustomBottomNavigationBarItem>[
        CustomBottomNavigationBarItem(
          icon: Icon(Icons.outlined_flag),
          title: "Home",
        ),
        // CustomBottomNavigationBarItem(
        //   icon: Icon(Icons.library_books),
        //   title: "Details",
        // ),
        // CustomBottomNavigationBarItem(
        //   icon: Icon(Icons.attach_money),
        //   title: "Details",
        // ),
        CustomBottomNavigationBarItem(
          icon: Icon(Icons.info),
          title: "Info",
        ),
      ],
    );
  }
}