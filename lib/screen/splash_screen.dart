import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_catalogs/constant/color_platee.dart';
import 'package:flutter_catalogs/constant/image_path.dart';
import 'package:flutter_catalogs/screen/on_borading_screen.dart';
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
          context, MaterialPageRoute(builder: (context) => BoardingScreen()));
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
                "Flutter Catalog",
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
