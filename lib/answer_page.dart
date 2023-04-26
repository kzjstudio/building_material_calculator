import 'package:flutter/material.dart';

class AnswerPage extends StatelessWidget {
  final double wallWidth;
  final double wallheight;
  final double materialLegth;
  final double materialWidth;
  const AnswerPage(
      {super.key,
      required this.wallWidth,
      required this.wallheight,
      required this.materialLegth,
      required this.materialWidth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Here is your material list')),
      body: SingleChildScrollView(
          child: Column(
        children: [Text('Here is your material list')],
      )),
    );
  }
}
