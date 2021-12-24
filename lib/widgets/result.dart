import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class Result extends StatefulWidget {
  // double correctPercent;
  // int _levelIdx;
  List totalPercent;

  Result(this.totalPercent);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    super.initState();
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerBottomCenter.play();
  }

  @override
  void dispose() {
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        buildConfettiWidget(
            _controllerBottomCenter, -pi / 2, Alignment.bottomCenter),
        buildConfettiWidget(
            _controllerBottomCenter, -pi / 3, Alignment.bottomLeft),
        buildConfettiWidget(
            _controllerBottomCenter, -(2 * pi) / 3, Alignment.bottomRight),
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    "Congratulations",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              // flex: 1,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.pop(context, widget.totalPercent);
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }

  Align buildConfettiWidget(controller, double blastDirection, alignment) {
    return Align(
      alignment: alignment,
      child: ConfettiWidget(
        confettiController: controller,
        blastDirection: blastDirection,
        emissionFrequency: 0.01,
        numberOfParticles: 50,
        maxBlastForce: 100,
        minBlastForce: 80,
        gravity: 0.2,
      ),
    );
  }
}
