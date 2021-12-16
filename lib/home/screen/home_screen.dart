import '../../widgets/circle_avatar.dart';
import 'package:flutter/material.dart';
import '../../utils/questions_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List _questions;
  var categoryLength = 0;

  Text _textCirle(String text) => Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      );

  @override
  void initState() {
    _questions = QuestionList.getQuestionList();
    categoryLength = _questions.length;
    print(categoryLength);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
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
