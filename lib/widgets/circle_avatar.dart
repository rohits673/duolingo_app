// import 'package:duolingo_app/home/screen/quiz_screen.dart';
// import 'package:flutter/material.dart';

// class CircleAvatarIndicator extends StatefulWidget {
//   // final Color _backgroundColor;
//   final String _img;
//   final int _categoryIdx;
//   final int levelIdx;

//   CircleAvatarIndicator(this._categoryIdx,this.levelIdx, this._img);

//   @override
//   State<CircleAvatarIndicator> createState() => _CircleAvatarIndicatorState();
// }

// class _CircleAvatarIndicatorState extends State<CircleAvatarIndicator> {
//   List indicatorValue = [0.0];
  
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Center(
//           child: Container(
//             width: 115,
//             height: 115,
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.black12,
//               strokeWidth: 8,
//               value: indicatorValue[indicatorValue.length - 1],
//               color: Colors.amber,
//             ),
//           ),
//         ),
//         Center(
//           child: Ink(
//             decoration: BoxDecoration(
//               color: Colors.lightBlue,
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: InkWell(
//               borderRadius: BorderRadius.circular(50),
//               onTap: () {
//                 _navigateToQuiz(context);
//               },
//               child: CircleAvatar(
//                 backgroundColor: Colors.transparent,
//                 radius: 48,
//                 child: Image.asset(
//                   widget._img,
//                   height: 50,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _navigateToQuiz(BuildContext context) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => MyQuiz(widget._categoryIdx,widget.levelIdx)),
//     );
//     setState(() {
//       indicatorValue = result;
//     });
//   }
// }
