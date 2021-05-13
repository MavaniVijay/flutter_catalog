import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_catalogs/const/color.dart';
import 'package:flutter_catalogs/const/constant.dart';
import 'package:flutter_catalogs/const/image.dart';
import 'package:flutter_catalogs/screen/homeScreen/home_screen.dart';
import 'package:flutter_catalogs/screen/onBoardScreen/on_borading_screen.dart';
import 'package:flutter_catalogs/service/responsive_service.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Responsive.isDesktop() ? HomeScreen() : BoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(splashImg),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(flutterImg), scale: 1.4),
                      color: Color(0xff14D2FF),
                      shape: BoxShape.circle),
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Text(
                kAppName,
                style: GoogleFonts.kronaOne(
                  color: ColorPalate.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
