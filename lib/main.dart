import 'package:flutter/material.dart';
import 'package:flutter_catalogs/screen/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter_Catalog_2.0',
      home: SplashScreen(),
    );
  }
}
