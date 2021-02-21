import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizappv2/ui/pages/start_page.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Splach_Screen extends StatefulWidget {
  @override
  _Splach_ScreenState createState() => _Splach_ScreenState();
}

class _Splach_ScreenState extends State<Splach_Screen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 10)).then((value){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return StartScreen();
          }));
    });
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg",
              width: double.infinity,
              height: double.infinity,
              fit:BoxFit.cover),
          SafeArea(
            child:Center(
              child: Text('Quizstar',style: TextStyle(
                  fontSize: 50,
                  color: Colors.white
              ),),
            ),
          ),
        ],
      ),

    );
  }
}
