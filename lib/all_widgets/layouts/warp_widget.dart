import 'package:flutter/material.dart';

class WrapExample extends StatelessWidget {
  const WrapExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: [
        'Cauchy',
        'Fourrier',
        'Lagrange',
        'Lebesgue',
        'Levy',
        'Poisson',
        'Pointcare',
      ]
          .map((String name) => Chip(
                avatar: CircleAvatar(child: Text(name.substring(0, 1))),
                label: Text(name),
              ))
          .toList(),
    );
  }
}
