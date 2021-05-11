import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageFilteredWidget extends StatefulWidget {
  const ImageFilteredWidget({Key key}) : super(key: key);

  @override
  _ImageFilteredWidgetState createState() => _ImageFilteredWidgetState();
}

class _ImageFilteredWidgetState extends State<ImageFilteredWidget> {
  double _sigmaX = 0, _sigmaY = 0;
  double _rotZ = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(4),
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.compose(
            outer: ImageFilter.matrix(Matrix4.rotationZ(_rotZ).storage),
            inner: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Image Filtered '),
              SizedBox(
                height: Get.height * 0.012,
              ),
              Image.asset("assets/images/pngimg/flutterlogo.png"),
            ],
          ),
        ),
        const Divider(),
        ..._controlWidgets(),
      ],
    );
  }

  List<Widget> _controlWidgets() {
    return [
      Row(
        children: [
          const Text('sigmaX:'),
          Expanded(
            child: Slider(
              max: 20,
              value: _sigmaX,
              onChanged: (val) {
                setState(() => this._sigmaX = val);
              },
            ),
          ),
          Text(_sigmaX.toStringAsFixed(1)),
        ],
      ),
      Row(
        children: [
          const Text('sigmaY:'),
          Expanded(
            child: Slider(
              max: 20,
              value: _sigmaY,
              onChanged: (val) {
                setState(() => this._sigmaY = val);
              },
            ),
          ),
          Text(_sigmaY.toStringAsFixed(1)),
        ],
      ),
      Row(
        children: [
          const Text('rotationZ:'),
          Expanded(
            child: Slider(
              min: -1.6,
              max: 1.6,
              value: _rotZ,
              onChanged: (val) {
                setState(() => this._rotZ = val);
              },
            ),
          ),
          Text(_rotZ.toStringAsFixed(1)),
        ],
      )
    ];
  }
}
