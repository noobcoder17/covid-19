import 'package:flutter/material.dart';

//widgets
import '../widgets/rotating_virus.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>{
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: RotationVirus(),
      ),
    );
  }
}