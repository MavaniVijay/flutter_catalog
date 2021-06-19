import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogs/all_widgets/stateManagement/get_x_widget.dart';
import 'package:flutter_catalogs/screen/splashScreen/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'const/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Pending.... Favourite Screen");
    return GetMaterialApp(
      // initialRoute: '/home',
      defaultTransition: Transition.native,
      translations: MyTranslations(),
      locale: Locale('pt', 'BR'),
      getPages: [
        //Simple GetPage
        GetPage(name: '/home', page: () => GetxExample()),
        // GetPage with custom transitions and bindings
        GetPage(
          name: '/second',
          page: () => Second(),
          customTransition: SizeTransitions(),
          binding: SampleBind(),
        ),
        // GetPage with default transitions
        GetPage(
          name: '/third',
          transition: Transition.cupertino,
          page: () => Third(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: kAppName,
      home: SplashScreen(),
    );
  }
}
