// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quiz_app/controllers/question_controller.dart';
// import 'package:quiz_app/models/Questions.dart';
//
// import '../../../constants.dart';
// import 'option.dart';
//
// class QuestionCard extends StatelessWidget {
//   const QuestionCard({
//     Key key,
//     // it means we have to pass this
//     @required this.question,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Container(
//       margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//       padding: EdgeInsets.all(kDefaultPadding),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Column(
//         children: [
//           Text(
//             question.question,
//             style: Theme.of(context)
//                 .textTheme
//                 .headline6
//                 .copyWith(color: kBlackColor),
//           ),
//           SizedBox(height: kDefaultPadding / 2),
//           ...List.generate(
//             question.options.length,
//                 (index) => Option(
//               index: index,
//               text: question.options[index],
//               press: () => _controller.checkAns(question, index),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

















// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'components/body.dart';
//
// class QuizScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         // Fluttter show the back button automatically
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
//         ],
//       ),
//       body: Body(),
//     );
//   }
// }
