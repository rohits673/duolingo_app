import 'package:flutter/material.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          leading: Text('$index'),
          title: Text("Stories"),
        );
      }),
    );
  }
}
