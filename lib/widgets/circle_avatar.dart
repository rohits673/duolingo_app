import 'package:duolingo_app/home/screen/quiz_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class CircleAvatarIndicator extends StatefulWidget {
  final Color _backgroundColor;
  final String _img;
  final int categoryIdx;

  CircleAvatarIndicator(this.categoryIdx, this._backgroundColor, this._img);

  @override
  State<CircleAvatarIndicator> createState() => _CircleAvatarIndicatorState();
}

class _CircleAvatarIndicatorState extends State<CircleAvatarIndicator> {
  double indicatorValue = 0.0;

  // addIndicatorValueToLocal() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     prefs.setDouble('localIndicatorValue', indicatorValue);
  //   });
  // }

  // getIndicatorValue() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     indicatorValue = prefs.getDouble('localIndicatorValue') ?? 0.0;
  //   });
  // }

  // @override
  // void initState() {
  //   // getIndicatorValue();
  //   super.initState();
  // }

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
                    value: indicatorValue,
                    color: Colors.amber,
                  ),
                ),
              ),
              Center(
                child: Ink(
                  decoration: BoxDecoration(
                      color: widget._backgroundColor,
                      borderRadius: BorderRadius.circular(50)),
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
            ],
          ),
        ),
      ],
    );
  }

  void _navigateToQuiz(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyQuiz(widget.categoryIdx)),
    );
    setState(() {
      if (indicatorValue < result) indicatorValue = result;
    });
    // addIndicatorValueToLocal();
  }
}
