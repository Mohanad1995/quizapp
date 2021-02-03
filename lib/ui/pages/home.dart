import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizappv2/data/data_home_page.dart';
import 'package:quizappv2/ui/widget/custom_card.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(right: 18),
        child: Center(child: Text('Quizstar',style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
        ),)),
      ),
      ),
      body: ListView(
        children: [
          Customcard(data_hom[0].langName,data_hom[0].imgPath,data_hom[0].desription),
          Customcard(data_hom[1].langName,data_hom[1].imgPath,data_hom[1].desription),
          Customcard(data_hom[2].langName,data_hom[2].imgPath,data_hom[2].desription),
          Customcard(data_hom[3].langName,data_hom[3].imgPath,data_hom[3].desription),
          Customcard(data_hom[4].langName,data_hom[4].imgPath,data_hom[4].desription),
        ],
      ),
    );
  }
}
