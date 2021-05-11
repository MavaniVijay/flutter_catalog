import 'package:flutter/material.dart';

class CardInkResponseWidget extends StatelessWidget {
  const CardInkResponseWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        Card(
          color: Colors.red,
          elevation: 10.0,
          child: SizedBox(
            height: 100.0,
            child: Row(
              children: const <Widget>[
                Expanded(child: Text('Card 1')),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.green,
          margin: const EdgeInsets.all(20.0),
          elevation: 0.0,
          child: SizedBox(
            height: 100.0,
            child: InkWell(
              splashColor: Colors.deepOrange,
              onTap: () {},
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text('Card 2 (with Inkwell effect on tap)'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          color: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.elliptical(60.0, 40.0),
            ),
          ),
          child: SizedBox(
            height: 100.0,
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: Text('Card 3 (with custom border radius)'),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 180.0,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/pngimg/card.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Card 4 (complex example)',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Text('SHARE'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('EXPLORE'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
