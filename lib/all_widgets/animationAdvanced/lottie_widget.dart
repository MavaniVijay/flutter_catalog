import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieExample extends StatelessWidget {
  const LottieExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Lottie.asset(
          "assets/images/lottieimg/899-like.json",
          height: 100,
        ),
        const Divider(),
        Lottie.network(
          'https://assets7.lottiefiles.com/datafiles/40aX5db74VvGPWw/data.json',
          height: 100,
        ),
        const Divider(),
        _LottieCustom(),
      ],
    );
  }
}

class _LottieCustom extends StatefulWidget {
  @override
  __LottieCustomState createState() => __LottieCustomState();
}

class __LottieCustomState extends State<_LottieCustom>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this)
      ..value = 0.5
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Lottie.asset(
          "assets/images/lottieimg/36093-world-tour.json",
          controller: _controller,
          height: 200,
          onLoaded: (composition) {
            setState(() {
              _controller.duration = composition.duration;
            });
          },
        ),
        Text(_controller.value.toStringAsFixed(2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_left),
              onPressed: () {
                _controller.reverse(from: _controller.value);
              },
            ),
            // Pause
            IconButton(
              icon: const Icon(Icons.pause),
              onPressed: () {
                setState(() {
                  _controller.stop();
                });
              },
            ),
            // Play forward
            IconButton(
              icon: const Icon(Icons.arrow_right),
              onPressed: () {
                _controller.forward(
                    from: _controller.value == 1 ? 0 : _controller.value);
              },
            ),
          ],
        ),
      ],
    );
  }
}
