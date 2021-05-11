import 'dart:math' show pi;

import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtStyle = TextStyle(
      color: Colors.white,
      fontSize: 25,
    );
    return Scaffold(
      body: ListView(
        children: [
          const Divider(),
          Container(
            height: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.1,
                    0.6,
                    0.9
                  ],
                  colors: [
                    Colors.yellow,
                    Colors.deepOrange,
                    Colors.pinkAccent
                  ]),
            ),
            child: Text('LinearGradient', style: txtStyle),
            alignment: Alignment.center,
          ),
          const Divider(),
          Container(
            height: 300,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                  radius: 0.7, colors: [Color(0xff00a152), Color(0xff33eb91)]),
            ),
            child: Text('RadialGradient', style: txtStyle),
            alignment: Alignment.center,
          ),
          const Divider(),
          Container(
            height: 300,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                startAngle: pi / 6,
                endAngle: pi * 1.8,
                colors: [Colors.blue, Colors.yellow, Colors.red],
              ),
            ),
            alignment: Alignment.center,
            child: Text('SweepGradient', style: txtStyle),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
