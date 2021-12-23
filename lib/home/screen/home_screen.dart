import '../../widgets/circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:duolingo_app/home/screen/quiz_screen.dart';

import '../../utils/questions_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List _questions;
  var categoryLength = 0;

  @override
  void initState() {
    _questions = QuestionList.getQuestionList();
    categoryLength = _questions.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: categoryLength,
        itemBuilder: (context, index) => CircleAvatarIndicator(
          index,
          _questions[index]["image"],
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}

class CircleAvatarIndicator extends StatefulWidget {
  final String _img;
  final int _categoryIdx;

  CircleAvatarIndicator(this._categoryIdx, this._img);

  @override
  State<CircleAvatarIndicator> createState() => _CircleAvatarIndicatorState();
}

class _CircleAvatarIndicatorState extends State<CircleAvatarIndicator> {
  late List _questions;
  List indicatorValue = [0.0];
  int levelIdx = 0;

  Widget _textCirle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      );
  @override
  void initState() {
    _questions = QuestionList.getQuestionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            width: 115,
            height: 115,
            child: CircularProgressIndicator(
              backgroundColor: Colors.black12,
              strokeWidth: 8,
              value: indicatorValue[indicatorValue.length - 1],
              color: Colors.amber,
            ),
          ),
        ),
        Center(
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                _navigateToQuiz(context);
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 48,
                child: Image.asset(
                  widget._img,
                  height: 50,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _textCirle(_questions[widget._categoryIdx]["category"]),
        )
      ],
    );
  }

  void _navigateToQuiz(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyQuiz(widget._categoryIdx, levelIdx)),
    );
    setState(() {
      indicatorValue = result;
    });
    levelIdx = indicatorValue.length - 1;

    print(indicatorValue);
    print(levelIdx);
  }
}
