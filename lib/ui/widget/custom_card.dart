import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizappv2/ui/pages/get_json.dart';
class Customcard extends StatelessWidget {
  String langname;
      String image;
  String desc;
  Customcard(this.langname,this.image,this.desc);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 22),
      child: GestureDetector(
        onTap: (){
       //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>););
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file
            // for a particular language
            builder: (context) => GetJson(langname),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12,),
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: ExactAssetImage(image),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(langname,style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 14,horizontal: 12),
                child: Text(desc,
                  maxLines: 5,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    height: 1.4,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),),
              ),
              SizedBox(height: 8,),
            ],
          ),
        ),
      ),
    );
  }
}
