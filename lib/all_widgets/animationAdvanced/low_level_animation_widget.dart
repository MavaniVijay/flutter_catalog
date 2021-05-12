import 'package:flutter/material.dart';

class LowLevelAnimationExample extends StatefulWidget {
  const LowLevelAnimationExample({Key key}) : super(key: key);

  @override
  _LowLevelAnimationExampleState createState() =>
      _LowLevelAnimationExampleState();
}

class _LowLevelAnimationExampleState extends State<LowLevelAnimationExample>
    with SingleTickerProviderStateMixin {
  Animation<double> _sizeAnimation;
  Animation<Color> _colorAnimation;
  AnimationController _controller;
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    this._controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    this._curve =
        CurvedAnimation(parent: this._controller, curve: Curves.easeIn);
    this._sizeAnimation =
        Tween<double>(begin: 50, end: 100).animate(this._curve);
    this._colorAnimation =
        ColorTween(begin: Colors.transparent, end: Colors.red)
            .animate(this._curve);
    this._controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8.0),
          color: this._colorAnimation.value,
          height: this._sizeAnimation.value,
          width: this._sizeAnimation.value,
          child: const FlutterLogo(),
        ),
        ElevatedButton(
          onPressed:
              this._controller.isCompleted ? null : () => _controller.forward(),
          child: const Text('Forward animation'),
        ),
        ElevatedButton(
          onPressed:
              this._controller.isDismissed ? null : () => _controller.reverse(),
          child: const Text('Reverse animation'),
        ),
        ElevatedButton(
          onPressed: () {
            this._controller.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                this._controller.reverse();
              } else if (status == AnimationStatus.dismissed) {
                this._controller.forward();
              }
            });
            this._controller.forward();
          },
          child: const Text('Loop animation'),
        ),
      ],
    );
  }
}
