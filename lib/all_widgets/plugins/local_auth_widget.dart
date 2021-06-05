import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:transparent_image/transparent_image.dart'
    show kTransparentImage;

class LocalAuthExample extends StatefulWidget {
  const LocalAuthExample({Key key}) : super(key: key);

  @override
  _LocalAuthExampleState createState() => _LocalAuthExampleState();
}

class _LocalAuthExampleState extends State<LocalAuthExample> {
  bool _authSuccess = false;
  LocalAuthentication _localAuth;

  @override
  void initState() {
    super.initState();
    this._localAuth = LocalAuthentication();
  }

  Future<bool> _auth() async {
    setState(() => this._authSuccess = false);
    if (await this._localAuth.canCheckBiometrics == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your device is NOT capable of checking biometrics.\n'
              'This demo will not work on your device!\n'
              'You must have android 6.0+ and have fingerprint sensor.'),
        ),
      );
      return false;
    }
    try {
      final authSuccess = await this._localAuth.authenticateWithBiometrics(
          localizedReason: 'Auth in to see hidden image');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('authSuccess=$authSuccess')),
      );
      return authSuccess;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextButton.icon(
          icon: const Icon(Icons.fingerprint),
          label: const Text('Auth in to view hidden image'),
          onPressed: () async {
            final authSuccess = await this._auth();
            setState(() => this._authSuccess = authSuccess);
          },
        ),
        if (this._authSuccess)
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: const AssetImage('assets/images/pngimg/figerimg.png'),
          )
        else
          const Placeholder(),
      ],
    );
  }
}
