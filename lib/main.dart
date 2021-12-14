import './home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

ThemeData _darkTheme = ThemeData(
  accentColor: Colors.red,
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
);

ThemeData _lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue);

bool _light = true;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Duolingo',
        theme: _light ? _lightTheme : _darkTheme,
        home: Scaffold(
          body: Home(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _light = !_light;
              });
            },
            backgroundColor: _light ? Colors.black54 : Colors.white54,
            child: _light
                ? Icon(Icons.dark_mode)
                : Icon(
                    Icons.light_mode,
                    color: Colors.black,
                  ),
          ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ));
  }
}
