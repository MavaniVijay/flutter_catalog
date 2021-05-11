import 'package:flutter/material.dart';
import 'package:flutter_catalogs/appConfig/sizeConfig.dart';
import 'package:flutter_catalogs/const/color.dart';
import 'package:flutter_catalogs/screen/homeScreen/home_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return FirstBoardingScreen();
  }
}

class FirstBoardingScreen extends StatelessWidget {
  const FirstBoardingScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.backGroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.10,
                ),
                Image.asset(
                  boyLogo,
                  height: SizeConfig.getProportionateScreenHeight(300),
                  width: SizeConfig.getProportionateScreenHeight(300),
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Text(
                  "Welcome to flutter\n    cataloging application",
                  style: GoogleFonts.kronaOne(
                    fontSize: 16,
                    color: ColorPalate.textColor,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.011,
                ),
                Text(
                  "Choosing the learning some \nwidgets at one place",
                  style: GoogleFonts.kronaOne(
                    fontSize: 12,
                    color: ColorPalate.subTextColor,
                  ),
                ),
                Spacer(),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorPalate.textColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    minWidth: Get.width,
                    onPressed: () {
                      Get.to(SecondBoardingScreen());
                    },
                    elevation: 5,
                    child: Text(
                      "Next",
                      style:
                          GoogleFonts.acme(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.backGroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.10,
                ),
                Image.asset(
                  girlLogo,
                  height: SizeConfig.getProportionateScreenHeight(300),
                  width: SizeConfig.getProportionateScreenHeight(300),
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Text(
                  "Find out about your \n   basic, advanced point's \n      in a click",
                  style: GoogleFonts.kronaOne(
                    fontSize: 16,
                    color: ColorPalate.textColor,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                Text(
                  "Choosing the learn some important\n              point's at one place",
                  style: GoogleFonts.kronaOne(
                    fontSize: 12,
                    color: ColorPalate.subTextColor,
                  ),
                ),
                Spacer(),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorPalate.textColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    minWidth: Get.width,
                    onPressed: () {
                      Get.to(HomeScreen());
                    },
                    elevation: 5,
                    child: Text(
                      "Home",
                      style:
                          GoogleFonts.acme(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const boyLogo = "assets/images/pngimg/boylogo.png";
const girlLogo = "assets/images/pngimg/girllogo.png";
