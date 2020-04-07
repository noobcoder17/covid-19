import 'package:flutter/material.dart';

//widgets
import 'rotating_virus.dart';

class GraphLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 275,
      child: Center(
        child: RotationVirus(),
      ),
    );
  }
}