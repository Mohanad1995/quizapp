import 'package:flutter/material.dart';
import 'package:quizappv2/ui/pages/quiz_page.dart';
import 'package:quizappv2/ui/pages/result_page.dart';
import 'package:quizappv2/ui/pages/splach.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quize App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Splach_Screen(),
    );
  }
}
