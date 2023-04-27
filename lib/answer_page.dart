import 'package:flutter/material.dart';

class AnswerPage extends StatelessWidget {
  final double wallWidth;
  final double wallheight;
  final double materialLegth;
  final double materialWidth;
  AnswerPage(
      {super.key,
      required this.wallWidth,
      required this.wallheight,
      required this.materialLegth,
      required this.materialWidth});

  late double wallinSquareft;
  late double materialSquareft;

  double calculateMaterial() {
    wallinSquareft = wallWidth * wallheight;
    materialSquareft = materialLegth * materialWidth;

    final answer = wallinSquareft / materialSquareft;

    return answer;
  }

  @override
  Widget build(BuildContext context) {
    print(calculateMaterial());
    return Scaffold(
      appBar: AppBar(title: Text('Here is your material list')),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              'Here is your material list',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('The wall area is $wallinSquareft')
          ],
        ),
      )),
    );
  }
}
