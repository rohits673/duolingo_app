import 'dart:math';
import 'package:duolingo_app/home/screen/quiz_screen.dart';
import 'package:flutter/material.dart';

class CircleAvatarIndicator extends StatelessWidget {
  final Color _backgroundColor;
  final String _img;

  const CircleAvatarIndicator(this._backgroundColor, this._img);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  width: 115,
                  height: 115,
                  child: CircularProgressIndicator(
                    strokeWidth: 8,
                    value: Random().nextDouble(),
                    color: Colors.amber,
                  ),
                ),
              ),
              Center(
                child: Ink(
                  decoration: BoxDecoration(
                      color: _backgroundColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyQuiz()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 48,
                      child: Image.asset(
                        _img,
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
