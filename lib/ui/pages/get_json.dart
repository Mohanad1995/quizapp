import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizappv2/ui/pages/quiz_page.dart';
class GetJson extends StatelessWidget {
  String langName;
  String assettoload;
  GetJson(this.langName);
  setasset() {
    if (langName == "Python") {
      assettoload = "assets/json/python.json";
    } else if (langName == "Java") {
      assettoload = "assets/json/java.json";
    } else if (langName == "Javascript") {
      assettoload = "assets/json/js.json";
    } else if (langName == "C++") {
      assettoload = "assets/json/cpp.json";
    } else {
      assettoload = "assets/json/linux.json";
    }
  }
  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
        builder: (context,SnapShot){
        List mydata= json.decode(SnapShot.data.toString());
        if(mydata == null){
          return Scaffold(
            body: Center(child: Text('Loading')),
          );
        }
        return QuizPage(mydata : mydata);
        }
        );
  }
}
