import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'const/constant.dart';
import 'screen/splashScreen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Hello.....World");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      home: SplashScreen(),
    );
  }
}
