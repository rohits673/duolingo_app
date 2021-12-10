import 'package:flutter/material.dart';
import "../../models/quiz.dart";
import "../../models/result.dart";

class MyQuiz extends StatefulWidget {
  @override
  State<MyQuiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  final _questions = [
    {
      "category": "Basic-1",
      "set": [
        {
          "level": "1",
          "items": [
            {
              "q":
                  "Who is king of jungle? Is there is any picture for the same?",
              "i": "assets/images/questions/icons8-lion.png",
              "a": "lion"
            },
            {
              "q": "Who is fastest animal?",
              "i": "assets/images/questions/icons8-tiger.png",
              "a": "tiger"
            },
            {
              "q": "Who can fly?",
              "i": "assets/images/questions/icons8-ostrich.png",
              "a": "Ostrich"
            },
            {
              "q": "Who is biggest?",
              "i": "assets/images/questions/icons8-elephant.png",
              "a": "Elephant"
            },
            {
              "q": "Who is smallest?",
              "i": "assets/images/questions/icons8-ant.png",
              "a": "Ant"
            }
          ]
        },
        {
          "level": "2",
          "items": [
            {
              "q": "Who is king of jungle",
              "i": "assets/images/questions/icons8-lion.png",
              "a": "lion"
            },
            {
              "q": "Who is fastes animal",
              "i": "assets/images/questions/icons8-lion.png",
              "a": "tiger"
            },
            {
              "q": "Who can fly",
              "i": "assets/images/questions/icons8-lion.png",
              "a": "Ostrich"
            },
            {
              "q": "Who is biggest",
              "i": "assets/images/questions/icons8-lion.png",
              "a": "Elephant"
            },
            {
              "q": "Who is smallest",
              "i": "assets/images/questions/icons8-lion.png",
              "a": "Ant"
            }
          ]
        }
      ]
    }
  ];
  var _categoryIdx = 0;
  var _setIdx = 0;
  var _questionIdx = 0;
  var _totalScore = 0;

  void _restartQuiz() {
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
    });
  }

  void _ansQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIdx += 1;
    });
  }

  void _nextQuestion() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Correct',
                  style: TextStyle(fontSize: 30, color: Colors.lightGreen),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () => Navigator.pop(context),
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
    setState(() {
      _questionIdx += 1;
      _selectedOptionIdx = null;
      _isOptionSelected = false;
    });
  }

  int? _selectedOptionIdx;
  bool _isOptionSelected = false;

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
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
              backgroundColor: Colors.black12,
              minHeight: 15,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.lightGreen),
              value: _questionIdx /
                  (_questions[0] as dynamic)["set"][0]["items"].length),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: _questionIdx <
                    (_questions[0] as dynamic)["set"][0]["items"].length
                ? Quiz(
                    ansQuestion: _ansQuestion,
                    questions: _questions,
                    questionIdx: _questionIdx)
                : Result(),
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
                      child: Ink.image(
                        colorFilter: _selectedOptionIdx == index
                            ? ColorFilter.mode(
                                Colors.white.withOpacity(0.8),
                                BlendMode.dstATop,
                              )
                            : null,
                        image: AssetImage((_questions[0] as dynamic)["set"][0]
                            ["items"][index]["i"]),
                        fit: BoxFit.contain,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    onTap: () {
                      setState(
                        () {
                          _selectedOptionIdx = index;
                          _isOptionSelected = true;
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 100),
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
      ),
    );
  }
}
