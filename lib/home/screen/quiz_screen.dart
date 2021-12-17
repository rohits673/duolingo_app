import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../widgets/quiz.dart';
import '../../widgets/result.dart';
import '../../utils/questions_list.dart';
import 'dart:math';

class MyQuiz extends StatefulWidget {
  int categoryIdx;
  int levelIdx;

  MyQuiz(this.categoryIdx, this.levelIdx);

  @override
  State<MyQuiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  var _questionIdx = 0;
  // var _levelIdx = 0;
  var _totalScore = 0;
  var _correctPercent = 0.0;
  List totalPercent = [];
  int? _selectedOptionIdx;
  bool _isOptionSelected = false;
  late List _questions;
  List questionList = [];
  List questionSet = [];
  int? qListLength;
  var _isCorrect = false;
  List imageList = [];
  List RandQuestionList = [];

  final FlutterTts tts = FlutterTts();
  final TextEditingController controller =
      TextEditingController(text: 'Hello world');

  Home() {
    tts.setLanguage('en');
    tts.setSpeechRate(0.4);
  }

  void _nextQuestion() {
    if (_isCorrect == true) {
      setState(() {
        _totalScore += 1;
        _correctPercent = _totalScore / qListLength!;
      });
    } else {
      RandQuestionList.add(RandQuestionList[_questionIdx]);
    }
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _isCorrect
                    ? const Text(
                        'Correct',
                        style:
                            TextStyle(fontSize: 30, color: Colors.lightGreen),
                      )
                    : const Text(
                        "Wrong",
                        style: TextStyle(fontSize: 30, color: Colors.red),
                      ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      if (_questionIdx < RandQuestionList.length - 1) {
                        _questionIdx += 1;
                        _selectedOptionIdx = null;
                        _isOptionSelected = false;
                      } else {
                        widget.levelIdx += 1;
                        _selectedOptionIdx = null;
                        _isOptionSelected = false;
                        _questionIdx = 0;
                        _totalScore = 0;
                        totalPercent.add(_correctPercent);
                        _correctPercent = 0;
                        loadQuiz();
                      }
                    });
                    if (_questionIdx < RandQuestionList.length) {
                      shuffleImageList();
                    }
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void shuffleImageList() {
    Set randomQImg = {RandQuestionList[_questionIdx]["i"]};
    while (randomQImg.length < 4) {
      randomQImg.add(
          RandQuestionList[Random().nextInt(RandQuestionList.length)]["i"]);
    }
    imageList = [...randomQImg];
    imageList.shuffle();
  }

  void shuffleQuestionList() {
    Set randomQues = {};
    while (randomQues.length < questionList.length) {
      randomQues.add(questionList[Random().nextInt(questionList.length)]);
    }
    RandQuestionList = [...randomQues];
  }

  void loadQuiz() {
    questionList = (_questions[widget.categoryIdx] as dynamic)["set"]
        [widget.levelIdx]["items"];
    shuffleQuestionList();
    shuffleImageList();
  }

  @override
  void initState() {
    _questions = QuestionList.getQuestionList();
    questionSet = _questions[widget.categoryIdx]["set"];
    print(questionSet.length);
    print(widget.levelIdx);
    loadQuiz();
    super.initState();
    qListLength = RandQuestionList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: new IconButton(
            icon: new Icon(
              Icons.close,
              color: Colors.blueGrey,
            ),
            onPressed: () {
              print(questionSet.length);

              totalPercent.add(_correctPercent);
              Navigator.pop(context, totalPercent);
            }),
        title: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
              backgroundColor: Colors.blueGrey,
              minHeight: 15,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.lightGreen),
              value: _questionIdx / RandQuestionList.length),
        ),
      ),
      body: widget.levelIdx < questionSet.length
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          tts.speak(RandQuestionList[_questionIdx]["q"]);
                        },
                        icon: Icon(Icons.surround_sound),
                      ),
                      Quiz(
                        questions: RandQuestionList[_questionIdx]["q"],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    padding: const EdgeInsets.all(8),
                    children: List.generate(4, (index) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: InkWell(
                          child: GridTile(
                            child: imageList[index][0] == ""
                                ? Center(
                                    child: Text(
                                    imageList[index][1],
                                    style: TextStyle(fontSize: 25),
                                  ))
                                : Ink.image(
                                    colorFilter: _selectedOptionIdx == index
                                        ? ColorFilter.mode(
                                            Colors.white.withOpacity(0.8),
                                            BlendMode.dstATop,
                                          )
                                        : null,
                                    image: AssetImage(imageList[index][0]),
                                    fit: BoxFit.contain,
                                    alignment: Alignment.topCenter,
                                  ),
                          ),
                          onTap: () {
                            setState(
                              () {
                                _selectedOptionIdx = index;
                                _isOptionSelected = true;
                                tts.speak(imageList[index][1]);
                                if (imageList[_selectedOptionIdx!] ==
                                    RandQuestionList[_questionIdx]["i"]) {
                                  _isCorrect = true;
                                } else {
                                  _isCorrect = false;
                                }
                              },
                            );
                          },
                        ),
                        color: _selectedOptionIdx == index
                            ? Colors.lightBlue
                            : Colors.white70,
                      );
                    }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen,
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: _isOptionSelected ? _nextQuestion : null,
                        child: Text(
                          "Check",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          : Result(),
    );
  }
}
