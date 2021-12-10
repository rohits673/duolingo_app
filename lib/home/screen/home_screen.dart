import '../../widgets/circle_avatar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Text _textCirle(String text) => Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const SizedBox(height: 38),
          Column(
            children: <Widget>[
              const CircleAvatarIndicator(
                  Colors.amber, "assets/images/home_screen/lesson_egg.png"),
              const SizedBox(height: 10),
              _textCirle("Basics 1"),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const CircleAvatarIndicator(Color(0xFF55acf3),
                          "assets/images/home_screen/lesson_dialog.png"),
                      const SizedBox(height: 10),
                      _textCirle("Phrases"),
                    ],
                  ),
                  const SizedBox(width: 33),
                  Column(
                    children: <Widget>[
                      const CircleAvatarIndicator(Color(0xFF55acf3),
                          "assets/images/home_screen/lesson_airplane.png"),
                      const SizedBox(height: 10),
                      _textCirle("Travel"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const CircleAvatarIndicator(Color(0xFF55acf3),
                          "assets/images/home_screen/lesson_hamburger.png"),
                      const SizedBox(height: 10),
                      _textCirle("Food"),
                    ],
                  ),
                  const SizedBox(width: 33),
                  Column(
                    children: <Widget>[
                      const CircleAvatarIndicator(Color(0xFF55acf3),
                          "assets/images/home_screen/lesson_baby.png"),
                      const SizedBox(height: 10),
                      _textCirle("Family"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
