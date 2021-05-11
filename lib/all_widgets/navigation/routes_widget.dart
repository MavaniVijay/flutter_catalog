import 'package:flutter/material.dart';

class RoutesExample extends StatelessWidget {
  const RoutesExample({Key key}) : super(key: key);
  static const kRouteName = '/RoutesExample';

  @override
  Widget build(BuildContext context) {
    debugPrint('RouteName=${ModalRoute.of(context).settings.name}');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Page 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context, _PageTwo());
          },
          child: const Text('Go to page two'),
        ),
      ),
    );
  }
}

class _PageTwo extends MaterialPageRoute<void> {
  _PageTwo()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Page 2'),
              elevation: 1.0,
            ),
            body: Builder(
              builder: (BuildContext context) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push<String>(context, _PageThree())
                        .then((returnVal) {
                      if (returnVal != null) {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('You clicked: $returnVal'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {},
                            ),
                          ),
                        );
                      }
                    });
                  },
                  child: const Text('Go to page 3'),
                ),
              ),
            ),
          );
        });
}

class _PageThree extends MaterialPageRoute<String> {
  _PageThree()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Last page'),
              elevation: 2.0,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const CircleAvatar(child: Text('1')),
                    title: const Text('user1@example.com'),
                    onTap: () => Navigator.pop(context, 'user1@example.com'),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Text('2')),
                    title: const Text('user2@example.com'),
                    onTap: () => Navigator.pop(context, 'user2@example.com'),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Text('3')),
                    title: const Text('user3@example.com'),
                    onTap: () => Navigator.pop(context, 'user3@example.com'),
                  ),
                  const Divider(),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Go home'),
                  ),
                ],
              ),
            ),
          );
        });
}
