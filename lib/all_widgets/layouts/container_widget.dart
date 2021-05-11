import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 5.0),
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20.0)),
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
            child: Container(
              color: Colors.red,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              transform: Matrix4.rotationZ(-0.1),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10.0),
                    right: Radius.circular(30.0),
                  ),
                ),
                alignment: Alignment.topLeft,
                child: const Text("hello"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
