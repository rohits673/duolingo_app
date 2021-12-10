import 'package:flutter/material.dart';

class AppBarHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Image.asset("assets/images/appBar/flag.png"),
            onPressed: () {},
          ),
          AppbarItem("assets/images/appBar/crown_stroke.png", 67, Colors.amber),
          AppbarItem(
              "assets/images/appBar/navbar_fire_active.png", 1, Colors.orange),
          AppbarItem("assets/images/appBar/navbar_diamont.png", 50, Colors.red),
        ],
      ),
    );
  }
}

Widget AppbarItem(String icon, int score, Color color) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        icon: Image.asset(
          icon,
          height: 29,
        ),
        onPressed: () {},
      ),
      Text(
        "$score",
        style:
            TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 17),
      ),
    ],
  );
}
