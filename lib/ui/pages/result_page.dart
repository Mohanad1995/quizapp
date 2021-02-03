import 'package:flutter/material.dart';
import 'package:quizappv2/ui/pages/home.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Result_Page extends StatefulWidget {
  int marks ;
  Result_Page(this.marks);
  @override
  _Result_PageState createState() => _Result_PageState();
}

class _Result_PageState extends State<Result_Page> {

  List<String> images = [
    "assets/images/success.png",
    "assets/images/good.png",
    "assets/images/bad.png",
  ];

  String message;
  String image;

  @override
  void initState(){
    if(widget.marks < 20){
      image = images[2];
      message = "You Should Try Hard..\n" + "You Scored ${widget.marks}";
    }else if(widget.marks < 35){
      image = images[1];
      message = "You Can Do Better..\n" + "You Scored ${widget.marks}";
    }else{
      image = images[0];
      message = "You Did Very Well..\n" + "You Scored ${widget.marks}";
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.cover),
          Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Container(
                      width: 300.0,
                      height: 300.0,
                      child: ClipRect(
                        child: Image(
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 15.0,
                        ),
                        child: Center(
                          child: Text(
                            message,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Quando",
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlineButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Home_Screen(),
                        ));
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      borderSide: BorderSide(width: 3.0, color: Colors.indigo),
                      splashColor: Colors.indigoAccent,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}