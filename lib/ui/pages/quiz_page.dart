import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizappv2/ui/pages/result_page.dart';
import 'package:quizappv2/utitles/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';
class QuizPage extends StatefulWidget {
  final List mydata;
 QuizPage({Key key, @required this.mydata}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState(mydata);
}
class _QuizPageState extends State<QuizPage> {
  final List mydata;
  int i =1;
  int j = 1;
  var icon=null;
  Color colortoshow = Colors.grey.shade200;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int timer=30;
  bool disableAnswer = false;
  String showtimer="30";
  bool canceltimer=false;
  Map<String, Color> btncolor = {
    "a": Colors.grey.shade200,
    "b": Colors.grey.shade200,
    "c": Colors.grey.shade200,
    "d": Colors.grey.shade200,
  };
  @override
  void initState() {
    startTimer();
   // genrandomarray();
    super.initState();
  }
  _QuizPageState(this.mydata);
  void startTimer() async{
  const onesec=Duration(seconds: 1);
  Timer.periodic(onesec, (Timer t) {
    setState(() {
      if(timer<1){
       t.cancel();
        nextquestion();
      }
      else if(canceltimer == true ){
        t.cancel();
      }
      else{
        timer=timer-1;
      }
      showtimer=timer.toString();
    });
  });
  }
  void nextquestion(){
    timer =30;
    canceltimer =false;
    icon =null;
  setState(() {
    if(i<10){
      i++;
    }
    else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Result_Page(marks)));
    }
    btncolor["a"] = Colors.grey.shade200;
    btncolor["b"] = Colors.grey.shade200;
    btncolor["c"] = Colors.grey.shade200;
    btncolor["d"] = Colors.grey.shade200;
    disableAnswer = false;

  });
    startTimer();
  }
  void checkanswer(String k){
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 5;
      colortoshow = right;
      icon=Icon(Icons.check,color: Colors.white,);
    } else {
      colortoshow = wrong;
      icon=Icon(Icons.close,color: Colors.white,);
    }
    setState(() {
      // applying the changed color to the particular button that was selected
      btncolor[k] = colortoshow;
      canceltimer = true;
       disableAnswer = true;
    });
    Future.delayed(Duration(seconds: 2),nextquestion);
    //;
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return WillPopScope(
      onWillPop: (){
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
          title: Text(
            "Quizstar",
          ),
          content: Text("You Can't Go Back At This Stage."),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Ok',
              ),
            ),
          ],
        ),
        );
      },
      child: Scaffold(
        body:  Stack(
          children: [
            WebsafeSvg.asset("assets/icons/bg.svg",  width: double.infinity,
                height: double.infinity,
                fit:BoxFit.cover),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 36,),
                  SizedBox(height: kDefaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Text.rich(
                          TextSpan(
                            text:
                            "Question ${i}",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: kSecondaryColor),
                            children: [
                              TextSpan(
                                text: "/10",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(color: kSecondaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Row(
                          children: [
                            Icon(Icons.timer,color:Colors.white,),
                            SizedBox(width: 4,),
                            Text(':'),
                            SizedBox(width: 4,),
                            Text(showtimer,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),),
                          ],
                        ),
                      )

                    ],
                  ),
                  Divider(thickness: 1.5),
                  SizedBox(height: 40,),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 14),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child:AbsorbPointer(
                        absorbing: disableAnswer,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 25,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(mydata[0][i.toString()],style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87,
                                ),),
                              ),
                              SizedBox(height: 10,),
                              Raised('a'),
                              Raised('b'),
                              Raised('c'),
                              Raised('d'),

                          //    SizedBox(height: 22,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),

      ),
    );
  }
  Widget Raised(String title,){
    return   GestureDetector(
      onTap: (){
        checkanswer(title);
      },
      child: Container(
      margin: EdgeInsets.only(top: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
        decoration:BoxDecoration(
    border: Border.all(color:btncolor[title],),
    borderRadius: BorderRadius.circular(15),
      //color: Colors.grey.shade300,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(mydata[1][i.toString()][title],  style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1.1,
            ),),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                border: Border.all(color:btncolor[title],),
                borderRadius: BorderRadius.circular(50),
                color:btncolor[title],
              ),
            child: icon,
            )
          ],
        )

      ),
    );
  }
}
